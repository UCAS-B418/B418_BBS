from backend.model.users import Users
from backend.core.basehandler import AuthError


def check_login(username, password):
    user_obj = Users.filter_by_query(username=username).first()
    if not user_obj:
        raise AuthError("用户不存在")
    if not user_obj.check_password(password):
        raise AuthError("密码错误")
    if not user_obj.status:
        raise AuthError("账户已经停用")
    return user_obj
