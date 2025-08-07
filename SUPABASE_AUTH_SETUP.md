# 🔐 Supabase Authentication Setup Guide

## ✅ **Status: CONFIGURED & READY TO USE!**

Sistem authentication Supabase telah berhasil diintegrasikan dengan aplikasi Movie UI Anda.

### 🔗 **Supabase Project Details:**
- **Project URL:** `https://hipvsxhsvjsfwczijjqj.supabase.co`
- **Anon Key:** `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...`
- **Status:** ✅ **ACTIVE & CONFIGURED**

2. **Buat Project Baru:**
   - Klik "New Project"
   - Isi nama project: `movie-app-auth`
   - Pilih organization (atau buat baru)
   - Pilih region terdekat (misalnya Singapore untuk Indonesia)
   - Atur database password yang kuat
   - Klik "Create new project"

3. **Dapatkan Credentials:**
   - Tunggu project selesai dibuat (± 2 menit)
   - Pergi ke **Settings** → **API**
   - Copy **Project URL** dan **anon public key**

### 2. 🔧 **Konfigurasi Aplikasi**

1. **Update Supabase Config:**
   Edit file `lib/core/config/supabase_config.dart`:
   
   ```dart
   class SupabaseConfig {
     // 🔴 GANTI DENGAN CREDENTIALS SUPABASE ANDA
     static const String supabaseUrl = 'https://your-project-id.supabase.co';
     static const String supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';
   }
   ```

2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Setup Email Templates (Opsional):**
   - Pergi ke **Authentication** → **Settings** 
   - Customize email templates untuk konfirmasi dan reset password

### 3. 🔑 **Konfigurasi Authentication**

1. **Enable Email Authentication:**
   - Pergi ke **Authentication** → **Settings**
   - Pastikan **Email** provider enabled
   - Atur "Confirm email" sesuai kebutuhan:
     - `Enabled`: User harus konfirmasi email
     - `Disabled`: User langsung bisa login

2. **Configure Site URL:**
   - Di **Authentication** → **Settings** → **Site URL**
   - Tambahkan: `http://localhost:3000` (untuk development)

3. **Setup Redirect URLs (untuk production):**
   - Tambahkan domain aplikasi Anda
   - Misalnya: `https://yourdomain.com`

### 4. 🛡️ **Row Level Security (RLS)**

Supabase menggunakan RLS untuk keamanan data. Untuk basic auth, ini sudah ditangani otomatis.

### 5. ✅ **Testing Authentication**

1. **Jalankan Aplikasi:**
   ```bash
   flutter run
   ```

2. **Test Flow:**
   - Daftar dengan email dan password
   - Check email untuk konfirmasi (jika enabled)
   - Login dengan credentials
   - Test logout
   - Test forgot password

### 6. 🔍 **Monitoring & Debug**

1. **Supabase Dashboard:**
   - **Authentication** → **Users**: Lihat user terdaftar
   - **Logs**: Debug API calls

2. **Flutter Debug:**
   - Check console untuk error messages
   - Debug dengan breakpoints di AuthService

### 7. 🚀 **Production Setup**

1. **Environment Variables:**
   ```dart
   // Buat file env_config.dart untuk production
   class EnvConfig {
     static const String supabaseUrl = String.fromEnvironment('SUPABASE_URL');
     static const String supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');
   }
   ```

2. **Build Command:**
   ```bash
   flutter build apk --dart-define=SUPABASE_URL=your_url --dart-define=SUPABASE_ANON_KEY=your_key
   ```

### 8. 🔧 **Troubleshooting**

#### **Error: Invalid API URL**
```
✅ Solution: Pastikan URL Supabase benar dan tidak ada trailing slash
```

#### **Error: Invalid API Key** 
```
✅ Solution: Gunakan anon public key, bukan service role key
```

#### **Error: Email not confirmed**
```
✅ Solution: 
- Check email spam folder
- Disable email confirmation di Supabase settings
- Resend confirmation email
```

#### **Error: Network request failed**
```
✅ Solution:
- Check internet connection
- Pastikan Supabase project tidak di-pause
- Check firewall settings
```

### 9. 📚 **Fitur Authentication yang Tersedia**

✅ **Register dengan Email & Password**
✅ **Login dengan Email & Password**  
✅ **Logout**
✅ **Reset Password**
✅ **Update Profile**
✅ **Change Password**
✅ **Auth State Management**
✅ **Auto Login (Session persistence)**

### 10. 🎯 **Next Steps**

- **User Profiles**: Buat tabel profiles untuk data tambahan
- **Social Auth**: Tambah Google, Facebook login
- **Email Verification**: Custom verification flow
- **Security**: Implement MFA, rate limiting
- **Analytics**: Track auth events

---

## 🛠️ **Files yang Dibuat:**

```
lib/
├── core/
│   ├── auth/
│   │   ├── bloc/
│   │   │   ├── auth_bloc.dart       # State management
│   │   │   └── auth_event.dart      # Events & states
│   │   ├── models/
│   │   │   └── auth_models.dart     # User & credentials models
│   │   ├── services/
│   │   │   └── auth_service.dart    # Supabase integration
│   │   └── widgets/
│   │       ├── auth_guard.dart      # Route protection
│   │       └── auth_widgets.dart    # Reusable UI components
│   └── config/
│       └── supabase_config.dart     # API configuration
├── feature/
│   ├── sign_in/
│   │   └── presentation/screens/
│   │       └── sign_in_screen.dart  # Login UI
│   └── sign_up/
│       └── presentation/screens/
│           └── sign_up_screen.dart  # Register UI
```

**Happy Coding! 🎉**
