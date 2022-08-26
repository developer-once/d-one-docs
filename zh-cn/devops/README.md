# 环境配置

## 安装 Node

```shell
# 下载
wget https://nodejs.org/dist/v12.18.1/node-v12.18.1-linux-x64.tar.xz

# 解压
tar xf node-v12.18.1-linux-x64.tar.xz

# 进入解压目录
cd node-v12.18.1-linux-x64

# 获取 node 文件夹的路径
pwd

# 编辑 profile 
sudo vim /etc/profile
# 在最下面添加 export PATH=$PATH: 后面跟上 node 下 bin 目录的路径 由上面 pwd 获得的路径
# export PATH=$PATH:/bin

# 立即生效
source /etc/profile

# 验证
node -v
```

## 安装 Docker

```shell
# 安装依赖包
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# 设置阿里云镜像源
sudo yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

# 安装 Docker-CE
sudo yum install docker-ce


# 开机自启
sudo systemctl enable docker 
# 启动docker服务  
sudo systemctl start docker
```

## 安装 docker-compose

```shell
# py 下载安装
yum install docker-compose

# daocloud下载 比较快
sudo curl -L https://get.daocloud.io/docker/compose/releases/download/1.25.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
```
