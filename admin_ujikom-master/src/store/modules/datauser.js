import axios from "axios";
const jwt = require('jsonwebtoken');

const datauser = {
  namespaced: true,
  state: {
    dataUser: [],
    updateData: [],
    updatePassword: [],
  },
  getters: {
    getDataUser: (state) => state.dataUser,
  },
  actions: {
    async fetchDataUser({ commit }) {
      try {
        const token = localStorage.getItem("token");
    
        if (!token) {
          alert("User token is not available. Please login.");
          return;
        }
    
        const config = {
          headers: {
            'Authorization': `Bearer ${token}`
          }
        };
    
        const response = await axios.get("http://localhost:8080/api/v1/user", config);
    
        commit("SET_USERDATA", response.data['data']);
      } catch (error) {
        alert(error);
        console.log(error);
      }
    },    
    async editUser({ commit }, { userId, userInput }) {
      try {
        const { name, firstName, lastName, email } = userInput;
        const token = localStorage.getItem("token");
        const decodedToken = jwt.decode(token);

        if (decodedToken) {
          const dataToUpdate = {
            name,
            firstName,
            lastName,
            email,
          };

          const response = await axios.put(`http://localhost:8080/api/v1/user/${userId}`, dataToUpdate, {
            headers: {
              'Authorization': `Bearer ${token}`
            }
          });

          if (response.data.success) {
            commit('SET_UPDATE_USER', { userId, updatedUser: dataToUpdate });
            return response.data;
          } else {
            throw new Error(response.data.message || 'Gagal untuk update user.');
          }
        } else {
          console.error('Error: Unable to decode token or missing id_user');
        }
      } catch (error) {
        console.error('Error updating user:', error);
        throw error;
      }
    },
    async editPassword({ commit }, { userId, userInput }) {
      try {
        const { password } = userInput;
        const token = localStorage.getItem("token");
        const decodedToken = jwt.decode(token);

        if (decodedToken) {
          const dataUpdate = {
            password,
          };

          const response = await axios.put(`http://localhost:8080/api/v1/user/password/${userId}`, dataUpdate, {
            headers: {
              'Authorization': `Bearer ${token}`
            }
          });

          if (response.data.success) {
            commit('SET_UPDATE_PASSWORD', { userId, updatedPassword: dataUpdate });
          }

          return response.data;
        } else {
          console.error('Error: Unable to decode token or missing id_user');
        }
      } catch (error) {
        console.error('Error updating user:', error);
        throw error;
      }
    },
  },
  mutations: {
    SET_USERDATA(state, datauser) {
      state.dataUser = datauser;
    },
    SET_UPDATE_USER(state, updatedUser) {
      state.updateData = updatedUser;
    },
    SET_UPDATE_PASSWORD(state, updatedPassword) {
      state.updatePassword = updatedPassword;
    },
  },
};

export default datauser;