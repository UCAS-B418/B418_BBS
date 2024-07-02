import requests
import json

api_key = "ruYRm24ncaYfWgu7jmZH03L4"
secret_key = "XMhzFtXxnsUzSKL1670IAV2GDjlUURXk"

def get_access_token():
    """
    使用 API Key，Secret Key 获取access_token，替换下列示例中的应用API Key、应用Secret Key
    """
    url = "https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id=%s&client_secret=%s"%(api_key, secret_key)
    
    payload = json.dumps("")
    headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
    }
    
    response = requests.request("POST", url, headers=headers, data=payload)
    return response.json().get("access_token")

class Assistant():
    def __init__(self) -> None:
        self.url = "https://aip.baidubce.com/rpc/2.0/ai_custom/v1/wenxinworkshop/chat/ernie_speed?access_token=" + get_access_token()
        self.headers = {
            'Content-Type': 'application/json'
        }



    def ask(self, content: str, topic_uid: str):
        # 组装message
        message = []
        message.append({
            "role": "user",
            "content": content
        })

        # 发送post
        payload = json.dumps({
            "messages": message
        })
        response = requests.request("POST", self.url, headers=self.headers, data=payload)
        res = response.json()["result"]
        return res

if __name__ == '__main__':
    a = Assistant()
    a.ask("接下来会有若干个人与你对话，与你对话的人的名字会被提前列在对话内容的前面，\
          比如张三与你说“你好。”，你接受到的消息就是：张三：你好。你只需要回答最后一个问你的人，\
          在回答时，你需要使用@符号来提到你回答的人，比如你要回答张三，你就说：“@张三 你好！”。\
          请记住，你接下来要参与一场多人对话，你回答是需要使用@符号来提到你回答的人。")
    q = ""
    while q != "exit":
        q = input()
        answer = a.ask(q)
        print(answer)