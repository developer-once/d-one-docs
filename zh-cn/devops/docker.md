# docker 相关

## 基础命令

```
## docker 查看镜像列表
docker image ls

## docker 启动业务服务
docker-compose up

## docker 后台启动业务服务
docker-compose up -d

## docker 启动指定 docker.yml 服务
docker-compose -f docker-compose-base.yml up -d

## 获取 docker 进程ID
docker ps -a

## docker 干掉进程
docker rm $(docker ps -a -q)

## docker 登陆镜像 sh
docker exec -it $docker-image-id sh

## docker 删除 none tag images
docker rmi $(docker images | grep "none" | awk '{print $3}')

## docker 删除 docker-image
docker rmi $docker-image-id
```