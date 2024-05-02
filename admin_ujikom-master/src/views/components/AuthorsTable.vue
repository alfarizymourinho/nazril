<template>
  <div class="card">
    <div class="card-header pb-0 d-flex justify-content-between align-items-center">
      <h6>Authors Table</h6>
      <div class="input-group" style="width: 40%;">
        <span class="input-group-text" id="basic-addon1">
          <i class="fas fa-search"></i>
        </span>
        <input type="text" class="form-control" v-model="searchQuery" placeholder="Cari Pengguna"
          aria-label="Cari Pengguna" aria-describedby="basic-addon1">
      </div>
    </div>
    <div class="card-body px-0 pt-0 pb-0">
      <div class="table-responsive p-0">
        <table class="table align-items-center mb-0">
          <thead>
            <tr>
              <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-6">Username</th>
              <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">First Name</th>
              <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Last Name</th>
              <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Role</th>
              <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Email</th>
              <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-6 text-end pe-8">Edit User
              </th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="user in filteredData" :key="user.id">
              <td>
                <div class="d-flex px-2 py-1">
                  <div>
                    <img src="../../assets/img/team-2.jpg" class="avatar avatar-sm me-3" alt="user1" />
                  </div>
                  <div class="d-flex flex-column justify-content-center">
                    <h6 class="mb-0 text-sm">{{ user.name }}</h6>
                  </div>
                </div>
              </td>
              <td>
                <p class="text-xs text-secondary mb-0">{{ user.firstName }}</p>
              </td>
              <td>
                <p class="text-xs text-secondary mb-0">{{ user.lastName }}</p>
              </td>
              <td>
                <p class="text-xs text-secondary mb-0">{{ user.role }}</p>
              </td>
              <td>
                <p class="text-xs text-secondary mb-0">{{ user.email }}</p>
              </td>
              <td class="align-middle pe-5">
                <div class="d-flex justify-content-end">
                  <button type="button" class="btn btn-primary" style="margin-right: 10px;"
                    @click="showEditUserModal(user)">
                    <i class="fas fa-edit"></i> User
                  </button>
                  <button type="button" class="btn btn-success" @click="showEditPasswordModal(user)">
                    <i class="fas fa-edit"></i> Password
                  </button>
                </div>
              </td>
            </tr>
            <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel"
              aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="editUserModalLabel">Edit User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="input-group flex-nowrap mb-3">
                      <span class="input-group-text" id="addon-wrapping">
                        <img src="https://cdn-icons-png.flaticon.com/128/2808/2808392.png" alt="User Icon" width="28"
                          height="28">
                      </span>
                      <input v-model="editedUser.name" type="text" class="form-control" placeholder="Name"
                        aria-label="Name" aria-describedby="addon-wrapping">
                    </div>
                    <div class="input-group flex-nowrap mb-3">
                      <span class="input-group-text" id="addon-wrapping">
                        <img src="https://cdn-icons-png.flaticon.com/128/10678/10678244.png" alt="User Icon" width="28"
                          height="28">
                      </span>
                      <input v-model="editedUser.firstName" type="text" class="form-control" placeholder="First Name"
                        aria-label="First Name" aria-describedby="addon-wrapping">
                    </div>
                    <div class="input-group flex-nowrap mb-3">
                      <span class="input-group-text" id="addon-wrapping">
                        <img src="https://cdn-icons-png.flaticon.com/128/10678/10678244.png" alt="User Icon" width="28"
                          height="28">
                      </span>
                      <input v-model="editedUser.lastName" type="text" class="form-control" placeholder="Last Name"
                        aria-label="Last Name" aria-describedby="addon-wrapping">
                    </div>
                    <div class="input-group flex-nowrap mb-3">
                      <span class="input-group-text" id="addon-wrapping">
                        <img src="https://cdn-icons-png.flaticon.com/128/10678/10678244.png" alt="User Icon" width="28"
                          height="28">
                      </span>
                      <input v-model="editedUser.email" type="text" class="form-control" placeholder="Email"
                        aria-label="Email" aria-describedby="addon-wrapping">
                    </div>
                  </div>
                  <div class="d-flex justify-content-end pe-6">
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                    <button type="button" class="btn btn-primary" @click="updateUser(user)">Simpan</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal fade" id="editPasswordModal" tabindex="-1" aria-labelledby="editPasswordModalLabel"
              aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="editPasswordModalLabel">Edit User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="input-group flex-nowrap mb-3">
                      <span class="input-group-text" id="addon-wrapping">
                        <img src="https://cdn-icons-png.flaticon.com/128/2665/2665311.png" alt="User Icon" width="28"
                          height="28">
                      </span>
                      <input v-model="editedPassword.password" type="password" class="form-control"
                        placeholder="Password Baru" aria-label="Password" aria-describedby="addon-wrapping">
                    </div>
                    <div class="input-group flex-nowrap mb-3">
                      <span class="input-group-text" id="addon-wrapping">
                        <img src="https://cdn-icons-png.flaticon.com/128/6931/6931556.png" alt="User Icon" width="28"
                          height="28">
                      </span>
                      <input v-model="passwordConfirmation" type="password" class="form-control"
                        placeholder="Konfirmasi Password" aria-label="Confirm Password" aria-describedby="addon-wrapping">
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                    <button type="button" class="btn btn-primary" @click="updatePassword(user)">Simpan</button>
                  </div>
                </div>
              </div>
            </div>
          </tbody>
        </table>
      </div>
    </div>
    <div class=" d-flex justify-content-end p-3">
      <button class="btn btn-secondary me-2" @click="previousPage" :disabled="currentPage === 1">Kembali</button>
      <button class="btn btn-success" @click="nextPage"
        :disabled="currentPage * itemsPerPage >= getDataUser.length">Lanjut</button>
    </div>
  </div>
