<template>
  <div class="container top-0 position-sticky z-index-sticky">
    <div class="row">
      <div class="col-12">
        <navbar isBlur="blur  border-radius-lg my-3 py-2 start-0 end-0 mx-4 shadow" v-bind:darkMode="true"
          isBtn="bg-gradient-success" />
      </div>
    </div>
  </div>
  <main class="mt-0 main-content">
    <section>
      <div class="page-header min-vh-100">
        <div class="container">
          <div class="row">
            <div class="mx-auto col-xl-4 col-lg-5 col-md-7 d-flex flex-column mx-lg-0">
              <div class="card card-plain">
                <div class="pb-0 card-header text-start">
                  <h4 class="font-weight-bolder">Login</h4>
                  <p class="mb-0">Mohon masukan Email dan Password untuk masuk</p>
                </div>
                <div class="card-body">
                  <form @submit.prevent="performLogin" role="form">
                    <div class="input-group flex-nowrap mb-3">
                      <span class="input-group-text" id="addon-wrapping">
                        <img src="../assets/img/email.png" alt="User Icon" width="28" height="28">
                      </span>
                      <input v-model="email" type="email" id="email" class="form-control" placeholder="Email"
                        aria-label="Username" aria-describedby="addon-wrapping">
                    </div>
                    <div class="input-group flex-nowrap mb-3">
                      <span class="input-group-text" id="addon-wrapping">
                        <img src="../assets/img/padlock.png" alt="User Icon" width="28" height="28">
                      </span>
                      <input v-model="password" type="Password"
                        class="origin-[0] peer-placeholder-shown:top-1/2 peer-placeholder-shown:-translate-y-1/2 peer-placeholder-shown:scale-100 peer-focus:top-2 peer-focus:-translate-y-4 peer-focus:scale-75 peer-focus:px-2 peer-focus:text-blue-600 absolute left-1 top-2 z-10 -translate-y-4 scale-75 transform cursor-text select-none bg-white px-2 text-sm text-gray-500 duration-300 form-control"
                        placeholder="Password" aria-label="Password" aria-describedby="addon-wrapping">
                    </div>
                    <div class="text-center">
                      <div class="mb-4">
                        <button class="btn btn-primary btn-lg w-100" type="submit">Login</button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <div
              class="top-0 my-auto text-center col-6 d-lg-flex d-none h-100 pe-0 position-absolute end-0 justify-content-center flex-column">
              <div
                class="position-relative bg-gradient-primary h-100 m-3 px-7 border-radius-lg d-flex flex-column justify-content-center overflow-hidden"
                style="background-image: url('https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/signin-ill.jpg'); background-size: cover;">
                <span class="mask bg-gradient-success opacity-6"></span>
                <h4 class="mt-5 text-white font-weight-bolder position-relative">"Attention is the new currency"</h4>
                <p class="text-white position-relative">The more effortless the writing looks, the more effort the writer
                  actually put into the process.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
</template>
<script>
import Swal from 'sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';
import { mapActions, mapGetters } from 'vuex';
import Navbar from "@/examples/PageLayout/Navbar.vue";
const body = document.getElementsByTagName("body")[0];

export default {
  name: "signin",
  components: {
    Navbar,
  },
  data() {
    return {
      email: "",
      password: "",
    };
  },
  created() {
    this.$store.state.hideConfigButton = true;
    this.$store.state.showNavbar = false;
    this.$store.state.showSidenav = false;
    this.$store.state.showFooter = false;
    body.classList.remove("bg-gray-100");
  },
  beforeUnmount() {
    this.$store.state.hideConfigButton = false;
    this.$store.state.showNavbar = true;
    this.$store.state.showSidenav = true;
    this.$store.state.showFooter = true;
    body.classList.add("bg-gray-100");
  },
  computed: {
    ...mapGetters('auth', ['isAuthenticated']),
  },
  methods: {
    ...mapActions('auth', ['login']),
    async performLogin() {
      const credentials = {
        email: this.email,
        password: this.password,
      };

      const success = await this.login(credentials);

      if (success && this.isAuthenticated) {
        let timerInterval;
        Swal.fire({
          title: "Mohon tunggu sebentar!",
          html: "Mengecek autentikasi <b></b> detik.",
          timer: 3000,
          timerProgressBar: true,
          showConfirmButton: false,
          didOpen: () => {
            Swal.showLoading();
            const timer = Swal.getPopup().querySelector("b");
            timerInterval = setInterval(() => {
              timer.textContent = `${Swal.getTimerLeft()}`;
            }, 100);
          },
          willClose: () => {
            clearInterval(timerInterval);
          },
        }).then(() => {
          this.$router.push('/dashboard');
          Swal.fire({
            title: 'Selamat Datang!',
            text: 'Selamat datang di Admin LTE PreMu.',
            icon: 'success',
            confirmButtonText: 'Oke',
          });
        });
      } else {
        Swal.fire({
          title: "Internet?",
          text: "Sepertinya server Error?",
          icon: "question"
        });
      }
    },
  },
};
</script>