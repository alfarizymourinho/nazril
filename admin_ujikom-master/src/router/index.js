import { createRouter, createWebHistory } from "vue-router";
import Dashboard from "../views/Dashboard.vue";
import Tabel from "../views/Tables.vue";
import Template from "../views/Billing.vue";
import Profile from "../views/Profile.vue";
import Login from "../views/Signin.vue";
import store from "../store";

const merk = 'PreMu';

const routes = [
  {
    path: "/",
    name: "/",
    redirect: "/dashboard",
  },
  
  {
    path: "/dashboard",
    name: "Dashboard",
    component: Dashboard,
    meta: { title: merk + ' | ' + 'Beranda', requiresLogin: true},
  },
  {
    path: "/tabel",
    name: "Tabel",
    component: Tabel,
    meta: { title: merk + ' | ' + 'Tabel', requiresLogin: true},
  },
  {
    path: "/template",
    name: "Template",
    component: Template,
    meta: { title: merk + ' | ' + 'Template', requiresLogin: true},
  },
  {
    path: "/profil",
    name: "Profil",
    component: Profile,
    meta: { title: merk + ' | ' + 'Profil'},
  },
  {
    path: "/login",
    name: "Login",
    component: Login,
    meta: { title: merk + ' | ' + 'Login' , requiresGuest: true},
  },
  
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
  linkActiveClass: "active",
});

router.beforeEach((to, from, next) => {
  if (to.meta.requiresGuest && store.getters["auth/isAuthenticated"]) {
      next("/dashboard");
  } else{
      next();
  }
});

router.beforeEach((to, from, next) => {
  if (to.meta.requiresLogin && !store.getters["auth/isAuthenticated"]) {
    next("/login");
  } else{
      next();
  }

  if (to.meta.title) {
    document.title = to.meta.title;
  }
  next();
});

export default router;
