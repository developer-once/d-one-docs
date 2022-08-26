# Code review 标准

## Review 标准
* 提交 review 前请务必仔细阅读自己修改的模块和设计到相关业务的影响，不要将未经开发者自查的代码提交 review
* 如有必要请写清楚注释，需要做到 review 审核者能清晰理解当前修改的程度
* 如有必要请在 commit 中标注具体哪个需求的开发任务，参考 comment #issue_ident
* 请保障在提交 review 之前运行测试，或完成自测，已减少重复提交 review 的情况
* 请不要选择超过 4个 的评审员，过多的人员的评审绝对弊大于利
* 评审员的选择如果可以尽量保持 2资深 + 1初级，资深程序员能对你的代码提供建议，初级程序员能从 review 中快速得到成长和熟悉项目
* Code review 绝对优先，我们提倡的准则是当团队中出现 code review 的时候往往是团队成员完成某项功能需要发布或其他的紧急情况，请保持在收到 review 的当天半天时间内优先处理 review
* Show Code 我们推荐每周在周会上抽出当周最佳 code review 和 bad case，直面问题会让团队中每一个成员快速成长

![](https://cdn.dev-one.cn/code-review.png?imageMogr2/thumbnail/1000x1000)


## 分支管理

### 版本管理

* 前后端分离发布
* master 分支受到保护且仅来源于 release 分支
* release 作为发布分支，且仅接受 daily 分支代码 merge 发布
* hotfix 可作为紧急发布分支，需要在发布之后 review merge 进 release 分支
* daily 作为 日常/版本 功能开发使用，每次迭代需要从 master checkout 出来新版本，daily 分支代码来源于 dev 分支的 merge
* dev 分支从 daily 分支切出可作为迭代内功能多个开发者相互 review

![](https://cdn.dev-one.cn/merge-code.png?imageMogr2/thumbnail/1000x1000)


## Commit 规范

建议按照如下规则提供每次 commit 信息


![](https://cdn.dev-one.cn/git-commit.png?imageMogr2/thumbnail/1000x1000)