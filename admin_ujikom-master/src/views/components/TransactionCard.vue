<template>
  <div class="card h-97 mb-4">
    <div class="card-header pb-0 px-3">
      <div class="row">
        <div class="col-md-6">
          <h6 class="mb-0">Tambah Template</h6>
        </div>
      </div>
    </div>
    <div class="card-body pt-4 p-3">
      <div class="input-group flex-nowrap mb-3">
        <span class="input-group-text" id="addon-wrapping">
          <img src="https://cdn-icons-png.flaticon.com/128/3406/3406828.png" alt="User Icon" width="28" height="28">
        </span>
        <select v-model="newTemplate.id_kategori" class="form-select" id="inputGroupSelect03"
          aria-label="Example select with button addon">
          <option v-for="kat in getKat" :key="kat.id" :value="kat.id">{{ kat.kategori }}</option>
        </select>
      </div>
      <div class="input-group flex-nowrap mb-3">
        <span class="input-group-text" id="addon-wrapping">
          <img src="https://cdn-icons-png.flaticon.com/128/8089/8089953.png" alt="User Icon" width="28" height="28">
        </span>
        <input v-model="newTemplate.title" type="text" class="form-control" placeholder="Judul" aria-label="Username"
          aria-describedby="addon-wrapping">
      </div>
      <div class="input-group flex-nowrap mb-3">
        <span class="input-group-text" id="addon-wrapping">
          <img src="https://cdn-icons-png.flaticon.com/128/1375/1375106.png" alt="User Icon" width="28" height="28">
        </span>
        <input v-on:change="handleImageUpload" type="file" class="form-control" aria-label="Gambar"
          aria-describedby="addon-wrapping" accept="image/*">
      </div>
      <div class="input-group flex-nowrap mb-3">
        <span class="input-group-text" id="addon-wrapping">
          <img src="https://cdn-icons-png.flaticon.com/128/9948/9948547.png" alt="User Icon" width="28" height="28">
        </span>
        <textarea v-model="newTemplate.des" class="form-control" placeholder="Deskripsi"
          aria-label="With textarea"></textarea>
      </div>
      <div class="input-group flex-nowrap mb-3">
        <span class="input-group-text" id="addon-wrapping">
          <img src="https://cdn-icons-png.flaticon.com/128/9948/9948547.png" alt="User Icon" width="28" height="28">
        </span>
        <textarea v-model="newTemplate.source" class="form-control" placeholder="Source"
          aria-label="With textarea"></textarea>
      </div>
      <div class="input-group-prepend">
        <button type="button" class="btn btn-primary btn-lg w-100" @click="showCreateDonasiModal">Buat Donasi</button>
      </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="createDonasiModal" tabindex="-1" aria-labelledby="createDonasiModalLabel"
      aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="createDonasiModalLabel">Tambah Donasi</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="text-center mb-4">
              <img
                src="https://img.freepik.com/free-vector/toggle-concept-illustration_114360-8900.jpg?size=626&ext=jpg&ga=GA1.1.1081581823.1690350210&semt=ais"
                alt="Donasi Image" class="img-fluid" style="max-height: 200px;">
            </div>
            <h5>Apakah Anda Yakin Ingin Membuat Data Donasi?</h5>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
            <button type="button" class="btn btn-success" @click="createDonasi">Tambah</button>
          </div>
        </div>
      </div>
    </div>
    <!-- End of Modal -->
  </div>
</template>
<script>
import Swal from 'sweetalert2';
import { mapActions, mapGetters } from 'vuex';
import 'sweetalert2/dist/sweetalert2.min.css';
import bootstrap from 'bootstrap/dist/js/bootstrap.bundle.min.js';

export default {
  data() {
    return {
      newTemplate: {
        title: '',
        image: null,
        des: '',
        id_kategori: '',
        source: '',
      },
    };
  },
  computed: {
    ...mapGetters('kategori', ['getKat']),
  },
  methods: {
    ...mapActions('kategori', ['fetchKat']),
    ...mapActions('donasi', ['addDonasi']),
    handleImageUpload(event) {
      const file = event.target.files[0];
      this.newTemplate.image = file;
    },
    showCreateDonasiModal() {
      new bootstrap.Modal(document.getElementById('createDonasiModal')).show();
    },
    async createDonasi() {
      const missingFields = [];
      if (!this.newTemplate.id_kategori) missingFields.push('Kategori');
      if (!this.newTemplate.title) missingFields.push('Judul');
      if (!this.newTemplate.image) missingFields.push('Gambar');
      if (!this.newTemplate.des) missingFields.push('Deskripsi');
      if (!this.newTemplate.source) missingFields.push('Link');

      if (missingFields.length > 0) {
        const missingFieldsMessage = `Pastikan ${missingFields.join(', ')} diisi dengan benar`;
        Swal.fire({
          icon: 'error',
          title: 'Gagal menambahkan data donasi',
          text: missingFieldsMessage,
        });
        return;
      }
      const addedDonation = await this.$store.dispatch('donasi/addDonasi', {
        userInput: this.newTemplate,
      });

      if (addedDonation.success) {
        Swal.fire({
          position: 'top',
          icon: 'success',
          title: 'Data donasi kamu berhasil ditambahkan!',
          showConfirmButton: false,
          timer: 3000,
        });

        this.$router.go(0);
      } else {
        console.error('Gagal menambahkan donasi:', addedDonation.error);
      }
    },
  },
  mounted() {
    this.fetchKat();
  },
};
</script>