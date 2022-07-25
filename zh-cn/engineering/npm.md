# 如何搭建私有 npm

> 本文介绍如何使用 verdaccio 搭建 npm 仓库

verdaccio 有两种安装方法，一种是直接安装，一种是用 docker 镜像。

## 直接安装


## docker 部署（推荐）

docker-compose.yml
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

verdaccio [配置项请参考链接](https://verdaccio.org/docs/configuration/)

config.yaml 👇 
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