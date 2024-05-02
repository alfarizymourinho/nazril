import axios from "axios";

const categori = {
  namespaced: true,
  state: {
    catData: [],
    templateData: [],
    selectedTemplate: [],
  },
  getters: {
    getCat: (state) => state.catData,
    getSelectedTemplate: (state) => state.selectedTemplate,
  },
  actions: {
    async fetchCat({ commit }) {
      try {
        const data = await axios.get("http://localhost:8080/api/v1/categori");
        commit("SET_CAT", data.data['data']);
      } catch (error) {
        alert(error);
        console.log(error);
      }
    },
    async fetchTemplateByCategori({ commit }, categoriId) {
      try {
        const data = await axios.get(`http://localhost:8080/donasi/${categoriId}`);
        commit("SET_TEMPLATE_CAT", data.data['data']);
        commit("SET_SELECTED_TEMPLATE", data.data['data']);
      } catch (error) {
        console.error('donasi kategori:', error);
        throw error;
      }
    },
  },
  mutations: {
    SET_CAT(state, categori) {
      state.catData = categori;
    },
    SET_TEMPLATE_CAT(state, categori) {
      state.templateData = categori;
    },
    SET_SELECTED_template(state, categori) {
      state.selectedTemplate = categori;
    },
  },
};

export default categori;