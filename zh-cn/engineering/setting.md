# 环境搭建

介绍如何在服务器环境搭建工程化所需环境

## Node

```
# 下载 node
wget https://nodejs.org/dist/v12.18.1/node-v12.18.1-linux-x64.tar.xz
tar xf node-v12.18.1-linux-x64.tar.xz 
cd node-v12.18.1-linux-x64 
```

然后 vim /etc/profile，在最下面添加 export PATH=$PATH: 后面跟上 node 下 bin 目录的路径

```
export PATH=$PATH:/root/node-v12.18.1-linux-x64/bin

# 立即生效
source /etc/profile

# 查看 node
node -v
```

## docker

```
# 安装依赖包
sudo yum install -y yum-utils device-mapper-persistent-data lvm2 

# 设置阿里云镜像源
sudo yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo 

# 安装 docker-ce
sudo yum install docker-ce

# 开机自启
sudo systemctl enable docker 
# 启动docker服务  
sudo systemctl start docker
```



```
# 加速器地址 ：
# 阿里云控制台搜索容器镜像服务
# 进入容器镜像服务， 左侧最下方容器镜像服务中复制加速器地址
sudo mkdir -p /etc/docker
vim /etc/docker/daemon.json


# {
#  "registry-mirrors": ["你的加速器地址"]
# }

# 重启docker
sudo systemctl daemon-reload
sudo systemctl restart docker
```


## docker-compose

```
# py 下载安装
yum install docker-compose

# daocloud下载 比较快
sudo curl -L https://get.daocloud.io/docker/compose/releases/download/1.25.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
```