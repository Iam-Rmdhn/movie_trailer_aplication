# 🎬 Movie UI Application

<div align="center">

![App Logo](assets/images/logo_app.svg)

### 🚀 Aplikasi Movie UI Modern dengan Flutter & TMDB API
*Modern Movie UI Application with Flutter & TMDB API*

[![Flutter](https://img.shields.io/badge/Flutter-3.24+-blue?style=flat-square&logo=flutter)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.5+-blue?style=flat-square&logo=dart)](https://dart.dev/)
[![TMDB](https://img.shields.io/badge/TMDB-API-green?style=flat-square)](https://www.themoviedb.org/)
[![License](https://img.shields.io/badge/license-MIT-green?style=flat-square)](LICENSE)

</div>

---

**Navigasi Cepat | Quick Navigation:**  
[Fitur | Features](#-fitur--features) • [Screenshots](#-tangkapan-layar--screenshots) • [Instalasi | Installation](#-panduan-instalasi--installation-guide) • [API Setup](#-setup-api) • [Kontribusi | Contributing](#-kontribusi--contributing)

---

## 🎯 Tentang Proyek | About the Project

**Movie UI Application** adalah aplikasi mobile modern yang dibangun dengan **Flutter** dan terintegrasi dengan **TMDB (The Movie Database) API**. Aplikasi ini menyediakan pengalaman menonton film yang luar biasa dengan antarmuka yang elegan dan fitur-fitur canggih.

*Movie UI Application is a modern mobile app built with **Flutter** and integrated with **TMDB (The Movie Database) API**. This app provides an amazing movie-watching experience with elegant interface and advanced features.*

---

## ✨ Fitur | Features

### 🎬 **Eksplorasi Film | Movie Exploration**
- **🔥 Film Popular dengan Auto-slide | Popular Movies with Auto-slide**: Header carousel otomatis menampilkan 10 film terpopuler
- **🔍 Pencarian Canggih | Advanced Search**: Cari film favorit dengan mudah
- **📱 UI Responsif | Responsive UI**: Tampilan optimal di berbagai ukuran layar
- **🎨 Tema Dark/Light | Dark/Light Theme**: Mode tampilan sesuai preferensi

### 📽️ **Detail Film Lengkap | Complete Movie Details**
- **📊 Informasi Komprehensif | Comprehensive Information**: Rating, genre, durasi, tanggal rilis
- **🎭 Cast & Crew**: Daftar lengkap pemeran dan kru film
- **🎥 Video Trailer**: Tonton trailer dan video terkait
- **🎪 Film Serupa | Similar Movies**: Rekomendasi film dengan genre serupa
- **💾 Simpan ke Daftar | Save to List**: Tambahkan ke daftar favorit

### 🏗️ **Keunggulan Teknis | Technical Excellence**
- **🧩 Bloc Pattern**: State management yang robust untuk UI state yang kompleks
- **🌐 Integrasi TMDB | TMDB Integration**: Data real-time dari database film terbesar
- **⚡ Performa Optimal | Optimal Performance**: Loading cepat dengan caching gambar
- **🔄 Auto-navigation**: Navigasi seamless antar halaman

---

## 📱 Tangkapan Layar | Screenshots

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

## 🛠️ Panduan Instalasi | Installation Guide

### 📋 **Prasyarat | Prerequisites**

```bash
# Pastikan Flutter terinstal | Ensure Flutter is installed
flutter --version

# Pastikan Android Studio/VS Code siap | Ensure Android Studio/VS Code ready
# Pastikan device/emulator tersedia | Ensure device/emulator available
```

### 🚀 **Langkah Instalasi | Installation Steps**

1. **Clone repository:**
   ```bash
   git clone https://github.com/Iam-Rmdhn/movie_ui_application.git
   cd movie_ui_application
   ```

2. **Install dependensi | Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Setup TMDB API Key (WAJIB | REQUIRED):**
   - Daftar di [TMDB](https://www.themoviedb.org/) | Register at [TMDB](https://www.themoviedb.org/)
   - Buat API key di pengaturan akun | Create API key in account settings
   - Ganti `YOUR_API_KEY` di `lib/core/utils/api_constants.dart`

4. **Jalankan aplikasi | Run the app:**
   ```bash
   flutter run
   ```

### 🔑 **Setup API**

Edit file `lib/core/utils/api_constants.dart`:

```dart
class ApiConstants {
  static const String apiKey = 'your_actual_api_key_here'; // 🔴 GANTI INI!
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
}
```

---

## 📚 File & Komponen Utama | Key Files & Components

```
lib/
├── 🏠 feature/home/                    # Modul halaman utama | Home page module
│   ├── presentation/views/             # UI halaman beranda | Home UI views
│   │   └── popular_movies_header_view.dart  # Header auto-slide | Auto-slide header
│   └── data/models/                    # Model data film | Movie data models
├── 🎬 feature/movie_detail/           # Modul detail film | Movie detail module
│   ├── data/models/                    # Model detail lengkap | Complete detail models
│   ├── data/services/                  # Service API TMDB | TMDB API services
│   ├── presentation/bloc/              # State management | Bloc state management
│   └── presentation/screens/           # UI detail film | Movie detail UI
├── 🔧 core/                           # Komponen inti | Core components
│   ├── utils/api_constants.dart        # Konfigurasi API | API configuration
│   ├── theme/                          # Tema aplikasi | App themes
│   └── widgets/                        # Widget umum | Common widgets
└── 📱 movie_app.dart                  # Root aplikasi | App root
```

---

## 🤝 Kontribusi | Contributing

Kami menyambut kontribusi dari komunitas! Berikut cara Anda dapat membantu membuat proyek ini lebih baik:  
*We welcome contributions from the community! Here's how you can help make this project even better:*

### 🌟 **Cara Berkontribusi | Ways to Contribute**
- 🐛 **Bug Reports**: Menemukan bug? Beri tahu kami! | Found a bug? Let us know!
- 💡 **Saran Fitur | Feature Requests**: Punya ide fitur baru? | Have ideas for new features?
- 🔧 **Kontribusi Kode | Code Contributions**: Submit pull requests
- 📚 **Dokumentasi | Documentation**: Tingkatkan dokumentasi kami | Improve our docs
- 🎨 **UI/UX**: Tingkatkan pengalaman pengguna | Enhance the user experience

### 📝 **Proses Kontribusi | Contribution Process**

1. **Fork repository | Fork the repository:**
   ```bash
   git fork https://github.com/Iam-Rmdhn/movie_ui_application.git
   ```

2. **Buat branch fitur | Create a feature branch:**
   ```bash
   git checkout -b feature/fitur-keren
   ```

3. **Commit perubahan | Commit your changes:**
   ```bash
   git commit -m 'Tambah: fitur keren baru'
   ```

4. **Push ke branch | Push to the branch:**
   ```bash
   git push origin feature/fitur-keren
   ```

5. **Buat Pull Request | Open a Pull Request**
   - Berikan deskripsi yang jelas | Provide a clear description
   - Referensikan isu terkait | Reference any related issues
   - Tambahkan screenshot jika ada perubahan UI | Add screenshots if UI changes

### 📋 **Panduan Pengembangan | Development Guidelines**
- Gunakan **praktik terbaik Flutter** | Use **Flutter best practices**
- Ikuti **pola Bloc** untuk manajemen state | Follow **Bloc pattern** for state management
- Tulis kode yang bersih dan terdokumentasi | Write clean and documented code
- Test semua fitur sebelum submit | Test all features before submitting

---

## 🛠️ Pemecahan Masalah | Troubleshooting

### **Masalah Umum & Solusi | Common Issues & Solutions**

**Masalah API Key | API Key Issues:**
```bash
Error: Failed to load movies (401)
Solution: Periksa kunci API TMDB Anda di api_constants.dart
         Check your TMDB API key in api_constants.dart
```

**Konektivitas Jaringan | Network Connectivity:**
```bash
Error: Network request failed
Solution: Pastikan koneksi internet dan periksa pengaturan firewall
         Ensure internet connection and check firewall settings
```

**Masalah Platform Khusus | Platform-Specific Issues:**
```bash
# Aktifkan dukungan desktop | Enable desktop support
flutter config --enable-windows-desktop
flutter config --enable-macos-desktop
flutter config --enable-linux-desktop

# Bersihkan dan rebuild | Clean and rebuild
flutter clean
flutter pub get
```

---

## 📄 Lisensi | License

Proyek ini dilisensikan di bawah **MIT License** - lihat file [LICENSE](LICENSE) untuk detailnya.  
*This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.*

---

<div align="center">

### 🌟 **Terima kasih telah menggunakan Movie UI Application!**
*Thank you for using Movie UI Application!*

**Dibuat dengan ❤️ menggunakan Flutter**  
*Made with ❤️ using Flutter*

[![Flutter](https://img.shields.io/badge/Made%20with-Flutter-blue?style=for-the-badge&logo=flutter)](https://flutter.dev)
[![TMDB](https://img.shields.io/badge/Powered%20by-TMDB-green?style=for-the-badge)](https://www.themoviedb.org/)

</div>
