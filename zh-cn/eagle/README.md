# Eagle-eye

Eagle-eye 是一款全埋点的监控 SDK，只需简单的引入和传入配置便可以在项目中一键接入。

## 接入方式

### Npm

只需要引入并初始化， SDK 就会开始进行默认的全埋点监控。对用户的点击事件进行上报，以及默认使用。

```js
// npm install package
npm install eagle-eye-sdk -S

// app.ts
import { initMonitor } from 'eagle-eye-sdk';
const monitor = initMonitor({
  app_key: "appkey",
  startTime: new Date().getTime(),
  record: false,
  // --- 是否监听全局点击事件 ---
  globalClick: false,
  // --- 自动发送 pv ---
  autoSendPv: true,
  // --- 是否监听资源 ---
  sendResource: false,
})

// 销毁
// monitor.destory()

function App() {}
export default App
```

### oss 接入

```html
<!-- crossorigin="anonymous" 是必须的 -->
<script crossorigin="anonymous" src="./eagle-eye.js"></script>
<script>
  var config = {
    url: "https://dev-ones.cn/api/report",
    app_key: "appkey",
    startTime: new Date().getTime(),
    record: false,
    globalClick: false,
    autoSendPv: true,
    sendResource: false,
  };
  
  window.monitor = window.eagleEye.initMonitor(config);
</script>
```