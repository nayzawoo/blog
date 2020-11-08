---
title: Laravel Mix Setup For Vue Async Components
date: 2018-02-26 00:13:58
tags:
---

### Install Babel Plugin For Dynamic Import Syntax

> yarn add -D babel-plugin-syntax-dynamic-import

### Create **.babelrc**

```json
{
    "plugins": ["syntax-dynamic-import"]
}
```

### Add Webpack Config in in **webpack.mix.js**

```js
mix.webpackConfig({
    output: {
        chunkFilename: 'chunks/[name].[chunkhash].js',
        publicPath: '/',
    },
});
```


### Replace Your Code

```diff
- Vue.component('example', require('./components/ExampleComponent.vue'));
+ Vue.component('example', () => import('./components/ExampleComponent.vue'));
```


### Ref:
- https://github.com/JeffreyWay/laravel-mix/issues/936
- https://github.com/JeffreyWay/laravel-mix/issues/1249