import axios from "axios";

const auth = {
  namespaced: true,
  state: {
    token: localStorage.getItem("token") || "",
    lastLoginTime: localStorage.getItem("lastLoginTime") || null,
    loginError: null,
  },
  getters: {
    isAuthenticated: (state) => !!state.token,
    lastLoginTime: (state) => state.lastLoginTime,
  },
  actions: {
    async login({ commit }, credentials) {
      try {
        const response = await axios.post(
          "http://localhost:8080/api/v1/login",
          credentials
        );
        const token = response.data.token;
        const user = response.data.user;

        localStorage.setItem("token", token);
        localStorage.setItem("user", JSON.stringify(user));
        localStorage.setItem("lastLoginTime", new Date().getTime());

        commit("SET_TOKEN", token);
        commit("SET_LAST_LOGIN_TIME", new Date().getTime());
        commit("SET_LOGIN_ERROR", null);
        console.log("Token saved:", token);
        return true;
      } catch (error) {
        const errorMessage = error.response.data.message || "Login Failed";
        commit("SET_LOGIN_ERROR", errorMessage);
        console.error(error);
        return false;
      }
    },
    logout({ commit }) {
      const token = localStorage.getItem("token");
      localStorage.removeItem("token");
      localStorage.removeItem("lastLoginTime");
      commit("SET_TOKEN", "");
      commit("SET_LAST_LOGIN_TIME", null);
      console.log("Token removed:", token);
      window.location.href = "/login";
    },
  },
  mutations: {
    SET_TOKEN(state, token) {
      state.token = token;
    },
    SET_LAST_LOGIN_TIME(state, time) {
      state.lastLoginTime = time;
    },
    SET_LOGIN_ERROR(state, error) {
      state.loginError = error;
    },
  },
};

export default auth;