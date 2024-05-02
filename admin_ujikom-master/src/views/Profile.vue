<template>
  <main>
    <div class="py-4 container-fluid" v-for="user in getUser" :key="user.id_user">
      <div class="row">
        <div class="col-md-8">
          <div class="card">
            <div class="card-header pb-0">
              <div class="d-flex align-items-center">
                <p class="mb-0">Edit Profile</p>
                <argon-button color="success" size="sm" class="ms-auto" @click="saveProfile">Simpan</argon-button>
              </div>
            </div>
            <div class="card-body">
              <div class="row">
                <div class="col-md-6">
                  <label for="username-input" class="form-control-label">Username</label>
                  <input class="form-control" id="username-input" type="text" v-model="user.name" />
                </div>
                <div class="col-md-6">
                  <label for="email-input" class="form-control-label">Email</label>
                  <input class="form-control" id="email-input" type="email" v-model="user.email" />
                </div>
                <p></p>
                <div class="col-md-6">
                  <label for="firstName-input" class="form-control-label">First Name</label>
                  <input class="form-control" id="firstName-input" type="text" v-model="user.firstName" />
                </div>
                <div class="col-md-6">
                  <label for="lastName-input" class="form-control-label">Last Name</label>
                  <input class="form-control" id="lastName-input" type="text" v-model="user.lastName" />
                </div>
                <p></p>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <profile-card />
        </div>
      </div>
    </div>
  </main>
</template>
<script>
import setNavPills from "@/assets/js/nav-pills.js";
import setTooltip from "@/assets/js/tooltip.js";
import ProfileCard from "./components/ProfileCard.vue";
import { mapActions, mapGetters } from 'vuex';

const body = document.getElementsByTagName("body")[0];

export default {
  name: "profile",
  data() {
    return {
      showMenu: false
    };
  },
  computed: {
    ...mapGetters('user', ['getUser']),
  },
  methods: {
    ...mapActions('user', ['fetchUser']),
    saveProfile() {
      // Implement the logic to save the edited profile
      // You may need to dispatch an action to update the profile on the server
    },
  },
  components: { 
    ProfileCard
  },
  async mounted() {
    this.$store.state.isAbsolute = true;
    setNavPills();
    setTooltip();
    const user = await this.fetchUser();

    if (user) {
      this.$store.commit('user/SET_USER', user);
    }
  },
  beforeMount() {
    this.$store.state.imageLayout = "profile-overview";
    this.$store.state.showNavbar = false;
    this.$store.state.showFooter = true;
    this.$store.state.hideConfigButton = true;
    body.classList.add("profile-overview");
  },
  beforeUnmount() {
    this.$store.state.isAbsolute = false;
    this.$store.state.imageLayout = "default";
    this.$store.state.showNavbar = true;
    this.$store.state.showFooter = true;
    this.$store.state.hideConfigButton = false;
    body.classList.remove("profile-overview");
  },
};
</script>