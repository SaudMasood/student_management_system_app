<div align="center">

# 🏫 School Management System

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=22&pause=1000&color=2E86DE&center=true&vCenter=true&width=650&lines=Offline+School+Management+System;Built+with+Flutter+%2B+GetX+%2B+SQLite;Week+4+Internship+Project+%40+Owasoft+Technologies" alt="Typing SVG" />

<br/>

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![GetX](https://img.shields.io/badge/GetX-7C4DFF?style=for-the-badge&logo=flutter&logoColor=white)
![SQLite](https://img.shields.io/badge/SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

![Platform](https://img.shields.io/badge/Platform-Android-3DDC84?style=flat-square&logo=android&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-success?style=flat-square)
![Architecture](https://img.shields.io/badge/Architecture-Feature--Based-orange?style=flat-square)
![Internship](https://img.shields.io/badge/Internship-Week%204-blueviolet?style=flat-square)

</div>

---

A professional **Offline School Management System** built with **Flutter** as part of my **Week 4 Flutter Development Internship at Owasoft Technologies Pvt. Ltd.**

The application provides a complete solution for managing school-related records including **students, teachers, classes, attendance, fees, marks, exams, reports, and admin authentication** — all stored locally using **SQLite (Sqflite)** and managed reactively with **GetX**.

<div align="center">

```text
┌─────────────────────────────────────────────┐
│   🔐 Auth  →  🏠 Home  →  📊 Manage & Report │
└─────────────────────────────────────────────┘
```

</div>

---

## 📱 Project Overview

The **School Management System** is designed to simplify everyday school administration tasks through a clean, offline-first Flutter application.

The system allows an administrator to:

- 🔐 Register and login as an admin
- 👨‍🎓 Manage students
- 👨‍🏫 Manage teachers
- 🏫 Manage classes
- 📋 Record student attendance
- 💰 Manage student fees
- 📝 Manage student marks
- 📚 Manage examination records
- 📊 Generate reports
- ⚙️ Manage application settings
- 🌙 Switch between Light and Dark Mode
- 🚪 Logout securely from the application
- 💾 Store data locally using SQLite

---

## 🎯 Internship Information

<div align="center">

| | |
|---|---|
| **Internship** | Flutter Development Internship |
| **Company** | Owasoft Technologies Pvt. Ltd. |
| **Week** | Week 4 |
| **Project** | School Management System |
| **Platform** | Flutter / Android |
| **Database** | SQLite using Sqflite |
| **State Management** | GetX |
| **Architecture** | Feature-Based Structure |

</div>

---

## ✨ Features

<details open>
<summary><b>🔐 Admin Authentication</b></summary>
<br>

The application includes a simple local admin authentication system.

- Admin Signup
- Admin Login
- Email and password validation
- Local admin storage
- Login success/failure handling
- Logout functionality
- Navigation to Home Screen after successful login

Admin information is stored locally in the SQLite database.

</details>

<details>
<summary><b>👨‍🎓 Student Management</b></summary>
<br>

The Student module allows the administrator to manage student records.

- Add / View / Update / Delete Student
- Student ID, Name, Roll Number, Class Name
- Student Report

```text
Student ID
Student Name
Roll Number
Class
```

</details>

<details>
<summary><b>👨‍🏫 Teacher Management</b></summary>
<br>

The Teacher module manages teacher records.

- Add / View / Update / Delete Teacher
- Teacher ID, Name, Subject, Phone Number
- Teacher Report

Teacher reports provide an overview of registered teachers and their assigned subjects.

</details>

<details>
<summary><b>🏫 Class Management</b></summary>
<br>

The Class module allows school administrators to manage classes.

- Add / View / Update / Delete Class
- Class ID, Class Name, Assigned Teacher
- Class Report

</details>

<details>
<summary><b>📋 Attendance Management</b></summary>
<br>

The Attendance module is used to record student attendance.

- Add / View / Update / Delete Attendance
- Student ID, Attendance Status
- Attendance Report

```text
Student ID: 101
Status: Present
```

</details>

<details>
<summary><b>💰 Fee Management</b></summary>
<br>

The Fee module manages student fee records.

- Add / View / Update / Delete Fee
- Student ID, Fee Amount, Payment Status
- Student Fee Records

```text
Student ID: 101
Amount: 5000
Status: Paid
```

</details>

<details>
<summary><b>📝 Marks Management</b></summary>
<br>

The Marks module manages academic marks.

- Add / View / Update / Delete Marks
- Student ID, Subject, Total Marks, Obtained Marks
- Marks Report + Average Marks Calculation

```text
Student ID: 101
Subject: Mathematics
Total Marks: 100
Obtained Marks: 85
```

</details>

<details>
<summary><b>📚 Examination Management</b></summary>
<br>

The application includes an examination-related module for managing academic examination information. Exam functionality is integrated into the feature-based project structure and works with the local database architecture.

</details>

<details>
<summary><b>📊 Reports</b></summary>
<br>

Available reports include:

- Student Report · Teacher Report · Class Report
- Attendance Report · Fee Report · Marks Report
- Overall Reports

</details>

<details>
<summary><b>⚙️ Settings</b></summary>
<br>

- School Name, Phone Number, Address
- Save Settings
- Light Mode / Dark Mode
- About Application

</details>

<details>
<summary><b>🌙 Light & Dark Mode</b></summary>
<br>

Theme configuration is centralized inside `lib/core/theme/`:

```text
app_colors.dart
app_theme.dart
```

The theme can be changed from the Settings screen.

</details>

<details>
<summary><b>🧭 Navigation Drawer</b></summary>
<br>

Quick access to: 🏠 Home · 👨‍🎓 Students · 👨‍🏫 Teachers · 🏫 Classes · 📋 Attendance · 💰 Fees · 📝 Marks · 📊 Reports · ⚙️ Settings · ℹ️ About · 🚪 Logout

Designed with scrolling and SafeArea support for better usability across screen sizes.

</details>

---

## 🛠️ Technologies Used

<div align="center">

| Technology | Purpose |
|---|---|
| ![Flutter](https://img.shields.io/badge/-Flutter-02569B?style=flat-square&logo=flutter&logoColor=white) | Application development |
| ![Dart](https://img.shields.io/badge/-Dart-0175C2?style=flat-square&logo=dart&logoColor=white) | Programming language |
| ![GetX](https://img.shields.io/badge/-GetX-7C4DFF?style=flat-square) | State management |
| ![Sqflite](https://img.shields.io/badge/-Sqflite-003B57?style=flat-square&logo=sqlite&logoColor=white) | Local SQLite database |
| ![Material](https://img.shields.io/badge/-Material%20Design-757575?style=flat-square&logo=materialdesign&logoColor=white) | UI components |
| ![Android Studio](https://img.shields.io/badge/-Android%20Studio-3DDC84?style=flat-square&logo=androidstudio&logoColor=white) | Development |
| ![VS Code](https://img.shields.io/badge/-VS%20Code-007ACC?style=flat-square&logo=visualstudiocode&logoColor=white) | Development |
| ![Git](https://img.shields.io/badge/-Git-F05032?style=flat-square&logo=git&logoColor=white) | Version control |
| ![GitHub](https://img.shields.io/badge/-GitHub-181717?style=flat-square&logo=github&logoColor=white) | Source code management |

</div>

---

## 🏗️ Project Architecture

The project follows a **feature-based architecture**. Each major functionality has its own feature folder.

```text
lib/
│
├── core/
│   ├── constants/
│   │   └── app_constants.dart
│   ├── theme/
│   │   ├── app_colors.dart
│   │   └── app_theme.dart
│   ├── utils/
│   │   └── validators.dart
│   └── widgets/
│       └── custom_app_bar.dart
│
├── database/
│   └── database_helper.dart
│
├── features/
│   ├── attendance/
│   │   ├── controller/
│   │   │   └── attendencecontroller.dart
│   │   ├── model/
│   │   │   └── attendance_model.dart
│   │   └── screen/
│   │       ├── attendance_report_screen.dart
│   │       └── attendance_screen.dart
│   │
│   ├── auth/
│   │   ├── controller/
│   │   │   └── authcontroler.dart
│   │   ├── model/
│   │   └── screen/
│   │       ├── login_screen.dart
│   │       └── signup_screen.dart
│   │
│   ├── classes/
│   │   ├── controller/
│   │   ├── model/
│   │   └── screen/
│   │
│   ├── exams/
│   │   ├── controller/
│   │   ├── model/
│   │   └── screen/
│   │
│   ├── fees/
│   │   ├── controller/
│   │   ├── model/
│   │   └── screen/
│   │
│   ├── home/
│   │   └── screen/
│   │
│   ├── reports/
│   │   ├── controller/
│   │   └── screen/
│   │
│   ├── settings/
│   │   ├── controller/
│   │   └── screen/
│   │
│   ├── splash/
│   │   └── screen/
│   │
│   ├── students/
│   │   ├── controller/
│   │   ├── model/
│   │   └── screen/
│   │
│   └── teachers/
│       ├── controller/
│       ├── model/
│       └── screen/
│
└── main.dart
```

---

## 🧩 Architecture Explanation

Each feature is separated into different responsibilities.

**Controller** — business logic, database operations, reactive variables, CRUD functions, loading states (e.g. `StudentController`, `TeacherController`, `ClassController`, `MarksController`).

**Model** — represents database records as Dart objects (e.g. `StudentModel`, `TeacherModel`, `AttendanceModel`), making database data easier to work with inside the UI.

**Screen** — contains the user interface (e.g. `StudentScreen`, `TeacherScreen`, `AttendanceScreen`, `MarksScreen`, `SettingsScreen`).

---

## 🗄️ Database

The application uses **SQLite through Sqflite** for offline storage.

Main database file: `lib/database/database_helper.dart`
Database name: `school.db`

### 📊 Database Tables

<table>
<tr>
<td valign="top">

**Students**
```text
students
├── id
├── name
├── roll_no
└── class_name
```

**Attendance**
```text
attendance
├── id
├── student_id
└── status
```

**Marks**
```text
marks
├── id
├── student_id
├── subject
├── total_marks
└── obtained_marks
```

</td>
<td valign="top">

**Teachers**
```text
teachers
├── id
├── name
├── subject
└── phone
```

**Fees**
```text
fees
├── id
├── student_id
├── amount
└── status
```

**Admin**
```text
admin
├── id
├── name
├── email
└── password
```

</td>
<td valign="top">

**Classes**
```text
classes
├── id
├── name
└── teacher
```

</td>
</tr>
</table>

---

## 🔄 CRUD Operations

```text
C → Create
R → Read
U → Update
D → Delete
```

```text
Add Student → Save to SQLite → Read Students → Display List → Update / Delete
```

The same approach is used for teachers, classes, attendance, fees, and marks.

---

## ⚡ GetX State Management

GetX is used for reactive state management.

```dart
final students = <StudentModel>[].obs;

// When data changes:
students.assignAll(data);

// UI updates automatically:
Obx(() {
  return ...;
});

// Dependency management:
Get.put(StudentController());
Get.find<StudentController>();
```

---

## 🎨 UI & Design

The application follows a clean Material Design interface with **smooth micro-interactions** layered on top of standard widgets:

- 🌗 Animated theme transition between Light and Dark Mode (`AnimatedTheme` / `AnimatedSwitcher`)
- 📥 `Hero` and fade transitions between list screens and detail/report screens
- 🎬 `AnimatedContainer` / `AnimatedOpacity` for card taps and state changes
- ⏳ Skeleton/shimmer-style loading indicators while reading from SQLite
- 🧭 Slide-in Navigation Drawer with staggered menu item entrance
- ➕ Scale/rotate animation on the Floating Action Button when opening Add forms
- ✅ Snackbar/Toast animations (via `GetX` `Get.snackbar`) for success & error feedback

UI elements: Cards, ListTiles, AppBars, Floating Action Buttons, Dialogs, TextFields, Buttons, Navigation Drawer, Switches, Circular Progress Indicators, empty-state screens, and report cards — with centralized colors and themes for consistency.

---

## 📁 Core Layer

```text
core/
├── constants/    → App-wide constant values
├── theme/        → Light Theme, Dark Theme, App Colors
├── utils/        → Reusable validation logic
└── widgets/      → Reusable UI components
```

---

## 🚀 Getting Started

**1. Clone the Repository**
```bash
git clone https://github.com/SaudMasood/student_management_system_app.git
```

**2. Open the Project**
```bash
cd student_management_system_app
```

**3. Get Flutter Packages**
```bash
flutter pub get
```

**4. Check Flutter Setup**
```bash
flutter doctor
```

**5. Run the Application**
```bash
flutter run
```

---

## 📱 Build APK

```bash
flutter build apk --release
```

APK location:
```text
build/app/outputs/flutter-apk/app-release.apk
```

For separate APKs based on CPU architecture:
```bash
flutter build apk --split-per-abi
```

---

## 🔑 Admin Authentication Flow

```text
Start Application → Splash → Admin Login → Enter Email + Password
   → Check SQLite Database → Valid → Home Screen
                            → Invalid → Error Message
```

## 👨‍🎓 Student Management Flow

```text
Student Screen → Add Student → Enter Information → Save to SQLite
   → Student List → Edit / Delete → Student Report
```

## 📊 Reporting Flow

```text
Home / Reports → Select Module → Read SQLite Data
   → Calculate / Display Data → Generate Report
```

## 🌙 Theme Flow

```text
Settings → Appearance → Light Mode / Dark Mode
   → GetX Controller → MaterialApp ThemeMode (Animated) → Application Theme Changes
```

---

## 🧪 Testing

| Module | Add | View | Update | Delete | Report |
|---|:---:|:---:|:---:|:---:|:---:|
| Authentication | ✅ Signup | ✅ Login | — | — | ✅ Logout |
| Students | ✅ | ✅ | ✅ | ✅ | ✅ |
| Teachers | ✅ | ✅ | ✅ | ✅ | ✅ |
| Classes | ✅ | ✅ | ✅ | ✅ | — |
| Attendance | ✅ | ✅ | ✅ | ✅ | ✅ |
| Fees | ✅ | ✅ | ✅ | ✅ | — |
| Marks | ✅ | ✅ | ✅ | ✅ | ✅ Avg |
| Settings | ✅ Info | — | ✅ Theme | — | ✅ About |

---

## 💡 Key Learning Outcomes

- Flutter application architecture and feature-based project structure
- Dart OOP
- GetX state management, reactive programming with `.obs`, `Obx`, and dependency injection
- SQLite database integration and Sqflite CRUD operations
- Database table design and model classes
- Controller-based architecture
- Form handling and input validation
- Navigation, Navigation Drawer, and screen/theme animations
- Dialogs, reports, and calculations
- Light/Dark theme implementation
- Reusable widgets
- Git and GitHub workflow
- Flutter APK generation

---

## 📌 Project Highlights

<div align="center">

![](https://img.shields.io/badge/✅-Offline%20First%20Application-2E86DE?style=flat-square)
![](https://img.shields.io/badge/✅-Local%20SQLite%20Database-2E86DE?style=flat-square)
![](https://img.shields.io/badge/✅-Admin%20Authentication-2E86DE?style=flat-square)
![](https://img.shields.io/badge/✅-CRUD%20Operations-2E86DE?style=flat-square)
![](https://img.shields.io/badge/✅-Feature--Based%20Architecture-2E86DE?style=flat-square)
![](https://img.shields.io/badge/✅-GetX%20State%20Management-2E86DE?style=flat-square)
![](https://img.shields.io/badge/✅-Animated%20UI%20Transitions-2E86DE?style=flat-square)
![](https://img.shields.io/badge/✅-Light%20%26%20Dark%20Theme-2E86DE?style=flat-square)
![](https://img.shields.io/badge/✅-Navigation%20Drawer-2E86DE?style=flat-square)
![](https://img.shields.io/badge/✅-Reports-2E86DE?style=flat-square)

</div>

---

## 🔮 Future Improvements

- 🔐 Password hashing
- 👤 Multiple admin roles
- ☁️ Cloud database synchronization
- 🔥 Firebase authentication
- 📄 PDF report generation
- 📊 Advanced analytics dashboard with animated charts
- 📈 Attendance charts
- 📚 Subject management
- 🔎 Search and filtering
- 📤 Export reports
- 🔔 Notifications
- 💾 Backup and restore
- 🌐 Online synchronization
- ✨ Lottie-based onboarding and empty-state animations

---

## 📂 Main Project Structure

```text
student_management_system_app/
│
├── android/
├── ios/
├── linux/
├── macos/
├── web/
├── windows/
│
├── lib/
│   ├── core/
│   ├── database/
│   ├── features/
│   └── main.dart
│
├── test/
│
├── pubspec.yaml
├── analysis_options.yaml
├── LICENSE
└── README.md
```

---

## 🏆 Internship Project

This project was developed as part of my **Week 4 Flutter Development Internship at Owasoft Technologies Pvt. Ltd.** It helped me apply Flutter development concepts in a complete practical application rather than isolated examples.

**Week 4 Focus:**
```text
Flutter → CRUD Operations → SQLite / Sqflite → GetX State Management
   → Feature-Based Architecture → UI Animations → Reports → Complete School Management Application
```

---

## 👨‍💻 Developer

<div align="center">

**Saud Masood**
BS Computer Science Graduate
Flutter Developer | Mobile Application Developer

![Flutter](https://img.shields.io/badge/-Flutter-02569B?style=flat-square&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/-Dart-0175C2?style=flat-square&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/-Firebase-FFCA28?style=flat-square&logo=firebase&logoColor=black)
![SQLite](https://img.shields.io/badge/-SQLite-003B57?style=flat-square&logo=sqlite&logoColor=white)
![GetX](https://img.shields.io/badge/-GetX-7C4DFF?style=flat-square)
![REST API](https://img.shields.io/badge/-REST%20APIs-25D366?style=flat-square)

</div>

---

## 📜 License

This project is licensed under the MIT License.

---

<div align="center">

## ⭐ Support

If you find this project useful or interesting, consider giving the repository a ⭐ on GitHub.

**School Management System — Week 4 Flutter Internship Project**
Built with ❤️ using Flutter and Dart.

</div>
