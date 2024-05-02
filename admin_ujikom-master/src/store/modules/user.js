import axios from "axios";

const user = {
  namespaced: true,
  state: {
    userData: [],
  },
  getters: {
    getUser: (state) => state.userData,
  },
  actions: {
    async fetchUser({ commit }) {
      try {
        const response = await axios.get('http://localhost:8080/api/v1/profil', {
          headers: {
            'Authorization': `Bearer ${localStorage.getItem("token")}`
          }
        });
  
        console.log(response.data.data);
        commit("SET_USER", response.data.data);
      } catch (error) {
        alert(error);
        console.error(error);
      }
    },    
  },
  mutations: {
    SET_USER(state, user) {
      state.userData = user;
    },
  },
};
export default user;