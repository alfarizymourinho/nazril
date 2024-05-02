<template>
  <div class="card card-profile">
    <img src="../../assets/img/bg-profile.jpg" alt="Image placeholder" class="card-img-top" />
    <div class="row justify-content-center">
      <div class="col-6 col-lg-6 order-lg-4">
        <div class="mt-n4 mt-lg-n7 mb-4 mb-lg-0">
          <a href="javascript:;">
            <img src="../../assets/img/team-2.jpg" class="rounded-circle img-fluid border border-2 border-white" />
          </a>
        </div>
      </div>
    </div>
    <div class="card-body pt-0" v-for="user in getUser" :key="user.id_user">
      <div class="text-center mt-4">
        <h5>{{ user.name }}</h5>
        <div class="h6 font-weight-300">
          <i class="ni location_pin mr-2"></i>{{ user.email }}
        </div>
        <div class="h6 mt-3">
          <i class="ni business_briefcase-24 mr-2"></i>{{ user.firstName }} {{ user.lastName }}
        </div>
        <div>
          <i class="ni education_hat mr-2"></i>Admin Of @PreMu
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapActions, mapGetters } from 'vuex';

export default {
  name: "profile-card",
  computed: {
    ...mapGetters('user', ['getUser']),
  },
  methods: {
    ...mapActions('user', ['fetchUser']),
  },
  async mounted() {
    try {
      await this.fetchUser();
    } catch (error) {
      console.error('Error fetching user data:', error);
    }
  },
};
</script>