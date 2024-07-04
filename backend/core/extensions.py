from flask_sqlalchemy import SQLAlchemy
from flask_session import Session
from flask_redis import FlaskRedis

db = SQLAlchemy()
session = Session()
redis_store = FlaskRedis()
