# Nginx 相关

## 安装

```
sudo yum install -y nginx
```

## 基础命令

```shell
# 刚安装 启动
systemctl start nginx.service

# 开机启动
sudo systemctl enable nginx.service

# 启动 重启 停止 start reload stop
systemctl reload nginx

# 输出配置文件
nginx -t
```

## nginx 配置维护

由于 nginx 是可以通过 `include` 的方式将配置文件引入的，所以推荐将 nginx.conf 中针对业务模块的配置拆到单独的文件中方便维护和查看。

```
# /etc/nginx/nginx.conf
http {
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 4096;

    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;

    # Load modular configuration files from the /etc/nginx/conf.d directory.
    # See http://nginx.org/en/docs/ngx_core_module.html#include
    # for more information.
    include /etc/nginx/conf.d/*.conf;

    # --------------------------------- root ---------------------------------
    include /etc/nginx/conf_nginx/nginx_root.conf;

    # --------------------------------- eagle ---------------------------------
    include /etc/nginx/conf_nginx/nginx_eagle.conf;

    # --------------------------------- utils ---------------------------------
    include /etc/nginx/conf_nginx/nginx_utils.conf;
}
```

/etc/nginx/conf_nginx/nginx_root.conf 文件

```
# --------------------------------- root ---------------------------------
server {
  listen 80;
  server_name dev-one.cn;

  location / {
    proxy_pass http://localhost:3000;
    proxy_set_header Host $proxy_host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }
}
```