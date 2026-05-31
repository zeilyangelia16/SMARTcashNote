# CashNote

CashNote adalah aplikasi mobile berbasis Flutter yang digunakan untuk mencatat dan mengelola keuangan harian. Aplikasi ini dirancang untuk membantu pengguna memantau pemasukan dan pengeluaran secara sederhana, cepat, dan efisien.

## Tujuan Pengembangan
- Membantu pengguna mencatat transaksi keuangan harian
- Menyediakan informasi saldo secara real-time
- Meningkatkan kesadaran pengguna terhadap pengeluaran

## Fitur Utama
- Menambahkan transaksi pemasukan (income)
- Menambahkan transaksi pengeluaran (expense)
- Menampilkan daftar transaksi
- Menghitung saldo otomatis
- Menghapus transaksi
- Ketegori transaksi
## Fitur Pengembangan
- Grafik keuangan
- Filter transaksi berdasarkan tanggal
- Mode gelap(Dark Mode)
- Penyimpanan data lokal (SQLite/Hive)

## Alur Aplikasi
1. Pengguna membuka aplikasi
2. Sistem menampilkan Home Screen
3. Pengguna melihat saldo dan daftar transaksi
4. Pengguna menekan tombol (+)
5. Pengguna mengisi form transaksi
6. Sistem melakukan validasi input (TextFormField)
7. Data disimpan menggunakan proses asynchronous (async/await)
8. Aplikasi kembali ke Home Screen
9. Data transaksi ditampilkan di daftar
10. Pengguna dapat menghapus atau mengedit transaksi

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

## Struktur Folder Project
lib/
├── main.dart
├── models/
| ├── user.dart
│ └── transaction_model.dart
├── screens/
| ├── home_screen.dart
| ├── add_transaction_screen.dart
| ├── all_transaction_screen.dart
| ├── profile_screen.dart
| ├── edit_profil_screen.dart
| ├── login_screen.dart
│ └── statistic_screen.dart
├── widgets/
│ └── transaction_item.dart
├── services/
| ├── session_servce.dart
│ └── database_service.dart




