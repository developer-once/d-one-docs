# Code Lint 规范推荐

## CSS 代码规范

Those layers are:

![](https://cdn.dev-one.cn/css-lint.jpeg?imageMogr2/thumbnail/1000x1000)

* Settings – used with preprocessors and contain font, colors definitions, etc.
* Tools – globally used mixins and functions. It’s important not to output any CSS in the first 2 layers.
* Generic – reset and/or normalize styles, box-sizing definition, etc. This is the first layer which generates actual CSS.
* Elements – styling for bare HTML elements (like H1, A, etc.). These come with default styling from the browser so we can redefine them here.
* Objects – class-based selectors which define undecorated design patterns, for example the media object known from OOCSS
* Components – specific UI components. This is where most of our work takes place. We often compose UI components of Objects and Components
* Utilities – utilities and helper classes with ability to override anything which goes before in the triangle, e.g. hide helper class