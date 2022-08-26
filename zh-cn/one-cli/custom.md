# 定制自己的 Cli

> 在此推荐 [one-cli](https://github.com/developer-once/one-cli) 进行自己的定制，完成自己团队专属 cli 工具的起步


## 开发

我们将 one-cli 打造成一款通用的 cli 工具，目前提供 init 与 create 命令。开发者可以通过简单的修改完成自己的 cli 定制。

###  目录结构

```
├── bin                                 // bin 目录
│   └── init.js                         // 执行命令行 commander，例如 one init 、one create
├── src
│   ├── commands                        // commands 具体实现
│   │   ├── create.ts                   // create 功能
│   │   └── init.ts                     // init 功能
│   ├── config.json                     // 可以在这里新增 template address
│   ├── template                        // template file
│   │   ├── index.ts
│   │   ├── tpl-component.tsx.ts
│   │   ├── tpl-i18n.js.ts
│   │   ├── tpl-index.less.ts
│   │   ├── tpl-index.md.ts
│   │   ├── tpl-index.ts.ts
│   │   └── tpl-page.tsx.ts
│   └── utils
│       └── index.ts
```

以 `init` 功能为例，其主要功能在 /src/commands/init.ts 下,

1. 可以通过修改 question 中的 template 的 choices 中新增选项作为用户在执行 init 命令是交互询问时候的选择。
2. 之后在 /src/config.json 中新增对应的 choices[item].value 的配置，就可以完成对 init 命令的定制化改造，以符合开发者的团队实际需求。
3. 同时 question 中我们提供了一些项目基础信息的输入配置，可以在 question 中新增新的问题完成更适合团队需求的配置。

### bin name

### 测试

在完成本地开发之后执行 npm run build 打包，会在 lib 下生成打包的结果，在 cli 项目的根目录下执行 npm link 命令将本地开发包链接到全局，这样可以模拟真实发布到 npm 之后本地 install -g 的效果。

```
# 添加链接
npm link

# 验证
one -V
// 会输出 package.json 中的version: 1.0.0
// 此处有输出证明 npm link 执行成功

# 取消链接
npm unlink <package-name>
```

### 发布

在本地打包验证完之后，可以通过 npm publish 的方式发布到 私有/公共 npm 仓库中，这样你的 cli 工具就可以被其他小伙伴通过 npm 的方式安装到本地，方便的使用啦。

```
npm run build

npm publish
```
