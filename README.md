# super-bbs
一个基于Flask的bbs论坛类项目
前端有用户和管理员两套界面

生产环境启动命令:

```bash
# redis
# 添加下载源
sudo apt install lsb-release curl gpg
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
sudo apt-get update
# 下载
sudo apt-get install redis
# 启动服务
service redis-server start

# 安装mysql
sudo apt update
sudo apt install mysql-server

# 安装node和yarn
# node v14.16.0
# yarn v1.22.22
# npm v6.14.11
sudo apt install nodejs
npm install -g yarn

## ------------------------------------------- ##

# backend
conda create -n sb python=3.6
conda activate sb
pip install -r requirements.txt
./run.sh

# frontend(user)
cd web
yarn install
yarn run serve

# frontend(admin)
cd webAdmin
yarn install
yarn run serve
```

# 最新更新请到 https://github.com/lgphone/super-bbs

### 声明： 严重高仿(照抄)V2EX
### 开发原因： 前后端分离，替换原来的FakeV2EX项目
### 用户界面图片展示：

![](https://gitee.com/YangEver/super-bbs/raw/master/docs/pic/bbs1.png)

![](https://gitee.com/YangEver/super-bbs/raw/master/docs/pic/bbs2.png)

![](https://gitee.com/YangEver/super-bbs/raw/master/docs/pic/bbs3.png)

![](https://gitee.com/YangEver/super-bbs/raw/master/docs/pic/bbs6.png)

![](https://gitee.com/YangEver/super-bbs/raw/master/docs/pic/bbs7.png)

![](https://gitee.com/YangEver/super-bbs/raw/master/docs/pic/bbs8.png)

![](https://gitee.com/YangEver/super-bbs/raw/master/docs/pic/bbs9.png)

![](https://gitee.com/YangEver/super-bbs/raw/master/docs/pic/bbs10.png)

![](https://gitee.com/YangEver/super-bbs/raw/master/docs/pic/bbs11.png)

![](https://gitee.com/YangEver/super-bbs/raw/master/docs/pic/bbs12.png)

![](https://gitee.com/YangEver/super-bbs/raw/master/docs/pic/bbs13.png)

![](https://gitee.com/YangEver/super-bbs/raw/master/docs/pic/bbs14.png)


## 管理界面图片展示：

![](https://gitee.com/YangEver/super-bbs/raw/master/docs/pic/admin1.png)

![](https://gitee.com/YangEver/super-bbs/raw/master/docs/pic/admin2.png)

![](https://gitee.com/YangEver/super-bbs/raw/master/docs/pic/admin3.png)

![](https://gitee.com/YangEver/super-bbs/raw/master/docs/pic/admin4.png)

![](https://gitee.com/YangEver/super-bbs/raw/master/docs/pic/admin5.png)

![](https://gitee.com/YangEver/super-bbs/raw/master/docs/pic/admin6.png)
