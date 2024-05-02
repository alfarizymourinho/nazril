<template>
  <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" :class="this.$store.state.isRTL ? 'top-0 position-sticky z-index-sticky' : ''" v-bind="$attrs" id="navbarBlur" data-scroll="true">
    <div class="px-3 py-1 container-fluid">
      <breadcrumbs :currentPage="currentRouteName" textWhite="text-white" />
      <div v-if="isAuthenticated">
        <button @click="logoutWithConfirmation" type="button" class="btn btn-success">
          <i class="fas fa-sign-out-alt mr-2"></i>
          Logout
        </button>
      </div>
      <div v-else>
        <router-link to="/login"></router-link>
      </div>
    </div>
  </nav>
</template>
<script>
import Breadcrumbs from "../Breadcrumbs.vue";
import Swal from 'sweetalert2';
import { mapMutations, mapActions, mapGetters } from "vuex";

export default {
  name: "navbar",
  data() {
    return {
      showMenu: false
    };
  },
  props: ["minNav", "textWhite"],
  created() {
    this.minNav;
    setInterval(() => {
      this.checkAuthentication();
    }, 36000000);
  },
  methods: {
    ...mapMutations(["navbarMinimize", "toggleConfigurator"]),
    ...mapActions(["toggleSidebarColor"]),
    ...mapActions('auth', ['logout']),

    async logoutWithConfirmation() {
      const result = await Swal.fire({
        title: 'Yakin untuk Logout?',
        icon: 'warning',
        timer: 3000,
        timerProgressBar: true,
        showConfirmButton: true,
        confirmButtonColor: '#28a745',
        confirmButtonText: 'Ya, Logout!'
      });

      if (result.isConfirmed) {
        this.logout();
        Swal.fire({
          title: 'LogOut Sukses!',
          text: 'Sampai Jumpa Kembali.',
          icon: 'success',
          showConfirmButton: false,
          timer: 1500,
          timerProgressBar: true,
        });
      }
    },
    toggleSidebar() {
      this.toggleSidebarColor("bg-white");
      this.navbarMinimize();
    },
    checkAuthentication() {
      const lastLoginTime = this.$store.state.auth.lastLoginTime;
      if (this.isAuthenticated && this.expireLogin(lastLoginTime)) {
        this.logoutWithConfirmation();
        this.$router.push("/signin");
      }
    },
  },
  components: {
    Breadcrumbs
  },
  computed: {
    ...mapGetters('auth', ['isAuthenticated'],),
    currentRouteName() {
      return this.$route.name;
    }
  }
};
</script>