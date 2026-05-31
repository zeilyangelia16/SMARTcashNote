# CashNote

CashNote adalah aplikasi mobile berbasis Flutter yang digunakan untuk mencatat dan mengelola keuangan harian. Aplikasi ini dirancang untuk membantu pengguna memantau pemasukan dan pengeluaran secara sederhana, cepat, dan efisien.

## Tujuan Pengembangan

* Membantu pengguna untuk:

- Mencatat pemasukan dan pengeluaran harian.
- Mengetahui total saldo secara real-time.
- Melihat riwayat transaksi dengan rapi.
- Memantau kondisi keuangan melalui statistik.
- Mengelola data keuangan secara offline dan aman.

## Teknologi yang Digunakan

- Flutter (UI Framework)
- Dart (Programming Language)
- SQLite (Local Database)
- SharedPreferences (Session Management)
- Provider (State Management)
- Material Design

## Fitur Utama

1. Login dan Registrasi
- Registrasi akun baru.
- Login menggunakan email dan password.
- Penyimpanan sesi login menggunakan SharedPreferences.
- Logout akun.
2. Dashboard Beranda
- Greeting Card pengguna.
- Informasi saldo saat ini.
- Ringkasan pemasukan dan pengeluaran.
- Daftar transaksi terbaru.
- Tombol tambah transaksi cepat (Floating Action Button).
3. Manajemen Transaksi
- Tambah transaksi.
- Hapus transaksi dengan swipe.
- Menampilkan kategori transaksi.
- Menampilkan tanggal transaksi.
- Menampilkan catatan transaksi.
- Pengelompokan transaksi berdasarkan bulan dan tahun.
4. Kategori Transaksi

* Kategori yang tersedia:

   - Makanan
   - Transport
   - Belanja
   - Gaji
   - Hiburan
   - Tagihan
   - Hadiah
5. Statistik Keuangan
- Total pemasukan.
- Total pengeluaran.
- Visualisasi grafik keuangan.
- Ringkasan kondisi keuangan pengguna.
6. Profil Pengguna
- Menampilkan nama pengguna.
- Menampilkan email pengguna.
- Edit profil.
- Informasi aplikasi.
- Informasi keamanan.
- Bantuan pengguna.
- Dark Mode.
- Logout akun.
7. Dark Mode
- Pergantian tema terang dan gelap.
- Berlaku pada seluruh tampilan aplikasi.
8. Penyimpanan Data Lokal
- SQLite Database.
- Data tersimpan secara offline.
- Data transaksi terhubung dengan akun pengguna.

## Alur Aplikasi

1. User membuka aplikasi
2. Splash screen → cek session login
3. Masuk ke Login / Home
4. User melihat dashboard
5. User menambah transaksi
6. Data divalidasi (form validation)
7. Data disimpan ke SQLite (async/await)
8. UI otomatis update
9. User dapat edit atau hapus transaksi

## Struktur Halaman

1. Home Screen
    - Menampilkan saldo
    - Menampilkan daftar transaksi
    - Tombol tambah(+) transaksi
2. Add Transaction Screen
    - Form input(TextFormField)
    - Validasi input
    - Tombol simpan
3. Detail Screen
    - Menampilkan detail transaksi
    - Tombol edit & hapus
4. Statistik Screen
    - Grafik pengeluaran

## Developer Notes

Project ini dibuat sebagai aplikasi pembelajaran Flutter yang fokus pada:

- CRUD operations
- Local database management
- State management
- Clean UI/UX design

## License

Project ini dibuat untuk memenuhi tugas Ujian Akhir Semester (UAS) serta sebagai media pembelajaran dan pengembangan kemampuan dalam pengembangan aplikasi mobile menggunakan Flutter.

## Conclusion

CashNote berhasil dikembangkan sebagai aplikasi pencatatan keuangan berbasis Flutter dengan konsep offline-first. Aplikasi ini membantu pengguna dalam mengelola pemasukan dan pengeluaran secara sederhana, terstruktur, dan efisien.

Dengan implementasi SQLite, state management, dan desain UI yang clean, CashNote menjadi dasar yang kuat untuk pengembangan aplikasi keuangan yang lebih kompleks di masa depan.




