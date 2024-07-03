from io import BytesIO
from flask import session, current_app, Response
from backend.core.viewhandler import BaseViewHandler, ApiViewHandler
from backend.core.basehandler import LogicError, VerifyError, ParamsError
from backend.core.extensions import redis_store
from backend.model.users import Users, Passport, UserFavUser
from backend.model.topics import TopicFav
from backend.model.tabs import SubTabFav
from backend.utils import need_params, login_required, generate_check_code, release_redis_lock
from .wrapper import check_login


class LoginAPI(ApiViewHandler):
    @need_params(*['username', 'password', 'code'])
    def post(self):
        code_key = f'{session.sid}:code'
        code = redis_store.get(code_key)
        if code is None or self.input.code.upper() != code.decode('utf-8'):
            raise VerifyError('图形验证码不正确,请重试')
        user_obj = check_login(username=self.input.username, password=self.input.password)
        user_dict = user_obj.to_dict(remove_fields_list=['password'])
        user_dict['fav_sub_tab_count'] = SubTabFav.filter_by_query(user_id=user_dict['id']).count()
        user_dict['fav_topic_count'] = TopicFav.filter_by_query(user_id=user_dict['id']).count()
        user_dict['fav_user_count'] = UserFavUser.filter_by_query(user_id=user_dict['id']).count()
        session['is_login'] = True
        session['role_id'] = user_dict['role_id']
        session['user_info'] = user_dict
        # add token to passport
        passport = Passport.create_or_update(
            query_dict={'user_id': user_obj.id},
            update_dict={'token': session.sid}
        )
        passport.expire = self.get_datetime_now() + current_app.config['REMEMBER_COOKIE_DURATION']
        passport.save()

        return user_dict


class LoginOutAPI(ApiViewHandler):
    @login_required()
    def get(self):
        session.clear()

    def post(self):
        return self.get()


class RegisterAPI(ApiViewHandler):
    @need_params(*['username', 'email', 'password'])
    def post(self):
        if Users.filter_by_query(username=self.input.username).all():
            raise LogicError("username重复，请使用其他username")

        if Users.filter_by_query(email=self.input.email).all():
            raise LogicError("email重复，请更换email地址或使用原地址找回密码")

        user_obj = Users.create_by_uid()
        user_obj.email =self.input.email
        user_obj.username = self.input.username
        user_obj.set_password(password=self.input.password)

        update_dict = dict()
        for k in ['sex', 'avatar_url']:
            if getattr(self.input, k) is not None:
                update_dict[k] = getattr(self.input, k)

        user_obj.update(**update_dict)
        print("create user", "*"*99)

class LoginStatusCheck(ApiViewHandler):
    def get(self):
        user_info = session.get('user_info')
        if user_info:
            user_obj = Users.get_by_id(user_info['id'])
            user_dict = user_obj.to_dict(remove_fields_list=['password'])
            user_dict['fav_sub_tab_count'] = SubTabFav.filter_by_query(user_id=user_dict['id']).count()
            user_dict['fav_topic_count'] = TopicFav.filter_by_query(user_id=user_dict['id']).count()
            user_dict['fav_user_count'] = UserFavUser.filter_by_query(user_id=user_dict['id']).count()
            session['user_info'] = user_dict
            return user_dict


class ProfileAPI(ApiViewHandler):
    @login_required()
    def get(self):
        user_obj = Users.get_by_id(session['user_info']['id'])
        user_dict = user_obj.to_dict(remove_fields_list=['password'])
        user_dict['fav_sub_tab_count'] = SubTabFav.filter_by_query(user_id=user_dict['id']).count()
        user_dict['fav_topic_count'] = TopicFav.filter_by_query(user_id=user_dict['id']).count()
        user_dict['fav_user_count'] = UserFavUser.filter_by_query(user_id=user_dict['id']).count()
        session['user_info'] = user_dict
        return user_dict

    @login_required()
    def post(self):
        user_info = session.get('user_info')
        user_obj = Users.get_by_uid(user_info['uid'])

        update_dict = dict()

        for k in ['sex', 'avatar_url', 'site', 'location', 'company', 'github', 'twitter', 'weibo', 'bio']:
            if getattr(self.input, k) is not None:
                update_dict[k] = getattr(self.input, k)
        if self.input.sex in [0, 1, 2]:
            update_dict['sex'] = self.input.sex

        if self.input.privacy_level in [0, 1, 2]:
            update_dict['privacy_level'] = self.input.privacy_level

        user_obj.update(**update_dict)
        user_info.update(update_dict)
        session['user_info'] = user_info

        return user_info


class UpdatePasswordAPI(ApiViewHandler):
    @login_required()
    @need_params(*['password', 'new_password'])
    def post(self):
        user_obj = Users.get_by_uid(session['user_info']['uid'])
        if not user_obj.check_password(self.input.password):
            raise LogicError('原密码错误!')
        user_obj.set_password(self.input.new_password)
        user_obj.save()
        # 强制下线
        token_id_list = Passport.query.with_entities(Passport.token).filter_by(user_id=user_obj.id).all()
        for _id in token_id_list:
            current_app.config['SESSION_REDIS'].delete(current_app.config['SESSION_KEY_PREFIX'] + _id[0])
        session.clear()


class GetCaptchaHandler(BaseViewHandler):
    def get(self):
        stream = BytesIO()
        img, code = generate_check_code()
        img.save(stream, 'png')
        # 验证码 60秒有效
        code_key = f'{session.sid}:code'
        redis_store.set(code_key, code, ex=60)
        return Response(stream.getvalue(), mimetype='image/png')


class CaptchaCheckAPI(ApiViewHandler):
    @need_params('code')
    def post(self):
        code_key = f'{session.sid}:code'
        code = redis_store.get(code_key)
        if code is None or self.input.code.upper() != code.decode('utf-8'):
            raise VerifyError('图形验证码不正确,请重试')


