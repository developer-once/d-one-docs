# 私有 npm 搭建

> 推荐采用 [Verdaccio](https://github.com/verdaccio/verdaccio) docker 部署方式搭建
## docker 部署

下文会用到 [docker](https://dev-one.cn/#/zh-cn/devops/?id=%e5%ae%89%e8%a3%85-docker) 和 docker-compose 请先根据文档准备好环境和熟悉 [相关基础命令](https://dev-one.cn/#/zh-cn/devops/docker?id=%e5%9f%ba%e7%a1%80%e5%91%bd%e4%bb%a4)。

###  目录结构

```
├── conf                                
│   └── config.yaml                     // config.yaml 配置文件
├── plugins                             // 插件文件夹
├── storage                             // storage 文件夹 需要 chmod 777
│   ├── data                            // 存放数据的文件夹 需要 chmod 777
│   ├── htpasswd                        // password 插件文件
├── docker-compose.yml                  // docker-compose.yml 文件
```

首先新增 docker-compose.yml 文件配置，volumes 下新增 `storage` `conf` `plugins` 文件夹的映射。
```
version: '3'
services:
  verdaccio:
    image: verdaccio/verdaccio
    ports:
      - "4873:4873"
    volumes:
      - "./storage:/verdaccio/storage"
      - "./conf:/verdaccio/conf"
      - "./plugins:/verdaccio/plugins"
```

运行 `docker-compose up -d` 启动

config.yaml
```
storage: /verdaccio/storage/data
plugins: /verdaccio/plugins

auth:
  htpasswd:
    file: /verdaccio/storage/htpasswd
    # Maximum amount of users allowed to register, defaults to "+inf".
    # You can set this to -1 to disable registration.
    # max_users: -1

uplinks:
  npmjs:
    url: https://registry.npmjs.org/

packages:
  '@*/*':
    # scoped packages
    access: $all
    publish: $all
    unpublish: $all
    proxy: npmjs

  '**':
    # allow all users (including non-authenticated users) to read and
    # publish all packages
    #
    # you can specify usernames/groupnames (depending on your auth plugin)
    # and three keywords: "$all", "$anonymous", "$authenticated"
    access: $all

    # allow all known users to publish/publish packages
    # (anyone can register by default, remember?)
    publish: $all
    unpublish: $all

    # if package is not available locally, proxy requests to 'npmjs' registry
    proxy: npmjs

server:
  keepAliveTimeout: 60

middlewares:
  audit:
    enabled: true

logs: { type: stdout, format: pretty, level: http }

listen: 0.0.0.0:4873
```

## 直接安装

```shell
npm install --global verdaccio@6-next --registry https://registry.verdaccio.org/
```

安装完成后，就可以在/node/bin目录下看到一个名为verdacio的文件，这个文件实际指向的是verdaccio包下的build/lib/cli.js。

运行verdaccio:

```shell
verdaccio


# pm2 后台运行
pm2 start verdaccio
```

如果是本地安装，打开浏览器，输入 http://localhost:4873 就可以看到页面


## 使用

首先安装 nrm ，使用 nrm 管理 npm 源。

```shell
# 全局安装 nrm
npm install -g nrm

nrm ls
# 展示的 npm 源
npm ---------- https://registry.npmjs.org/
yarn --------- https://registry.yarnpkg.com/
tencent ------ https://mirrors.cloud.tencent.com/npm/
cnpm --------- https://r.cnpmjs.org/
taobao ------- https://registry.npmmirror.com/
npmMirror ---- https://skimdb.npmjs.com/registry/

# 切换源
nrm use <registry>
# nrm use taobao

# 添加私有 npm 地址
nrm add <registry> <url>
# nrm add verdaccio http://xxxxx

# 使用私有 npm 地址
nrm use verdaccio
```
