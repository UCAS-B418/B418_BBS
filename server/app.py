import os
from flask import Flask
from server.config import DevConfig
from server.core.extensions import db, session, redis_store


def create_app():
    config_object = DevConfig

    app = Flask(__name__.split('.')[0])
    app.config.from_object(config_object)
    register_extensions(app)
    register_router(app)
    register_logging(app)
    return app

def register_extensions(app):
    db.init_app(app)
    session.init_app(app)
    redis_store.init_app(app)
    return app
 

def register_router(app):
    from server.router.v1 import routers as v1_routers
    from server.router.admin import routers as admin_routers
    for _r in v1_routers:
        app.add_url_rule(rule='/api/v1' + _r[0], view_func=_r[1].as_view(name=_r[2]))
    for _r in admin_routers:
        app.add_url_rule(rule='/api/admin' + _r[0], view_func=_r[1].as_view(name=_r[2]))
    return app


def register_logging(app):
    import logging
    from logging.handlers import RotatingFileHandler
    # Formatter
    formatter = logging.Formatter(
        '%(asctime)s %(levelname)s %(pathname)s %(lineno)s %(module)s.%(funcName)s %(message)s')

    # log dir
    if not os.path.exists(app.config['LOG_PATH']):
        os.makedirs(app.config['LOG_PATH'])

    # FileHandler Info
    file_handler_info = RotatingFileHandler(filename=app.config['LOG_PATH_FILE'])
    file_handler_info.setFormatter(formatter)
    file_handler_info.setLevel(logging.INFO)
    app.logger.addHandler(file_handler_info)
