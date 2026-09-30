# BUILD REPRODUCTION BASELINE — F&B SMART V5.1 CLEAN REBUILD

> **Mục đích:** Tài liệu chuẩn chính thức ghi lại chính xác toàn bộ môi trường, cấu hình, lệnh và thông số output để bất kỳ Coding Agent hoặc Developer nào cũng có thể đọc và tái tạo chính xác 100% bản build F&B SMART V5.1 Clean Rebuild mà không phải đoán.
>
> **Lưu ý:** Build SUCCESS chỉ chứng minh build thành công; không chứng minh chức năng hoặc PO PASS. Bắt buộc phải có Real Device Runtime Test đi kèm.

---

## 1. MÔI TRƯỜNG BUILD (BUILD ENVIRONMENT)

- **Flutter SDK:** `3.41.0` (channel stable, revision `44a626f4f0`)
- **Dart SDK:** `3.11.0` (DevTools `2.54.1`)
- **Java / JDK Version:** `17.0.12` (JVM 17.0.12+8-LTS-286, Java 17 Compatibility)
- **Android SDK Version:**
  - `compileSdk`: `36`
  - `targetSdk`: `36`
  - `minSdk`: `24`
- **Android Gradle Plugin (AGP):** `8.14.0`
- **Gradle Version:** `8.14` (wrapper `gradle-8.14-all.zip`)
- **Kotlin Version:** `2.1.10`
- **NDK Version:** `28.0.13004108`
- **Firebase SDK Dependencies (pubspec.yaml):**
  - `firebase_core`: `^2.24.2`
  - `firebase_auth`: `^4.17.8`
  - `firebase_app_check`: `^0.2.1+8`
  - `cloud_firestore`: `^4.15.8`
- **Core Dependencies:**
  - `get`: `^4.6.5`
  - `crypto`: `^3.0.3`

---

## 2. CẤU HÌNH BUILD (BUILD CONFIGURATION)

- **Application ID:** `com.tuan.fnbsmart`
- **Namespace:** `com.tuan.fnbsmart`
- **Version Name:** `5.1.0-alpha.0`
- **Version Code:** `1`
- **Build Type:** `debug`
- **Build Mode:** `CLEAN_REBUILD`
- **Official Firebase Project ID:** `fnb-smart`
- **Official Clean Rebuild Source Repository:** `TuanLamVi/fnb-smart-v5-clean-rebuild`
- **Official Source Branch:** `main`
- **Source Commit SHA:** `8e7cc12bac86eb66b398d6aeaab686689593147e`
- **Source Root Directory:** `clean_rebuild_v5/`
- **Flutter Entrypoint:** `lib/main.dart`

---

## 3. BỘ LỆNH BUILD VÀ KIỂM THỬ (BUILD COMMANDS)

### 3.1. Thiết lập Môi trường (Pre-requisite)
```powershell
$env:ANDROID_PREFS_ROOT=$null
```
*(Ghi chú: Cần unset ANDROID_PREFS_ROOT để tránh xung đột AndroidLocationsException của Android Gradle Plugin trên Windows).*

### 3.2. Lệnh Tái tạo Build APK
```powershell
cd C:\Users\Admin\Desktop\Android\fnb_smart\clean_rebuild_v5
& "C:\Users\Admin\Desktop\flutter_windows_3.41.0-stable\flutter\bin\flutter.bat" build apk --debug
```

### 3.3. Lệnh Kiểm tra SHA-256 APK
```powershell
(Get-FileHash "C:\Users\Admin\Desktop\Android\fnb_smart\clean_rebuild_v5\build\app\outputs\flutter-apk\app-debug.apk" -Algorithm SHA256).Hash
```

### 3.4. Lệnh Cài đặt ADB lên Thiết bị Thật (Samsung Galaxy M51)
```powershell
& "C:\Users\Admin\AppData\Local\Android\Sdk\platform-tools\adb.exe" -s RF8NC11QQVM install -r "C:\Users\Admin\Desktop\Android\fnb_smart\clean_rebuild_v5\build\app\outputs\flutter-apk\app-debug.apk"
```

### 3.5. Lệnh Khởi chạy App
```powershell
& "C:\Users\Admin\AppData\Local\Android\Sdk\platform-tools\adb.exe" -s RF8NC11QQVM shell am start -n com.tuan.fnbsmart/com.tuan.fnbsmart.MainActivity
```

---

## 4. KẾT QUẢ OUTPUT BẢN BUILD (BUILD OUTPUT)

- **APK Filename:** `app-debug.apk`
- **APK Local Path:** `clean_rebuild_v5/build/app/outputs/flutter-apk/app-debug.apk`
- **APK SHA-256 Hash:** `6CC0829075BDFDB26044F30D769EF340CE3229CC82D369A0514A972AD597AE18`
- **APK File Size:** `148,775,253 bytes` (~141.8 MB)
- **Build Timestamp:** `2026-09-29 16:27:49`
- **Installed Package Name:** `com.tuan.fnbsmart`
- **Installed Version Name:** `5.1.0-alpha.0`
- **Installed Version Code:** `1`

---

## 5. TRẠNG THÁI DEPENDENCY VÀ FILE CẤU HÌNH (DEPENDENCY STATE)

Toàn bộ trạng thái dependency được lưu giữ cố định tại các file thuộc `clean_rebuild_v5/`:
1. `clean_rebuild_v5/pubspec.yaml`
2. `clean_rebuild_v5/pubspec.lock`
3. `clean_rebuild_v5/android/settings.gradle.kts`
4. `clean_rebuild_v5/android/build.gradle.kts`
5. `clean_rebuild_v5/android/app/build.gradle.kts`
6. `clean_rebuild_v5/android/gradle/wrapper/gradle-wrapper.properties`
7. `clean_rebuild_v5/android/app/google-services.json`
8. `clean_rebuild_v5/lib/core/firebase/firebase_options.dart`

---

## 6. KIỂM TRA TÍNH TÁI TẠO (BUILD REPRODUCIBILITY CHECK)

- **Build Reproducibility:** `READY`
- **Xác nhận:** Bất kỳ Coding Agent hoặc Developer nào đọc tài liệu này đều có thể tự chạy bộ lệnh ở Phần 3 trên repository `TuanLamVi/fnb-smart-v5-clean-rebuild` (branch `main`, commit `8e7cc12bac86eb66b398d6aeaab686689593147e`) để tái tạo chính exact APK `com.tuan.fnbsmart` mà không phụ thuộc vào trí nhớ hay các giả định chưa được kiểm chứng.
