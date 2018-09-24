## vue.jsについて
### vue.jsをミニマムで開始する
- `vue init webpack my-project`
- `cd my-project`
- `npm run dev`

### bootstrap-vueの導入
- `npm install --save bootstrap-vue`
- main.jsに以下を追加
```js
// bootstrap-vue
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import BootstrapVue from 'bootstrap-vue'
Vue.use(BootstrapVue)
```

### 参考リンク集
- [Vue.js公式サイト](https://jp.vuejs.org/)
- [Vue.jsについての記事](http://gihyo.jp/dev/serial/01/vuejs/0001)
