# React 代码规范

> 💪严格但是不严苛的编码规范

# 体系推荐

如果你想直接有一套严格但是不严苛的编码规范，那向你推荐使用 [umi-fabric](https://github.com/umijs/fabric)，一个包含 prettier，eslint，stylelint 的配置文件合集。开箱即用的同时，你也可以通过自定义规则符合自己的习惯。

```
npm i @umijs/fabric --save-dev
yarn add @umijs/fabric -D
```

## eslint 配置

```
# .eslintrc.js 文件配置

module.exports = {
  extends: [require.resolve('@umijs/fabric/dist/eslint')],

  rules: {
    // your rules
  },
};
```

## stylelint 配置

```
# .stylelintrc.js 文件配置
module.exports = {
  extends: [require.resolve('@umijs/fabric/dist/stylelint')],
  rules: {
    // your rules
  },
};
```

## prettier 配置

```
# .prettierrc.js 文件配置
const fabric = require('@umijs/fabric');

module.exports = {
  ...fabric.prettier,
};
```

---