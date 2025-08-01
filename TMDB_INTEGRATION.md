# 🎬 Panduan Integrasi API TMDB

## 📋 Ringkasan Perubahan

Aplikasi movie telah diintegrasikan dengan **The Movie Database (TMDB) API** untuk menggantikan data statis dengan data film real-time.

## 🚀 Langkah-langkah Setup

### 1. **Dapatkan API Key TMDB**
1. Kunjungi [https://www.themoviedb.org/](https://www.themoviedb.org/)
2. Buat akun baru atau login
3. Masuk ke **Settings** > **API**
4. Copy **API Key (v3 auth)** Anda

### 2. **Konfigurasi API Key**
1. Buka file `lib/core/network/api_constants.dart`
2. Ganti `YOUR_TMDB_API_KEY_HERE` dengan API key Anda:
   ```dart
   static const String apiKey = 'your_actual_api_key_here';
   ```

### 3. **Jalankan Aplikasi**
```bash
flutter pub get
flutter run
```

## 🔧 Fitur yang Ditambahkan

### ✅ **Data Real-time dari TMDB**
- Film Popular
- Film Top Rated
- Film Now Playing (Sedang Tayang)
- Film Upcoming (Akan Datang)

### ✅ **Pencarian Film**
- Search real-time dengan debouncing
- Hasil pencarian dari API TMDB

### ✅ **Gambar dari API**
- Poster film dari server TMDB
- Caching gambar untuk performa optimal
- Placeholder dan error handling

### ✅ **State Management**
- Bloc pattern untuk manajemen state
- Loading states
- Error handling
- Pull-to-refresh

## 📁 File Baru yang Ditambahkan

```
lib/
├── core/
│   ├── data/
│   │   ├── models/
│   │   │   └── tmdb_movie.dart          # Model untuk data TMDB
│   │   └── services/
│   │       └── movie_api_service.dart   # Service untuk API calls
│   └── network/
│       └── api_constants.dart           # Konstanta dan helper API
└── feature/
    └── home/
        ├── data/
        │   └── bloc/
        │       ├── movie_bloc.dart      # Bloc untuk state management
        │       └── movie_event.dart     # Events dan States
        └── presentation/
            └── views/
                └── api_movie_list_view.dart  # Widget untuk list film API
```

## 📱 Dependencies Baru

```yaml
dependencies:
  # API & Network
  http: ^1.2.0
  dio: ^5.4.0
  # Caching
  cached_network_image: ^3.3.1
  # Utility
  equatable: ^2.0.5
```

## 🔄 Migrasi dari Data Statis

### **Sebelum:**
- Data film dari asset lokal
- Model `MovieModel` sederhana
- Gambar dari folder `assets/`

### **Sesudah:**
- Data film dari TMDB API
- Model `TMDBMovie` lengkap dengan metadata
- Gambar dari TMDB server dengan caching

## 🎯 API Endpoints yang Digunakan

1. **Popular Movies**: `/movie/popular`
2. **Top Rated**: `/movie/top_rated`
3. **Now Playing**: `/movie/now_playing`
4. **Upcoming**: `/movie/upcoming`
5. **Search**: `/search/movie`

## 🔍 Contoh Response API

```json
{
  "page": 1,
  "results": [
    {
      "id": 12345,
      "title": "Movie Title",
      "overview": "Movie description...",
      "poster_path": "/poster.jpg",
      "backdrop_path": "/backdrop.jpg",
      "vote_average": 8.5,
      "release_date": "2024-01-01",
      "genre_ids": [28, 12, 16]
    }
  ],
  "total_pages": 500,
  "total_results": 10000
}
```

## 🛠️ Troubleshooting

### **Error: API Key tidak valid**
- Pastikan API key sudah benar di `api_constants.dart`
- Pastikan API key aktif di akun TMDB Anda

### **Error: Network/Internet**
- Pastikan device/emulator terhubung internet
- Check firewall atau proxy settings

### **Error: Loading lambat**
- Gambar akan di-cache setelah download pertama
- Performa akan membaik setelah penggunaan

## 🎨 UI/UX Improvements

1. **Loading States**: Spinner saat load data
2. **Error Handling**: Pesan error yang user-friendly
3. **Retry Mechanism**: Tombol retry saat error
4. **Pull to Refresh**: Swipe down untuk refresh data
5. **Search UX**: Clear button dan debouncing

## 🔮 Pengembangan Selanjutnya

- [ ] Detail film
- [ ] Favorit offline
- [ ] Filter berdasarkan genre
- [ ] Pagination untuk load more
- [ ] Watchlist personal
- [ ] Rating dan review

---

**🎉 Selamat! Aplikasi Anda sekarang menggunakan data real-time dari TMDB API.**
