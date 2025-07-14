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

> Dibuat dengan flutter dan ❤️
=======
# 🎬 Movie UI Application

![Platform](https://img.shields.io/badge/platform-Flutter-blue?logo=flutter)
![License](https://img.shields.io/badge/license-MIT-green)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)

Welcome to the Movie UI Application, a sleek and modern Flutter app designed to showcase a comprehensive movie list with an engaging user interface. This app is built to run seamlessly across multiple platforms including **Android**, **iOS**, **Web**, **Windows**, **Linux**, and **macOS**, making it a versatile choice for movie enthusiasts everywhere.

---

## ✨ Key Features

- 🎞️ Beautifully designed movie list with rich visuals and smooth animations
- 🌗 Dynamic light and dark theme support for comfortable viewing anytime
- 🚀 Intuitive navigation powered by Flutter's robust framework
- 🧩 Efficient state management using Bloc pattern for responsive UI updates
- 📱 Fully responsive layout optimized for phones, tablets, desktops, and web browsers
- 🔧 Modular architecture for easy customization and scalability

---

## 🗂️ Project Structure Overview

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

This structure keeps the code organized by feature and core utilities, making it easy to navigate and maintain.

---

## 🚀 Installation Guide

Follow these simple steps to get the Movie UI Application up and running on your machine:

1. **Clone the repository**

   ```sh
   git clone https://github.com/username/movie_ui_aplication.git
   cd movie_ui_aplication
   ```

2. **Install Flutter dependencies**

   ```sh
   flutter pub get
   ```

3. **Run the application**

   - For Android/iOS devices or emulators:

     ```sh
     flutter run
     ```

   - For Web (runs in Chrome browser):

     ```sh
     flutter run -d chrome
     ```

   - For Desktop platforms (Windows/Linux/macOS):

     ```sh
     flutter run -d windows
     ```

---

## ⚙️ Configuration

- Ensure you have the [Flutter SDK](https://flutter.dev/docs/get-started/install) installed and properly configured in your environment.
- To enable desktop support, run the following commands:

  ```sh
  flutter config --enable-windows-desktop
  flutter config --enable-linux-desktop
  flutter config --enable-macos-desktop
  ```

- Make sure your development environment is set up for your target platform(s).

---

## 📁 Important Code Highlights

- `lib/feature/user_list/presentation/screens/user_list_screen.dart`  
  The main screen displaying the movie list with theme support.
- `lib/core/theme/controller/app_theme_cubit.dart`  
  Manages the app's theme state and toggling between light and dark modes.

---

## 🤝 Contributing

We welcome contributions to improve the Movie UI Application! To contribute:

1. Fork this repository
2. Create a new feature branch (`git checkout -b feature-name`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to your branch (`git push origin feature-name`)
5. Open a Pull Request for review

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

> Built with Flutter and ❤️ by the community
