# 用 one-cli 快速搭建一套自己的 cli

> 在此推荐 [one-cli](https://github.com/developer-ones/onecli) 进行自己的定制，完成自己团队专属 cli 工具的起步

## 介绍
什么是 Cli ？全称就是 command-line interface，即命令行工具，输入一行命令，通过一些交互操作，帮你搭建项目脚手架。

cli 作为项目初始化的时大幅帮助团队同学提升幸福感的工具，我们相信正在阅读这篇文章的开发者或多或少的使用过各种 cli 或者在其他的地方阅读过各种有关 cli 的文章。

但这里我们想提供一个更简单、开箱即用的工具👉  [one-cli](https://github.com/developer-ones/onecli) 。one-cli 目前支持 init 与 create 命令，作用分别为 **「项目启动时 => 创建项目模版」** 与 **「项目开发中 => 需要新页面创建模版页面 & 组件」** 的功能。这两个命令可以覆盖团队中对 cli 需求的大部分场景。

同时我们希望 one-cli 可以成为能帮助中小团队 **「解决团队工程化的第一步」**。one-cli 的另一大目地就是，将工程化能力中的 cli 工具🔧 以模版的形式提供给开发者。使开发者可以经过简单的 修改/添加模版 之后就变成能团队专属定制工具。

## 快速上手

one-cli 的使用相当简单，全局安装 one-cli 工具 ，并直接根据需要执行 init/create 命令

```
npm i @developer-ones/onecli -g

mkdir myapp && cd myapp

# 当前文件路径下 初始化项目
one init

# 当前文件路径下 创建模块
one create
```

### init
首先对 one init 功能的定义是开发者直接使用 init 命令进行项目的初始化。希望能通过 cli 这种统一的入口生成的项目，保持对团队初始化模板的统一和节省团队成员对项目初始化配置的大量时间。这样使用者无需关心模版中没有使用到的一些详细配置和细节，保持了最大程度的开箱即用，避免重复配置的工作，同时通过 cli 创建的项目省去传统

```
# 在当前目录下直接创建新项目
one init
```

![one-cli init](https://cdn.dev-one.cn/one-cli%20init.png)

one-cli 提供的 init 命令依赖于 [download-git-repo](https://www.npmjs.com/package/download-git-repo)，init 会根据使用者的输入 download 对应的代码仓库到本地。（请确保本地配置好 node 环境与 git）

## create

one create 功能主要是在开发的过程中需要添加新的 页面/组件/i18n 或其他新增文件，使用者可以通过 one create 完成对所需模块的新增

![one-cli create](https://cdn.dev-one.cn/one-cli%20create.png)


与 init 命令 不同的是，create 命令主要是直接在本地写入 template 文件夹中的内容完成的。

## 开发

我们将 one-cli 打造成一款通用的 cli 工具，目前提供 init 与 create 命令。开发者可以通过简单的修改完成自己的 cli 定制。

### 目录结构

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

以 init 为例，其主要功能在 /src/commands/init.ts 下,

1. 可以通过修改 question 中的 template 的 choices 中新增选项作为用户在执行 init 命令是交互询问时候的选择。
2. 之后在 /src/config.json 中新增对应的 choices[item].value 的配置，就可以完成对 init 命令的定制化改造，以符合开发者的团队实际需求。
3. 同时 question 中我们提供了一些项目基础信息的输入配置，可以在 question 中新增新的问题完成更适合团队需求的配置。

### bin name

bin name 是 cli 工具在使用者本地环境命令行中触发命令，可以通过 package.json 中的 bin 进行修改来实现自定义，此处可以将 "one" 修改成任意的关键词 xxx，之后在命令行中的使用就变成 xxx init 或 xxx create

![bin-name](https://cdn.dev-one.cn/bin-name.png)

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

# 如果你想发布在例如 @developer-ones 这样的公开组织下面需要携带 --access public
npm publish --access public
```
