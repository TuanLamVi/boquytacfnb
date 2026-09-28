# F&B SMART BUILD BASELINE

## Baseline ID

A0-BUILD-001

## Project

* **Project root:** `C:\Users\Admin\Desktop\Android\fnb_smart`
* **Flutter root:** `C:\Users\Admin\Desktop\flutter_windows_3.41.0-stable\flutter`
* **Android root:** `C:\Users\Admin\Desktop\Android\fnb_smart\android`

---

## Git

* **Branch:** `fix/v4.6.9-rc17-patch4b-auth-logging`
* **HEAD:** `be00e47b7c69746d2d55e6c7a97ce55453b54c80`
* **Worktree status:** Dirty (pre-existing workspace changes)
* **Important existing changes:** Must be preserved. Do not reset, clean, restore, stash, rebase, commit, or push without explicit PO authorization.

---

## Toolchain

* **Flutter:** `3.41.0`
* **Dart:** `3.11.0`
* **Java:** `17.0.20.1`
* **JAVA_HOME:** `C:\Users\Admin\AppData\Local\Programs\Eclipse Adoptium\jdk-17.0.20.101-hotspot\`
* **JDK vendor:** Eclipse Adoptium
* **Gradle:** `8.13`
* **AGP:** `8.11.1`
* **Kotlin:** `2.2.20`
* **compileSdk:** `36`
* **targetSdk:** `35`
* **minSdk:** `24`

---

## Android SDK

* **ANDROID_HOME:** `C:\Users\Admin\AppData\Local\Android\Sdk`
* **ANDROID_SDK_ROOT:** `C:\Users\Admin\AppData\Local\Android\Sdk`
* **ANDROID_USER_HOME:** `C:\Users\Admin\.android`
* **ANDROID_PREFS_ROOT:** Unset / empty string
* **SDK path:** `C:\Users\Admin\AppData\Local\Android\Sdk`
* **ADB path:** `C:\Users\Admin\AppData\Local\Android\Sdk\platform-tools\adb.exe`
* **ADB version:** `1.0.41` (`37.0.0-14910828`)

---

## Firebase

* **Firebase project:** `fnb-smart`
* **Environment:** `STAGING`
* **Flavor:** Default
* **Firebase configuration:** Staging configuration via `google-services.json`
* **Production protected:** YES
* **Do not build Production or Release without explicit PO authorization.**

---

## Verified Build

### Latest Verified Build

* **Verified date:** `2026-09-26`
* **Build timestamp:** `2026-09-26 18:53:35`

### Exact Build Command

```powershell
$env:ANDROID_PREFS_ROOT=""
flutter build apk --debug
```

### Build Result

* **Result:** SUCCESS
* **APK output:** `build\app\outputs\flutter-apk\app-debug.apk`

### APK Evidence

* **Verified Work Item:** A3-05 — Shift & ShiftLock State Machine & Data Model Foundation
* **APK output:** `build\app\outputs\flutter-apk\app-debug.apk`
* **SHA256:** `83EDD6AB87AA012633515586F4BF8BE2D331BE51244F07739EA76CEEEC9C5856`
* **Package:** `com.tuan.fnbsmart`
* **Version:** `1.4.0`
* **VersionCode:** `13`

---

## Device Verification

### Samsung M51

* **Role:** Owner / Chủ quán
* **Install:** SUCCESS
* **Launch:** SUCCESS

### Samsung Note8

* **Role:** Employee / Nhân viên
* **Install:** SUCCESS
* **Launch:** SUCCESS

---

## Known Build Requirements

### 1. ANDROID_PREFS_ROOT

`ANDROID_PREFS_ROOT` must be unset / empty during the build session.

Use:

```powershell
$env:ANDROID_PREFS_ROOT=""
```

Reason:

> Prevents the known `AndroidLocationsBuildService` conflict involving `ANDROID_PREFS_ROOT` and `ANDROID_USER_HOME`.

---

### 2. Project Root

Build from:

```text
C:\Users\Admin\Desktop\Android\fnb_smart
```

---

### 3. Flutter / Java Environment

Build using the verified toolchain recorded in this document.

Do not arbitrarily upgrade or downgrade:

* Flutter
* Dart
* Java
* Gradle
* AGP
* Kotlin
* Android SDK

If the environment differs from this baseline, report the difference before making changes.

---

## Rebuild Procedure

1. Open PowerShell in the project root.
2. Confirm the project root is:

```text
C:\Users\Admin\Desktop\Android\fnb_smart
```

3. Confirm the verified Flutter / Dart / Java environment.
4. Ensure `ANDROID_PREFS_ROOT` is empty:

```powershell
$env:ANDROID_PREFS_ROOT=""
```

5. Run:

```powershell
flutter build apk --debug
```

6. Confirm the APK exists at:

```text
build\app\outputs\flutter-apk\app-debug.apk
```

7. Verify the APK:

   * package
   * version
   * versionCode
   * file timestamp
   * SHA256

8. Only after verification, install the APK on the required test device(s).

---

## Installation Procedure

Use:

```text
adb install -r build\app\outputs\flutter-apk\app-debug.apk
```

After installation, verify:

* package;
* version;
* versionCode;
* successful launch.

Never claim that a new APK was installed without verifying that the installed application corresponds to the APK just built.

---

## Forbidden Changes

Do not:

* modify the build toolchain arbitrarily;
* build Production without authorization;
* build Release without authorization;
* change Firebase environment without authorization;
* use destructive Git commands;
* delete or overwrite pre-existing workspace changes;
* change project configuration merely to force a build to succeed.

Forbidden Git operations unless explicitly authorized by PO:

```text
git reset
git clean
git restore
git checkout
git stash
git rebase
git commit
git push
```

---

## Baseline Maintenance Rule

This file is the **current verified build reference** for F&B SMART.

When a newer build environment is successfully verified:

1. record the actual environment used;
2. record the actual successful build command;
3. record the evidence;
4. update this file only when the new environment has been demonstrated to build successfully.

Do not guess or record unverified tool versions.

---

## Current Verified Build Summary

```text
Flutter       3.41.0
Dart          3.11.0
Java          17.0.20.1
Gradle        8.13
AGP           8.11.1
Kotlin        2.2.20
compileSdk    36
targetSdk     35
minSdk        24

ANDROID_HOME       = C:\Users\Admin\AppData\Local\Android\Sdk
ANDROID_SDK_ROOT   = C:\Users\Admin\AppData\Local\Android\Sdk
ANDROID_USER_HOME  = C:\Users\Admin\.android
ANDROID_PREFS_ROOT = EMPTY

Build:
$env:ANDROID_PREFS_ROOT=""
flutter build apk --debug

Firebase:
fnb-smart / STAGING

APK:
build\app\outputs\flutter-apk\app-debug.apk

Package:
com.tuan.fnbsmart

Version:
1.4.0

VersionCode:
13
```