</template>
<script>
import { mapActions, mapGetters } from 'vuex';
import Swal from 'sweetalert2';
import bootstrap from 'bootstrap/dist/js/bootstrap.bundle.min.js';

export default {
  data() {
    return {
      searchQuery: '',
      currentPage: 1,
      itemsPerPage: 5,
      editedUser: {
        id: '',
        name: '',
        firstName: '',
        lastName: '',
        email: '',
      },
      editedPassword: {
        id: '',
        password: '',
      },
      passwordConfirmation: '',
    };
  },
  computed: {
    ...mapGetters('datauser', ['getDataUser']),
    filteredData() {
      if (this.getDataUser) {
        const filtered = this.getDataUser.filter((user) =>
          user.name.toLowerCase().includes(this.searchQuery.toLowerCase()) ||
          user.firstName.toLowerCase().includes(this.searchQuery.toLowerCase()) ||
          user.lastName.toLowerCase().includes(this.searchQuery.toLowerCase()) ||
          user.email.toLowerCase().includes(this.searchQuery.toLowerCase())
        );
        const startIndex = (this.currentPage - 1) * this.itemsPerPage;
        const endIndex = startIndex + this.itemsPerPage;

        return filtered.slice(startIndex, endIndex);
      }
      return [];
    },
  },
  methods: {
    ...mapActions('datauser', ['fetchDataUser']),
    previousPage() {
      if (this.currentPage > 1) {
        this.currentPage--;
      }
    },
    nextPage() {
      if (this.currentPage * this.itemsPerPage < this.getDataUser.length) {
        this.currentPage++;
      }
    },
    showEditUserModal(user) {
      console.log('User object:', user);

      if (user && user.id) {
        this.editedUser = {
          id: user.id,
          name: user.name,
          firstName: user.firstName,
          lastName: user.lastName,
          email: user.email,
        };
        new bootstrap.Modal(document.getElementById('editUserModal')).show();
      } else {
        console.error('Invalid user object:', user);
      }
    },
    showEditPasswordModal(user) {
      console.log('Password object:', user.password);

      if (user && user.id) {
        this.editedPassword = {
          id: user.id,
          password: '',
        };
        new bootstrap.Modal(document.getElementById('editPasswordModal')).show();
      } else {
        console.error('Invalid user object:', user);
      }
    },
    async updateUser() {
      try {
        const userId = this.editedUser.id;
        if (
          this.editedUser.name.trim() !== '' || 
          this.editedUser.firstName.trim() !== '' || 
          this.editedUser.lastName.trim() !== '' || 
          this.editedUser.email.trim() !== '') {
          const confirmation = await this.showConfirmationModal();

          if (confirmation.isConfirmed) {
            const updatedUser = await this.$store.dispatch(
              'datauser/editUser',
              {
                userId,
                userInput: this.editedUser,
              }
            );

            if (updatedUser.success) {
              Swal.fire({
                position: 'top-center',
                icon: 'success',
                title: 'Data kamu berhasil di edit!',
                showConfirmButton: false,
                timer: 3000,
              });
              console.log('User diupdate:', updatedUser);
              this.$router.go(0);
            } else {
              Swal.fire({
                position: 'top-center',
                title: 'Gagal Memperbarui User',
                icon: 'error',
                confirmButtonText: 'Oke',
              });
              console.error('Gagal memperbarui User:', updatedUser.error);
            }
          } else {
            Swal.fire({
              position: 'top-center',
              title: 'Tidak Ada Update',
              text: 'Anda tidak mengubah data apapun',
              icon: 'info',
              showConfirmButton: false,
              timer: 3000,
            });
          }
        } else {
          Swal.fire("Data Tidak Boleh Kosong", "", "info");
          console.warn('name dan email kosong. Tidak ada update.');
        }
      } catch (error) {
        Swal.fire({
          position: 'top',
          title: 'Gagal Memperbarui User',
          text: 'Email sudah terdaftar. Pilih email lain.',
          icon: 'error',
          confirmButtonText: 'Oke',
        });
        console.error('Error update user:', error);
      }
    },
    async updatePassword() {
      try {
        const userId = this.editedPassword.id;
        if (this.editedPassword.password.trim() !== '') {
          const confirmation = await this.showConfirmationModal();

          if (confirmation.isConfirmed) {
            if (this.editedPassword.password !== this.passwordConfirmation) {
              Swal.fire({
                title: 'Password Konfirmasi Error!',
                text: 'Password Dan Konfirmasi Password Tidak Sama.',
                icon: 'error',
                confirmButtonText: 'Oke',
              });
              return;
            }

            const updatedPassword = await this.$store.dispatch(
              'datauser/editPassword',
              {
                userId,
                userInput: this.editedPassword
              }
            );

            if (updatedPassword.success) {
              Swal.fire({
                position: 'top-center',
                icon: 'success',
                title: 'Password berhasil di edit!',
                showConfirmButton: false,
                timer: 3000
              });
              console.log('Password diupdate:', updatedPassword);
              this.$router.go(0);
            } else {
              Swal.fire({
                title: 'Gagal Memperbarui Password',
                text: 'Harap Masukan Password Dengan Benar.',
                icon: 'error',
                confirmButtonText: 'Oke',
              });
              console.error('Gagal memperbarui password:', updatedPassword.error);
            }
          } else if (confirmation.isDenied) {
            Swal.fire("Data Tidak Boleh Kosong", "", "info");
          }
        } else {
          Swal.fire('Data Tidak Boleh Kosong', '', 'info');
          console.warn('Password tidak sama. update gagal.');
        }
      } catch (error) {
        console.error('Error update password:', error);
      }
    },
    async showConfirmationModal() {
      return Swal.fire({
        title: "Apakah Anda Yakin Ingin Memperbaruinya?",
        showCancelButton: true,
        confirmButtonText: "Simpan",
      });
    },
  },
  mounted() {
    this.fetchDataUser();
  },
};
</script>