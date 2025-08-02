# 🎬 Movie UI Application

<div align="cent### 📽️ **Detail F### 🏗️ **Keunggulan Teknis | Technical Excellence**
- **🧩 Bloc Pattern**: State management yang robust untuk UI state yang kompleks
- **🌐 Integrasi TMDB | TMDB Integration**: Data real-time da## 📚 File & Komponen Utama | Key Kami menyambut kontribusi dari komunitas! Berikut cara And## 🐛 Troubleshooting | Pemecahan Masalah dapat membantu me## 🙏 Ucapan Terima Kasih | Acknowledgments

- **The Movie Database (TMDB)** untuk menyediakan API film yang komprehensif | for providing the comprehensive movie API
- **Tim Flutter | Flutter Team** untuk framework cross-platform yang luar biasa | for the amazing cross-platform framework
- **Komunitas Open Source | Open Source Community** untuk inspirasi dan kontribusi | for inspiration and contributions
- **Para Kontributor | Contributors** yang membantu membuat proyek ini lebih baik | who help make this project betterproyek ini lebih baik:  
*We welcome contributions from the community! Here's how you can help make this project even better:*

### 🌟 **Cara Berkontribusi | Ways to Contribute**
- 🐛 **Bug Reports**: Menemukan bug? Beri tahu kami! | Found a bug? Let us know!
- 💡 **Saran Fitur | Feature Requests**: Punya ide fitur baru? | Have ideas for new features?
- 🔧 **Kontribusi Kode | Code Contributions**: Submit pull requests
- 📚 **Dokumentasi | Documentation**: Tingkatkan dokumentasi kami | Improve our docs
- 🎨 **UI/UX**: Tingkatkan pengalaman pengguna | Enhance the user experienceComponents

### 🎬 **Fitur Film | Movie Features**
- `lib/feature/home/presentation/views/popular_movies_header_view.dart` - Carousel film auto-slide
- `lib/feature/movie_detail/presentation/screens/movie_detail_screen.dart` - Detail film yang komprehensif
- `lib/core/data/models/tmdb_movie.dart` - Model data film
- `lib/core/data/services/movie_api_service.dart` - Integrasi TMDB API

### 🎨 **Tema & UI | Theme & UI**
- `lib/core/theme/controller/app_theme_cubit.dart` - Manajemen tema
- `lib/core/widgets/` - Komponen UI yang dapat digunakan kembali

