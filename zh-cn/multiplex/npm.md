# 私有 npm 搭建

> 采用 [Verdaccio](https://github.com/verdaccio/verdaccio) Docker 部署方式搭建



## 直接安装

```
npm install --global verdaccio@6-next --registry https://registry.verdaccio.org/
```

安装完成后，就可以在/node/bin目录下看到一个名为verdacio的文件，这个文件实际指向的是verdaccio包下的build/lib/cli.js。

运行verdaccio:

```
verdaccio


# pm2 后台运行
pm2 start verdaccio
```

如果是本地安装，打开浏览器，输入 http://localhost:4873 就可以看到页面

## Docker 部署

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
