# b418 bbs

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