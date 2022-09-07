# one-cli

## 介绍

什么是 Cli ？全称就是 command-line interface，即命令行工具，输入一行命令，通过一些交互操作，帮你搭建项目脚手架。

cli 作为项目初始化的时大幅帮助团队同学提升幸福感的工具，我们相信正在阅读这篇文章的开发者或多或少的使用过各种 cli 或者在其他的地方阅读过各种有关 cli 的文章。

但这里我们想提供一个更简单、开箱即用的工具👉  [one-cli](https://github.com/developer-once/one-cli) 。one-cli 目前支持 init 与 create 命令，作用分别为 **「项目启动时 => 创建项目模版」** 与 **「项目开发中 => 需要新页面创建模版页面 & 组件」** 的功能。这两个命令可以覆盖团队中对 cli 需求的大部分场景。

同时我们希望 one-cli 可以成为能帮助中小团队 <span style="color: #fa541c; font-weight: 600;">解决团队工程化的第一步</span>。one-cli 的另一大目地就是，将工程化能力中的 cli 工具🔧 以模版的形式提供给开发者。使开发者可以经过简单的 修改/添加模版 之后就变成能团队专属定制工具。

## 快速上手

one-cli 的使用相当简单，全局安装 one-cli 工具 ，并直接根据需要执行 init/create 命令

```bash
npm i @developer-ones/onecli -g

mkdir myapp && cd myapp

# 当前文件路径下初始化项目
one init

# 当前文件路径下创建模块
one create

```

### init

首先对 `one-cli init` 功能的定义是开发者直接使用 init 命令进行项目的初始化。希望能通过 cli 这种统一的入口生成的项目，保持对团队初始化模板的统一和节省团队成员对项目初始化配置的大量时间。

<div style="text-align: center; color: #8A8F8D;">
  <img  src="https://cdn.dev-one.cn/one-cli%20init.png?imageMogr2/thumbnail/600x600"/>
  <div>one init 在当前路径下初始化项目</div>
</div>

one-cli 提供的 `init` 命令依赖于 [download-git-repo](https://www.npmjs.com/package/download-git-repo) 会根据使用者的选择 download 对应的代码仓库到本地。（请确保本地配置好 node 环境与 git）


### create

`one create` 功能定位主要是在开发的过程中需要添加新的 页面/组件/i18n 或其他新增文件，使用者可以通过 `one create` 完成对所需模块的新增。

<div style="text-align: center; color: #8A8F8D;">
  <img  src="https://cdn.dev-one.cn/one-cli%20create.png?imageMogr2/thumbnail/600x600"/>
  <div>one create 在当前路径下创建对应模块</div>
</div>