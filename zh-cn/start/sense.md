# 前端工程化的意义

> 工程化不是简单的使用工具，一切以**降低成本**和**提高效率**或**保障稳定性**做出的措施都应该被归类为前端工程化的模块中

前端工程化主要指从项目开始开发到部署线上再到后期迭代维护到这一整个过程，从工程的角度管理前端开发，形成前端开发流程的一整套开发规范或解决方案，提高前端开发效率。


<div style="text-align: center; color: #8A8F8D;">
  <img  src="https://cdn.dev-one.cn/tangzhu.png?imageMogr2/thumbnail/1000x1000"/>
  <div>@堂主 制作的前端研发流程图</div>
</div>

## 在没有工程化之前，我们遇到了什么问题

* 个人风格的代码使得维护成本大大提升
  * 缺少统一标准与最佳实践
* 大量重复的组件是在各个项目中复制粘贴使用
* 没有沉淀的工具库
  * 高频使用的函数与代码分散在各个项目中「各自实现」
  * 复制粘贴取代了团队沉淀的优质解决方案
* 项目无监控，前端对线上问题无感知
  * 埋点、监控的缺失使得前端对业务上线之后的感知变弱
* 接口 mocks 依赖前端本地手写模拟
* 大量 UI 开发占用研发时间，没有从业务中获得更高的提升
  * 急需「低代码」工具可以帮助团队解决大量重复低价值 UI 开发工作
* 团队不知道如何切入 BFF 等服务端场景

## 工程化能解决什么

前端工程化的目的 **提高前端开发效率**，**提高前端应用的可扩展性**、**可维护性** 等。

通过工程化的方案可以帮助团队解决 <blod style="color: #fa541c; font-weight: 600;">随着人员规模增加与业务复杂度上升带来的沟通与协作的效能损失</blod>，同时帮助团队提升业务吞吐量与代码质量。

<div style="text-align: center; color: #8A8F8D;">
  <img  src="https://cdn.dev-one.cn/efficiency-gap2.png?imageMogr2/thumbnail/1000x1000"/>
  <div>工程化是研发效能下降与业务复杂度提升的有效解决方案</div>
</div>


## 好的工程化应该是什么样的

<div style="text-align: center; color: #8A8F8D;">
  <img  src="https://cdn.dev-one.cn/engineering-frame.png?imageMogr2/thumbnail/1000x1000"/>
  <div>D-One 所规划的前端工程化架构</div>
</div>

* 标准化：代码、结构、commit 标准化会大大降低团队的磨合需要的时间
  * 制定 统一的 lint、pre-commit 解决大部分代码标准的问题
* 脚手架：业务与组件等需要开发的一切都不应每次从 0 开始
* 工具：基础的工具使用会大大提升日常业务场景的开发速度
  * utils  、hooks
  * component 组件库沉淀业务组件
* 质量：代码开发流程与 CR 规范会大大的提升项目的质量
* 开发：mockjs、引入监控、性能优化
* 低代码平台：将前端研发能力下发至每一个人
* 构建 & 发布：统一的构建 & 发布 平台会使得业务整体上发布流程可追溯、可回滚


## 推荐

在这里向大家推荐 D-One 的工程化全家桶套件

* one-cli：   https://github.com/developer-once/one-cli
* utils：     https://github.com/developer-once/one-utils
* 私有化监控：  https://github.com/developer-once/eagle-eye-sdk