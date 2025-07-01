# 🎬 Movie UI Application

![Platform](https://img.shields.io/badge/platform-Flutter-blue?logo=flutter)
![License](https://img.shields.io/badge/license-MIT-green)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)

Aplikasi Flutter ini merupakan contoh aplikasi daftar film dengan tampilan modern, mendukung berbagai platform seperti **Android**, **iOS**, **Web**, **Windows**, **Linux**, dan **macOS**.

---

## ✨ Fitur Utama

- 🎞️ Daftar film dengan tampilan menarik
- 🌗 Dukungan tema gelap & terang
- 🚀 Navigasi mudah menggunakan Flutter
- 🧩 State management dengan Bloc
- 📱 Responsif di berbagai perangkat

---

## 🗂️ Struktur Proyek

```
lib/
  feature/
    user_list/
      presentation/
        screens/
        views/
  core/
    theme/
    utils/
    widgets/
assets/
android/
ios/
linux/
macos/
web/
windows/
```

---

## 🚀 Instalasi

1. **Clone repository**

   ```sh
   git clone https://github.com/username/movie_ui_aplication.git
   cd movie_ui_aplication
   ```

2. **Install dependencies**

   ```sh
   flutter pub get
   ```

3. **Jalankan aplikasi**
   - Android/iOS:
     ```sh
     flutter run
     ```
   - Web:
     ```sh
     flutter run -d chrome
     ```
   - Desktop (Windows/Linux/macOS):
     ```sh
     flutter run -d windows
     ```

---

## ⚙️ Konfigurasi

- Pastikan sudah mengatur [Flutter SDK](https://flutter.dev/docs/get-started/install) di environment Anda.
- Untuk menjalankan di desktop, aktifkan dukungan desktop dengan:
  ```sh
  flutter config --enable-windows-desktop
  flutter config --enable-linux-desktop
  flutter config --enable-macos-desktop
  ```

---

## 📁 Struktur Kode Penting

- `lib/feature/user_list/presentation/screens/user_list_screen.dart`  
  Menampilkan daftar user/film dengan dukungan tema.
- `lib/core/theme/controller/app_theme_cubit.dart`  
  Mengatur tema aplikasi.

---

## 🤝 Kontribusi

1. Fork repository ini
2. Buat branch fitur (`git checkout -b fitur-baru`)
3. Commit perubahan (`git commit -am 'Tambah fitur baru'`)
4. Push ke branch (`git push origin fitur-baru`)
5. Buat Pull Request

---

## 📄 Lisensi

Aplikasi ini menggunakan lisensi [MIT](LICENSE).

---

> Dibuat dengan
