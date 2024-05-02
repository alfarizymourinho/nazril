<template>
    <nav class="navbar navbar-expand-lg top-0 z-index-3 position-absolute mt-4"
        :class="isBlur ? isBlur : 'shadow-none my-2 navbar-transparent w-100'">
        <div class="container ps-2 pe-0">
            <router-link class="navbar-brand font-weight-bolder ms-0 ms-lg-3"
                :class="darkMode ? 'text-black' : 'text-white'" to="/beranda">PreMu</router-link>
            <ul class="navbar-nav d-lg-block d-none">
                <li class="nav-item ms-auto">
                    <a href="https://www.creative-tim.com/product/vue-argon-dashboard" class="btn btn-sm mb-0 me-1" :class="isBtn">Dapatkan Aplikasi</a>
                </li>
            </ul>
        </div>
    </nav>
</template>
<script>
import downArrWhite from "@/assets/img/down-arrow-white.svg";
import downArrBlack from "@/assets/img/down-arrow-dark.svg";

export default {
    name: "navbar",
    data() {
        return {
            downArrWhite,
            downArrBlack
        };
    },
    props: {
        btnBackground: String,
        isBlur: String,
        isBtn: { type: String, default: "bg-gradient-light" },
        darkMode: {
            type: Boolean,
            default: false
        }
    },
    computed: {
        darkModes() {
            return {
                "text-dark": this.darkMode
            };
        }
    }
};
</script>