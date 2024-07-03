import datetime
from flask import current_app
from flask_mail import Message
from backend.model.users import CeleryTaskLogs
from backend.core.extensions import celery


# @celery.task()
# def send_register_mail(mail_addr, code):
#     pass


@celery.task()
def clean_celery_log():
    CeleryTaskLogs.query.filter(
        CeleryTaskLogs.done == 1,
        CeleryTaskLogs.task_status == 1,
        CeleryTaskLogs.time_modify < datetime.datetime.now() - datetime.timedelta(days=10)
    ).delete()
    return '清理成功'
