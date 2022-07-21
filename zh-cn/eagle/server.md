# eagle-eye server

项目基于 [Egg](https://eggjs.org/zh-cn/intro/index.html) 开发，开发前请参阅 Egg 文档进行基础知识体系构建

```
$ npm i
$ npm run dev
$ open http://localhost:7001/
```

### 准备

请先阅读文档与了解如何进行 Node-Egg 项目的开发

Config: https://eggjs.org/zh-cn/basics/config.html

Router: https://eggjs.org/zh-cn/basics/router.html

Middleware : https://eggjs.org/zh-cn/basics/middleware.html

sequelize: https://eggjs.org/zh-cn/tutorials/sequelize.html


## 开发


以接口开发为例描述如何进行开发

```
--- 0. 在 config              中新增基础配置
--- 1. 在 app/router.ts       中新增 router
--- 2. 在 app/controller      下新增对应路由的文件/模块
--- 3. 在 app/service         下新增对应路由的文件/模块 完成具体业务
--- 4. 在 app/model           下新增文件对应数据库中的表
--- 5. 在 database/migrations 下新增文件对应自动创建数据库表
```

Eagle-EYE 依赖 mysql 和 redis 请先确保环境已经安装完成。数据库和配置 config/config.defauil.ts 文件

当你是第一次使用仓库的时候，应先执行数据库初始化命令，请先 [按照链接](https://eggjs.org/zh-cn/tutorials/sequelize.html) 

Docker run： 如果你是第一次在 docker 环境中跑项目的情况下需要在 **启动基础服务的同时进入docker镜像创建数据库**，sequelize只会创建表，但并不会创建数据库。进入docker环境执行文件 /mysql/init/createeyedb.sql 中的创建数据库的命令。

**请注意这里「password」替换成自己的密码，尽量使用较为复杂的密码会有助于安全**

1. docker ps -a 拿到 mysql docker ID
2. docker exec -it ID sh
3. mysql -uroot -ppassword
4. create database eagle_eye

```
// --- 初始化数据库 ---
npm install --save-dev sequelize-cli

npx sequelize init:config
npx sequelize init:migrations

// --- 执行变更数据库 ---
// --- 未创建表则会新建，创建过则忽略 ---
npx sequelize db:migrate

// --- 删除表 ---
npx sequelize db:migrate:undo:all

// --- 需要在本地操作则需先修改 ---
// database => config.json => host: eye_mysql => host: localhost
```

## 数据库

项目mysql与redis数据存放分别在根目录的 mysql/ 与 redis/ 文件夹下

#### 数据库变更与维护

如果在项目中变更了数据库且更新较大的情况下需要将数据库的表删除并重建的case，修改 Dockerfile 文件如下
```
CMD NODE_ENV=development npx sequelize db:migrate && npm run start
```

## 使用

```
1. 首先请先在 PostMan 中 创建项目请求 http://127.0.0.1:7001/api/create 然后就可以拿到 appkey 进行 SDK 上报了
{
	"name": "test"
}

2. 可以在后台生成用户 http://127.0.0.1:7001/api/create/user
{
	"name": "test",
	"email": "test@test.com",
	"password": "123456"
}

```

## 压测

压测是基于 wrk 进行的http 压测，使用 wrk 请参考文章 https://www.jianshu.com/p/ac185e01cc30

API压测文件模版 post_test

```
wrk -t12 -c100 -d30s --script=post_test.lua --latency  http://localhost:7001/report
# 12 个线程 100个连接 30秒 --latency 查看时间分布
```


## 部署

```
## docker 后台启动业务服务
docker-compose up -d

## docker 启动 base 服务
docker-compose -f docker-compose-base.yml up -d

## 获取 docker 所有容器列表(包括未运行的)
docker ps -a

## docker 登陆容器 sh
docker exec -it 3d6458a312d0 sh

## docker 移除所有容器
docker rm $(docker ps -a -q)

## docker 删除 none tag images
docker rmi $(docker images | grep "none" | awk '{print $3}')
```


#### 完整部署流程

需要提前构建 docker 镜像并上传到 docker 仓库

```
0. 确保项目本地 npm run start 可以正常启动。 （项目 TS 编写 需要 npm run tsc 才能启动 start 否则只能 npm run dev）
1. 登陆服务器 /srv/ 文件夹创建项目并在路径下创建 app/ base/ 文件夹分别用于项目与基础服务
2. scp config 文件夹至服务器
3. scp docker-componse.yml => app/
scp docker-componse-base.yml => base/
4. 分别 docker-compose up -d
```

## devOps

在 app/schedule/ 文件夹下会有定时任务，主要负责清除数据库中的存量数据

请参阅文档 https://www.eggjs.org/zh-CN/basics/schedule
