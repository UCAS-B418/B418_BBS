from server.controller.admin.account.api import LoginAPI, LoginOutAPI, LoginStatusCheck
from server.controller.admin.users.api import UserAPI
from server.controller.admin.tabs.api import TabAPI, SubTabAPI
from server.controller.admin.topics.api import TopicAPI
from server.controller.admin.comments.api import CommentAPI


routers = [
    # account
    ('/account/login', LoginAPI, 'admin_account_login'),
    ('/account/logout', LoginOutAPI, 'admin_account_logout'),
    ('/account/check', LoginStatusCheck, 'admin_account_login_status_check'),
    # user
    ('/user', UserAPI, 'admin_user'),
    # tab
    ('/tab', TabAPI, 'admin_tab'),
    # sub_tab
    ('/sub_tab', SubTabAPI, 'admin_sub_tab'),
    # topic
    ('/topic', TopicAPI, 'admin_topic'),
    # comment
    ('/comment', CommentAPI, 'admin_comment')
]
