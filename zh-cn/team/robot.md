# 创建自己的周报机器人🤖️

以我们自己的 egg.schedule 为例子🌰 展示如何创建一个每周自动播报的机器人🤖️。

```js
const Subscription = require('egg').Subscription;
import axios from 'axios';

class UpdateCache extends Subscription {
  // 通过 schedule 属性来设置定时任务的执行间隔等配置
  static get schedule() {
    return {
      interval: '7d', // 7 天间隔
      type: 'all', // 指定所有的 worker 都需要执行
      immediate: true, // 启动的时候立即执行一次
    };
  }

  // subscribe 是真正定时任务执行时被运行的函数
  // 获取语雀上周刊的地址并发送
  async subscribe() {
    const res = await axios.get('https://www.yuque.com/api/books/1823171/docs?include_catalog_node_uuid=true&include_contributors=true&include_hits=true&limit=20&offset=0').then((res) => {
      return res.data
    });
    const res1: any = await axios.get('https://www.yuque.com/api/books/597436/docs?include_catalog_node_uuid=true&include_contributors=true&include_hits=true&limit=20&offset=0').then((res) => {
      return res.data
    });
    const ali_current_weekly = res.data[0];
    const ux_weekly = res1.data[0];
    const data = {
      msgtype: "markdown",
      markdown: {
        content: `前端团队 <font color=\"warning\">Weekly Blog</font> 播报\n
         >潮流最前端:<font color=\"comment\">[${ali_current_weekly.title}](https://www.yuque.com/alibabaf2e/weekly/${ali_current_weekly.slug})</font>
         >体验碎周报:<font color=\"comment\">[${ux_weekly.title}](https://www.yuque.com/ftium4/gs2tgp/${ux_weekly.slug})</font>
         >其他:<font color=\"comment\">本周大事！</font>`
      },
      title: ali_current_weekly.title,
      link: `https://www.yuque.com/alibabaf2e/weekly/${ali_current_weekly.slug}`,
    }
    await axios.post("机器人地址", data);
  }
}

module.exports = UpdateCache;
```