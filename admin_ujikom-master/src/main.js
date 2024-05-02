import { createApp } from 'vue';
import App from './App.vue';
import store from './store';
import router from './router';
import './assets/css/nucleo-icons.css';
import './assets/css/nucleo-svg.css';
import ArgonDashboard from './argon-dashboard';
import 'core-js/stable';
import 'regenerator-runtime/runtime';

const app = createApp(App);

app.use(store);
app.use(router);
app.use(ArgonDashboard);

app.mount('#app');