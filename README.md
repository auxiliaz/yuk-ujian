# YukUjian! – Aplikasi Simulasi Ujian Sekolah

YukUjian! adalah aplikasi simulasi ujian sekolah berbasis mobile yang dibangun menggunakan **Flutter (Dart)**.  
Aplikasi ini dirancang untuk mensimulasikan sistem ujian tingkat **SMP**, dengan dua peran pengguna yaitu **Siswa** dan **Guru**. Seluruh data dikelola di sisi client menggunakan **dummy data** dan **local storage**, tanpa backend.

## Tech Stack

- Framework: Flutter
- Bahasa: Dart
- State Management: setState
- Navigation: Navigator
- Storage: Local Storage

## Menjalankan proyek

Pastikan **Flutter SDK** sudah terpasang dan terkonfigurasi.

1. **Clone repository**
```bash
git clone https://github.com/auxiliaz/yuk-ujian.git
cd yuk-ujian
```
1. **Install dependencies**
```bash
flutter pub get
```
1. **Jalankan aplikasi**
```bash
flutter run
```

## Fitur utama

- Splash screen dan onboarding.
- Registrasi dan login pengguna.
- Pemilihan role pengguna (Siswa / Guru).
- Alur ujian untuk siswa.
- Manajemen ujian dan soal untuk guru.
- Manajemen kelas dan nilai.
- Halaman profil pengguna.
- Logout dan penghapusan session.

## Alur kerja aplikasi

1. **Splash & Onboarding**
   - Saat aplikasi dibuka, splash screen ditampilkan.
   - Pengguna diarahkan ke halaman onboarding.
   - Tombol Get Started membawa pengguna ke halaman autentikasi.

2. **Autentikasi Pengguna**
   - Pengguna melakukan registrasi dengan mengisi data diri.
   - Pengguna memilih tipe akun:
     1. Siswa
     2. Guru
   - Login dilakukan menggunakan email dan password.
   - Setelah login, pengguna diarahkan sesuai dengan role yang dipilih.

   **Alur Pengguna Siswa**
   1. Home Page
      - Siswa memilih kelas (contoh: 9A, 9B).
      - Halaman ini menjadi pintu masuk utama ke fitur ujian.
   2. Daftar Ujian
      - Menampilkan daftar ujian berdasarkan kelas yang dipilih.
   3. Mulai Ujian
      - Siswa mengisi nama dan kelas.
      - Siswa mengerjakan soal ujian yang tersedia.
   4. Halaman Nilai
      - Menampilkan skor akhir setelah ujian selesai.
   5. Halaman Kelas
      - Menampilkan daftar mata pelajaran.
      - Menampilkan nama siswa.
      - Menampilkan nilai ujian yang telah dikerjakan.
   6. Profil & Logout
      - Siswa dapat mengubah data profil.
      - Logout mengakhiri session dan kembali ke halaman login.
      
**Alur Pengguna Guru**
   1. Home Page
      - Menampilkan menu utama guru:
        1. Ujian
        2. Bank Soal
        3. Kelas
   2. Membuat Ujian
      - Guru dapat:
        1. Membuat judul ujian
        2. Menambahkan soal
        3. Memilih tipe soal (pilihan ganda / essay)
        4. Melihat dan menghapus soal
        5. Menyimpan ujian
   3. Bank Soal
      - Menampilkan daftar ujian dan soal yang telah dibuat.
      - Guru dapat melihat detail dan mengedit soal.
   4. Manajemen Kelas
      - Guru dapat melihat daftar siswa.
      - Guru dapat memasukkan nilai siswa.
      - Guru dapat menambahkan kelas baru.
   5. Profil & Logout
      - Guru dapat mengubah data profil.
      - Logout mengakhiri session dan kembali ke halaman login.

## Manajemen Data

- Seluruh data pengguna dan ujian dikelola di sisi frontend.
- Data ujian yang dibuat guru disimpan menggunakan local storage.
- Tidak terdapat backend atau database server.
- Data bersifat lokal pada perangkat pengguna.   

## Struktur penting

- `lib/main.dart` – Entry point aplikasi.
- `lib/pages/` – Halaman utama (Auth, Home, Ujian, Profil).
- `lib/models/` – Model data pengguna dan ujian.
- `lib/widgets/` – Komponen UI reusable.

## Keterbatasan Aplikasi

- Aplikasi bersifat frontend-only.
- Autentikasi tidak aman untuk penggunaan produksi.
- Ujian siswa belum tersinkron secara dinamis dengan ujian yang dibuat guru.
- Data bergantung pada perangkat dan local storage.

## Tujuan Proyek

Proyek ini dibuat untuk:

1. Mensimulasikan sistem ujian sekolah.
2. Melatih pembuatan aplikasi Flutter berbasis role pengguna.
3. Memahami alur aplikasi ujian (siswa & guru).
4. Menjadi proyek pembelajaran dan evaluasi teknis.
