FROM node:latest

LABEL description="Eagle-eye-docs"

WORKDIR /docs

COPY . /docs

RUN npm install docsify-cli@latest -g --registry=https://registry.npm.taobao.org

EXPOSE 3000

CMD docsify serve .