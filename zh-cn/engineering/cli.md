# 用 one-cli 快速搭建一套自己的 cli


我们希望 [one-cli](https://github.com/developer-ones/onecli) 可以成为能帮助中小团队解决团队工程化的**第一步**， one-cli 的目的是方便的将工程化能力中的 cli 工具🔧 以模版的形式提供给开发者，使得开发者可以对 one-cli **经过简单的 修改/添加模版 之后就变成团队的专属工具**。

----

## 快速上手

one-cli 的使用相当简单，首先全局安装 one-cli 工具 ，并直接根据需要执行 init/create 命令

```
npm i @developer-ones/onecli -g

mkdir myapp && cd myapp
```

### init

首先对 `one init` 功能的定义是开发者直接使用 `init` 命令进行项目的初始化。希望能通过  `one init` 命令保持对团队初始化模板的统一和节省团队成员对项目初始化配置的大量时间。


```
# 在当前目录下直接创建新项目
one init
```

![one-cli init](https://cdn.dev-one.cn/one-cli%20init.png)

one-cli 提供的 `init` 命令依赖于 [download-git-repo](https://www.npmjs.com/package/download-git-repo)，`init` 会根据使用者的输入 download 对应的代码仓库到本地。（请确保本地配置好 node 环境与 git）

### create

`one create` 功能主要是在开发的过程中需要添加新的 页面/组件/i18n 或其他新增文件，使用者可以通过 `one create` 完成对所需模块的新增

![one-cli create](https://cdn.dev-one.cn/one-cli%20create.png)

与 `init` 命令 不同的是，`create` 命令主要是直接在本地写入 template 文件夹中的内容完成的。



## 开发

我们将 one-cli 打造成一款通用的 cli 工具，目前提供 `init` 与 `create` 命令。开发者可以通过简单的修改完成自己的 cli 定制

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

以 `init` 为例，其主要功能在 /src/commands/init.ts 下, 

1. 可以通过修改 question 中的 template 的 choices 中新增选项作为用户在执行 init 命令是交互询问时候的选择。
2. 之后在 /src/config.json 中新增对应的 choices[item].value 的配置，就可以完成对 `init` 命令的定制化改造，以符合开发者的团队实际需求。



### 修改 bin name

bin name 是 cli 工具在使用者本地环境命令行中触发命令，可以通过 package.json 中的 bin 进行修改来实现自定义
