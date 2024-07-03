import os

BASE_DIR = os.path.abspath(os.path.dirname(__file__))



# 释放锁lua脚本
release_lock_script = """
if redis.call('get', KEYS[1]) == ARGV[1] 
    then 
        return redis.call('del', KEYS[1]) 
    else 
        return 0
end
"""

default_password = '114514'
