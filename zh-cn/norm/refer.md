
# 可参考规范

## 1.命名规范

### 1.1 组件命名

组件使用 PascalCase 命名，以 jsx 或 tsx 为后缀

```
# 组件通常存放于和该组件同名的文件夹下面，以 index.ts 导出组件
# Test/index.ts
import { lazy } from 'react'
export default lazy(() => import('./Test'))


# Test/Test.t(j)sx
const TestFC: React.FC = () => {}
export default TestFC;
```

### 1.2 Props 命名
Props 的命名建议以最简单的使用方式来，以便于区分功能例如 onXXX 形式作为回调属性名称。
```js
# Props 的 interface 以 I 开头 + 组件 Name + Props
interface ISelectComponentProps {
  onClick: () => void;
  onChange: (value: string) => void;
}

const SelectComponent = (props: ISelectComponentProps) => {}
```

## 2.Hooks 规范

### 2.1 Hooks 命名

```
// good
useMounted.js
useUnmount.js

// bad
myAwesomeHook.js
```

### 2.2 只在最顶层使用 Hook

<blod style="color: #fa541c; font-weight: 600;">不能在循环、条件语句或嵌套函数中调用 Hook ！！！</blod> 确保 Hook 在每一次渲染中都按照同样的顺序被调用。这让 React 能够在多次的 useState 和 useEffect 调用之间保持 hook 状态的正确。

```
# bad
if (name !== '') {
  useEffect(function persistForm() {
    localStorage.setItem('formData', name);
  });
}

# good
useEffect(function persistForm() {
  if (name !== '') {
    localStorage.setItem('formData', name);
  }
});
```

### 2.3 只在 React 函数中调用 Hook

## 3.代码规范

## 4.其他

**4.1【强制】使用懒加载而不是直接导出**
```
// good
const MyAwesomeComponent = React.lazy(() => import('@/components/MyAwesomeComponent'));

// bad
import MyAwesomeComponent from '@/components/MyAwesomeComponent';
```