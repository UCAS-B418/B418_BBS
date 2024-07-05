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

# 安装 nvm node版本管理工具
cd nvm
bash install.sh
source ~/.bashrc
# 安装 nodejs
nvm install 14.16.0
# 查看 nodejs及nmp版本
# node -v
# npm -v

# 安装 yarn
npm install -g yarn

## ------------------------------------------- ##

# backend 后端
conda create -n b418_bbs python=3.6
conda activate b418_bbs
pip install -r requirements.txt
./run.sh

# 启动 frontend(user)
cd vueUser
yarn install
yarn run serve
# 地址

# 启动 frontend(admin)
cd vueAdmina
yarn install
yarn run serve
```