### 🗃️ **Dokumentasi | Documentation**
- `TMDB_INTEGRATION.md` - Panduan lengkap integrasi API
- `README.md` - Panduan komprehensif initabase API
- **📦 Arsitektur Modular | Modular Architecture**: Codebase yang bersih, scalable, dan maintainable
- **🚀 Performance**: Image caching, lazy loading, dan networking yang dioptimalkan
- **🛡️ Error Handling**: Error state yang graceful dengan retry mechanismMovie Details**
- **🎭 Info Lengkap | Comprehensive Info**: Sinopsis, cast, crew, genre, dan rating
- **🎥 Trailer**: Tonton trailer film langsung di aplikasi
- **👥 Cast & Crew**: Informasi detail dengan foto profil
- **🎯 Rekomendasi | Recommendations**: Temukan film serupa dan saran personal
- **📊 Statistik Film | Movie Stats**: Budget, revenue, durasi, dan info rilis
![Movie App Banner](https://img.shields.io/badge/🎬_Movie_App-Flutter-blue?style=for-the-badge&logo=flutter&logoColor=white)

**Aplikasi Modern Penemuan Film dengan Flutter | A Modern Movie Discovery App Built with Flutter**

[![Platform](https://img.shields.io/badge/platform-Flutter-02569B?style=flat-square&logo=flutter)](https://flutter.dev)
[![License](https://img.shields.io/badge/license-MIT-green?style=flat-square)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](CONTRIBUTING.md)
[![TMDB API](https://img.shields.io/badge/API-TMDB-01b4e4?style=flat-square&logo=themoviedatabase)](https://www.themoviedb.org/)

*Temukan, jelajahi, dan nikmati film dengan aplikasi Flutter yang dibuat dengan cinta*  
*Discover, explore, and enjoy movies with our beautifully crafted Flutter application*

[Fitur | Features](#-fitur--features) • [Screenshots](#-screenshots) • [Instalasi | Installation](#-panduan-instalasi--installation-guide) • [API Setup](#-setup-api) • [Kontribusi | Contributing](#-kontribusi--contributing)

</div>

---

## 🚀 Apa yang Membuat Aplikasi Ini Istimewa? | What Makes This App Special?

Ini bukan sekadar aplikasi film biasa - tapi **platform penemuan film yang komprehensif** yang menghadirkan pengalaman bioskop ke ujung jari Anda. Dibangun dengan arsitektur Flutter modern dan didukung oleh **The Movie Database (TMDB) API**, memberikan data film real-time dengan visual yang memukau dan performa smooth di semua platform.

*This isn't just another movie app - it's a **comprehensive movie discovery platform** that brings the cinema experience to your fingertips. Built with modern Flutter architecture and powered by **The Movie Database (TMDB) API**, it delivers real-time movie data with stunning visuals and smooth performance across all platforms.*

### 🎯 **Keunggulan Cross-Platform | Cross-Platform Excellence**
- 📱 **Mobile**: Android & iOS dengan performa native
- 🌐 **Web**: Progressive Web App dengan dukungan Chrome  
- 💻 **Desktop**: Aplikasi Windows, macOS & Linux
- ⚡ **Performance**: Dioptimalkan untuk semua ukuran layar dan perangkat

---

## ✨ Fitur | Features

### 🎞️ **Penemuan Film | Movie Discovery**
- **🔥 Film Popular | Popular Movies**: Header carousel auto-slide dengan 10 film trending
- **⭐ Rating Tertinggi | Top Rated**: Film dengan rating tertinggi dari seluruh dunia
- **🎬 Sedang Tayang | Now Playing**: Film yang sedang tayang di bioskop
- **🔮 Akan Datang | Upcoming**: Film yang akan datang untuk dinanti-nanti
- **🔍 Pencarian Cerdas | Smart Search**: Pencarian film real-time dengan hasil instan

### 📽️ **Movie Details**
- **� Comprehensive Info**: Synopsis, cast, crew, genres, and ratings
- **🎥 Trailers**: Watch movie trailers directly in the app
- **👥 Cast & Crew**: Detailed information with profile photos
- **🎯 Recommendations**: Discover similar movies and personalized suggestions
- **� Movie Stats**: Budget, revenue, runtime, and release information

### 🎨 **Pengalaman Pengguna | User Experience**
- **🌗 Tema Dinamis | Dynamic Themes**: Mode gelap & terang yang indah dengan transisi smooth
- **📱 Desain Responsif | Responsive Design**: Layout adaptif untuk ponsel, tablet, dan desktop
- **⚡ Auto-Slide Header**: Carousel sinematik dengan pause saat interaksi
- **🖼️ Gambar Berkualitas Tinggi | High-Quality Images**: Poster dan backdrop ter-cache
- **🔄 Pull-to-Refresh**: Jaga konten tetap fresh dan up-to-date

### 🏗️ **Technical Excellence**
- **🧩 Bloc Pattern**: Robust state management for complex UI states
- **🌐 TMDB Integration**: Real-time data from The Movie Database API
- **� Modular Architecture**: Clean, scalable, and maintainable codebase
- **🚀 Performance**: Image caching, lazy loading, and optimized networking
- **🛡️ Error Handling**: Graceful error states with retry mechanisms

---

## � Screenshots

<div align="center">

| Beranda | Detail Film | Hasil Pencarian |
| Home Screen | Movie Details | Search Results |
|-------------|---------------|----------------|
| ![Home](https://via.placeholder.com/250x450/1a1a1a/ffffff?text=Home+Screen) | ![Details](https://via.placeholder.com/250x450/1a1a1a/ffffff?text=Movie+Details) | ![Search](https://via.placeholder.com/250x450/1a1a1a/ffffff?text=Search+Results) |

| Tema Gelap | Tema Terang | Tampilan Desktop |
| Dark Theme | Light Theme | Desktop View |
|------------|-------------|--------------|
| ![Dark](https://via.placeholder.com/250x450/1a1a1a/ffffff?text=Dark+Theme) | ![Light](https://via.placeholder.com/250x450/f0f0f0/333333?text=Light+Theme) | ![Desktop](https://via.placeholder.com/400x250/1a1a1a/ffffff?text=Desktop+View) |

</div>

---

## 🗂️ Arsitektur Proyek | Project Architecture

```
📁 movie_ui_application/
├── 📁 lib/
│   ├── 📁 core/
│   │   ├── 📁 auth/                 # Logika autentikasi
│   │   ├── 📁 component/            # Komponen UI yang dapat digunakan kembali
│   │   ├── 📁 data/
│   │   │   ├── 📁 models/           # Model data (TMDBMovie, MovieDetail)
│   │   │   └── 📁 services/         # Service API (integrasi TMDB)
│   │   ├── 📁 helper/               # Helper utilitas
│   │   ├── 📁 network/              # Konfigurasi jaringan & konstanta
│   │   ├── 📁 theme/                # Tema aplikasi (mode gelap/terang)
│   │   ├── 📁 utils/                # Konstanta dan utilitas
│   │   └── 📁 widgets/              # Widget global yang dapat digunakan kembali
│   ├── 📁 feature/
│   │   ├── 📁 home/                 # Layar beranda dengan daftar film
│   │   │   ├── 📁 data/
│   │   │   │   └── 📁 bloc/         # State management film
│   │   │   └── 📁 presentation/
│   │   │       ├── 📁 views/        # Tampilan daftar film & header
│   │   │       └── 📁 widget/       # Widget film kustom
│   │   ├── 📁 movie_detail/         # Fitur detail film
│   │   │   ├── 📁 data/
│   │   │   │   └── 📁 bloc/         # State management detail
│   │   │   └── 📁 presentation/
│   │   │       ├── 📁 screens/      # Layar detail
│   │   │       └── 📁 widgets/      # Widget khusus detail
│   │   ├── 📁 explore/              # Penemuan & pencarian film
│   │   ├── 📁 download/             # Manajemen unduhan
│   │   ├── 📁 profile/              # Profil pengguna
│   │   ├── 📁 sign_in/              # Autentikasi masuk
│   │   ├── 📁 sign_up/              # Registrasi pengguna
│   │   └── 📁 user_list/            # Daftar film pengguna & favorit
│   ├── 📄 main.dart                 # Entry point aplikasi
│   └── 📄 movie_app.dart            # Konfigurasi aplikasi utama
├── 📁 assets/
│   └── 📁 images/                   # Ikon aplikasi dan aset
├── 📁 android/                      # Konfigurasi khusus Android
├── 📁 ios/                          # Konfigurasi khusus iOS
├── 📁 web/                          # Konfigurasi khusus Web
├── 📁 windows/                      # Konfigurasi desktop Windows
├── 📄 pubspec.yaml                  # Dependensi dan metadata
└── 📄 TMDB_INTEGRATION.md           # Dokumentasi integrasi API
```

---

## 🚀 Panduan Instalasi | Quick Start Guide

### 📋 Prasyarat | Prerequisites

Sebelum memulai, pastikan Anda telah menginstal hal-hal berikut:  
*Before you begin, ensure you have the following installed:*

- **Flutter SDK** (>=3.0.0): [Panduan Instalasi | Installation Guide](https://flutter.dev/docs/get-started/install)
- **Dart SDK** (>=2.17.0): Sudah termasuk dengan Flutter | Included with Flutter
- **Android Studio** atau **VS Code**: Untuk development
- **Git**: Untuk version control

### 🔑 Setup API

Aplikasi ini menggunakan **The Movie Database (TMDB) API** untuk data film real-time:  
*This app uses **The Movie Database (TMDB) API** for real-time movie data:*

1. **Dapatkan API Key TMDB Anda | Get your TMDB API Key:**
   - Kunjungi | Visit [TMDB](https://www.themoviedb.org/)
   - Buat akun atau login | Create an account or sign in
   - Navigasi ke **Settings** → **API**
   - Copy **API Key (v3 auth)** Anda

2. **Konfigurasi API Key:**
   - Buka | Open `lib/core/network/api_constants.dart`
   - Ganti API key | Replace the API key:
     ```dart
     static const String apiKey = 'your_actual_api_key_here';
     ```

### 📦 Instalasi | Installation

1. **Clone repository:**
   ```bash
   git clone https://github.com/Iam-Rmdhn/movie_ui_application.git
   cd movie_ui_application
   ```

2. **Install dependencies | Install dependensi:**
   ```bash
   flutter pub get
   ```

3. **Jalankan aplikasi | Run the application:**

   **Mobile (Android/iOS):**
   ```bash
   flutter run
   ```

   **Web Browser:**
   ```bash
   flutter run -d chrome
   ```

   **Desktop:**
   ```bash
   # Windows
   flutter run -d windows
   
   # macOS
   flutter run -d macos
   
   # Linux
   flutter run -d linux
   ```

### 🔧 Konfigurasi Platform | Platform Configuration

**Aktifkan dukungan desktop | Enable desktop support:**
```bash
flutter config --enable-windows-desktop
flutter config --enable-macos-desktop
flutter config --enable-linux-desktop
```

**Deployment web | Web deployment:**
```bash
flutter build web
```

---

## 🛠️ Tech Stack & Dependencies | Teknologi & Dependensi

### 🏗️ **Framework Utama | Core Framework**
- **Flutter**: Framework UI cross-platform
- **Dart**: Bahasa pemrograman | Programming language

### 📡 **API & Networking**
- **http**: HTTP client untuk API requests
- **TMDB API v3**: Database film dan metadata

### 🎨 **UI & Experience**
- **cached_network_image**: Loading dan caching gambar yang efisien
- **flutter_svg**: Dukungan SVG untuk ikon yang crisp
- **google_fonts**: Tipografi yang indah

### 🧩 **State Management**
- **flutter_bloc**: State management yang predictable
- **equatable**: Value equality untuk state objects

### 🔥 **Fitur | Features**
- **firebase_core**: Integrasi Firebase siap pakai
- **flutter_native_splash**: Custom splash screens

### 📱 **Dukungan Platform | Platform Support**
- Android (API 21+)
- iOS (11.0+)
- Web (Chrome, Safari, Firefox, Edge)
- Windows (Windows 10+)
- macOS (10.14+)
- Linux (Ubuntu 18.04+)

---

## � Key Files & Components

### 🎬 **Movie Features**
- `lib/feature/home/presentation/views/popular_movies_header_view.dart` - Auto-sliding movie carousel
- `lib/feature/movie_detail/presentation/screens/movie_detail_screen.dart` - Comprehensive movie details
- `lib/core/data/models/tmdb_movie.dart` - Movie data models
- `lib/core/data/services/movie_api_service.dart` - TMDB API integration

### 🎨 **Theme & UI**
- `lib/core/theme/controller/app_theme_cubit.dart` - Theme management
- `lib/core/widgets/` - Reusable UI components

### 🗃️ **Documentation**
- `TMDB_INTEGRATION.md` - Complete API integration guide
- `README.md` - This comprehensive guide

---

## 🤝 Kontribusi | Contributing

We welcome contributions from the community! Here's how you can help make this project even better:

### 🌟 **Ways to Contribute**
- 🐛 **Bug Reports**: Found a bug? Let us know!
- 💡 **Feature Requests**: Have ideas for new features?
- 🔧 **Code Contributions**: Submit pull requests
- � **Documentation**: Improve our docs
- 🎨 **UI/UX**: Enhance the user experience

### 📝 **Contribution Process**

1. **Fork the repository**
   ```bash
   git fork https://github.com/Iam-Rmdhn/movie_ui_application.git
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```

3. **Make your changes**
   - Follow the existing code style
   - Add tests if applicable
   - Update documentation

4. **Commit your changes**
   ```bash
   git commit -m 'Add some amazing feature'
   ```

5. **Push to your branch**
   ```bash
   git push origin feature/amazing-feature
   ```

6. **Open a Pull Request**
   - Provide a clear description
   - Reference any related issues
   - Add screenshots if UI changes

### � **Development Guidelines**
- Use **Flutter best practices**
- Follow **Bloc pattern** for state management
- Write **meaningful commit messages**
- Add **comments** for complex logic
- Test on **multiple platforms**

---

## � Troubleshooting

### **Common Issues & Solutions**

**API Key Issues:**
```bash
Error: Failed to load movies (401)
Solution: Check your TMDB API key in api_constants.dart
```

**Network Connectivity:**
```bash
Error: Network request failed
Solution: Ensure internet connection and check firewall settings
```

**Platform-Specific Issues:**
```bash
# Enable desktop support
flutter config --enable-windows-desktop
flutter config --enable-macos-desktop
flutter config --enable-linux-desktop

# Clean and rebuild
flutter clean
flutter pub get
flutter run
```

**Performance Issues:**
- Clear app cache and restart
- Check device storage space
- Update Flutter to latest stable version

---

## 📄 Lisensi | License

Proyek ini dilisensikan di bawah **MIT License** - lihat file [LICENSE](LICENSE) untuk detailnya.  
*This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.*

```
MIT License

Copyright (c) 2024 Movie UI Application

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

---

## � Acknowledgments

- **The Movie Database (TMDB)** for providing the comprehensive movie API
- **Flutter Team** for the amazing cross-platform framework
- **Open Source Community** for inspiration and contributions
- **Contributors** who help make this project better

---

## 📞 Kontak & Dukungan | Contact & Support

- **GitHub Issues**: [Laporkan bug atau minta fitur | Report bugs or request features](https://github.com/Iam-Rmdhn/movie_ui_aplication/issues)
- **Discussions**: [Bergabung dengan diskusi komunitas | Join community discussions](https://github.com/Iam-Rmdhn/movie_ui_aplication/discussions)
- **Email**: Hubungi maintainer untuk masalah urgent | Contact the maintainer for urgent issues

---

<div align="center">

### 🌟 **Beri bintang pada repo ini jika terbantu! | Star this repo if you found it helpful!** 🌟

**Dibuat dengan Flutter dan ❤️ oleh komunitas | Built with Flutter and ❤️ by the community**

[⬆ Kembali ke Atas | Back to Top](#-movie-ui-application)

---

*Terakhir diupdate | Last updated: Agustus | August 2025*

</div>
