<template>
  <footer class="py-3 footer">
    <div class="container-fluid">
      <div class="row align-items-center justify-content-lg-between">
        <div class="mb-4 col-lg-6 mb-lg-0">
          <div class="text-sm text-center copyright text-muted" :class="this.$store.state.isRTL ? 'text-lg-end' : 'text-lg-start'">
            ©{{ new Date().getFullYear() }}, dibuat dengan
            <i class="fa fa-heart"></i> oleh
            <a href="https://www.creative-tim.com" class="font-weight-bold" target="_blank">PreMu</a>
            untuk web AdminLTE PreMu.
          </div>
        </div>
        <div class="col-lg-6">
          <ul class="nav nav-footer justify-content-center justify-content-lg-end">
            <li class="nav-item">
              <a href="" class="nav-link text-muted" target="_blank">PreMu</a>
            </li>
            <li class="nav-item">
              <a href="" class="nav-link text-muted" target="_blank">Tentang</a>
            </li>
            <li class="nav-item">
              <a href="" class="nav-link text-muted" target="_blank">Template</a>
            </li>
            <li class="nav-item">
              <a href="" class="nav-link pe-0 text-muted" target="_blank">Lisensi</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer>
</template>
<script>
export default {
  name: "app-footer",
};
</script>