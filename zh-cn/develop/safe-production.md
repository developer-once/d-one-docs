# 前端安全生产

##  error-boundary

为了避免部分 UI 的 JavaScript 异常错误导致整个应用崩溃，react 在 16 引入了一个新的概念 —— 错误边界。

错误边界是一种 React 组件，这种组件可以捕获发生在其子组件树任何位置的 JavaScript 错误，并打印这些错误，同时展示降级 UI，而并不会渲染那些发生崩溃的子组件树。错误边界可以捕获发生在整个子组件树的渲染期间、生命周期方法以及构造函数中的错误。

