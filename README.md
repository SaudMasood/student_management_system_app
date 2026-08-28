# 🏫 School Management System

A professional **Offline School Management System** built with **Flutter** as part of my **Week 4 Flutter Development Internship at Owasoft Technologies Pvt. Ltd.**

The application provides a complete solution for managing school-related records including **students, teachers, classes, attendance, fees, marks, exams, reports, and admin authentication**.

The application uses **Sqflite/SQLite for local data storage** and **GetX for state management**, making it suitable for offline school administration.

---

## 📱 Project Overview

The **School Management System** is designed to simplify everyday school administration tasks through a clean and easy-to-use Flutter application.

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

**Internship:** Flutter Development Internship
**Company:** Owasoft Technologies Pvt. Ltd.
**Week:** Week 4
**Project:** School Management System
**Platform:** Flutter / Android
**Database:** SQLite using Sqflite
**State Management:** GetX
**Architecture:** Feature-Based Structure

---

## ✨ Features

### 🔐 Admin Authentication

The application includes a simple local admin authentication system.

Features:

- Admin Signup
- Admin Login
- Email and password validation
- Local admin storage
- Login success/failure handling
- Logout functionality
- Navigation to Home Screen after successful login

Admin information is stored locally in the SQLite database.

---

### 👨‍🎓 Student Management

The Student module allows the administrator to manage student records.

Features:

- Add Student
- View Students
- Update Student
- Delete Student
- Student ID
- Student Name
- Roll Number
- Class Name
- Student Report

Example student information:

```text
Student ID
Student Name
Roll Number
Class
```

---

### 👨‍🏫 Teacher Management

The Teacher module manages teacher records.

Features:

- Add Teacher
- View Teachers
- Update Teacher
- Delete Teacher
- Teacher ID
- Teacher Name
- Subject
- Phone Number
- Teacher Report

Teacher reports provide an overview of registered teachers and their assigned subjects.

---

### 🏫 Class Management

The Class module allows school administrators to manage classes.

Features:

- Add Class
- View Classes
- Update Class
- Delete Class
- Class ID
- Class Name
- Assigned Teacher
- Class Report

---

### 📋 Attendance Management

The Attendance module is used to record student attendance.

Features:

- Add Attendance
- View Attendance
- Update Attendance
- Delete Attendance
- Student ID
- Attendance Status
- Attendance Report

Example:

```text
Student ID: 101
Status: Present
```

---

### 💰 Fee Management

The Fee module manages student fee records.

Features:

- Add Fee
- View Fees
- Update Fee
- Delete Fee
- Student ID
- Fee Amount
- Payment Status
- Student Fee Records

Example:

```text
Student ID: 101
Amount: 5000
Status: Paid
```

---

### 📝 Marks Management

The Marks module manages academic marks.

Features:

- Add Marks
- View Marks
- Update Marks
- Delete Marks
- Student ID
- Subject
- Total Marks
- Obtained Marks
- Marks Report
- Average Marks Calculation

Example:

```text
Student ID: 101
Subject: Mathematics
Total Marks: 100
Obtained Marks: 85
```

---

### 📚 Examination Management

The application includes an examination-related module for managing academic examination information.

The exam functionality is integrated into the feature-based project structure and works with the local database architecture.

---

### 📊 Reports

The application provides reporting screens for different areas of the school system.

Available reports include:

- Student Report
- Teacher Report
- Class Report
- Attendance Report
- Fee Report
- Marks Report
- Overall Reports

Reports provide useful information from the locally stored database.

---

### ⚙️ Settings

The Settings module provides application configuration options.

Features:

- School Name
- Phone Number
- Address
- Save Settings
- Light Mode
- Dark Mode
- About Application

---

### 🌙 Light & Dark Mode

The application supports both:

- ☀️ Light Mode
- 🌙 Dark Mode

Theme configuration is centralized inside:

```text
lib/core/theme/
```

Files:

```text
app_colors.dart
app_theme.dart
```

The theme can be changed from the Settings screen.

---

### 🧭 Navigation Drawer

The Home Screen includes a navigation drawer for quick access to application modules.

The drawer provides navigation to areas such as:

- 🏠 Home
- 👨‍🎓 Students
- 👨‍🏫 Teachers
- 🏫 Classes
- 📋 Attendance
- 💰 Fees
- 📝 Marks
- 📊 Reports
- ⚙️ Settings
- ℹ️ About
- 🚪 Logout

The drawer is designed with scrolling and SafeArea support for better usability on different screen sizes.

---

## 🛠️ Technologies Used

| Technology      | Purpose                 |
| --------------- | ----------------------- |
| Flutter         | Application development |
| Dart            | Programming language    |
| GetX            | State management        |
| Sqflite         | Local SQLite database   |
| SQLite          | Local data storage      |
| Material Design | UI components           |
| Android Studio  | Development              |
| VS Code         | Development              |
| Git             | Version control          |
| GitHub          | Source code management   |

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

Main database file:

```text
lib/database/database_helper.dart
```

Database name: `school.db`

### 📊 Database Tables

**Students**
```text
students
├── id
├── name
├── roll_no
└── class_name
```

**Teachers**
```text
teachers
├── id
├── name
├── subject
└── phone
```

**Classes**
```text
classes
├── id
├── name
└── teacher
```

**Attendance**
```text
attendance
├── id
├── student_id
└── status
```

**Fees**
```text
fees
├── id
├── student_id
├── amount
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

**Admin**
```text
admin
├── id
├── name
├── email
└── password
```

---

## 🔄 CRUD Operations

The project implements CRUD operations throughout the application:

```text
C → Create
R → Read
U → Update
D → Delete
```

Flow example:

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

The application follows a clean Material Design interface, using Cards, ListTiles, AppBars, Floating Action Buttons, Dialogs, TextFields, Buttons, a Navigation Drawer, Switches, Circular Progress Indicators, empty-state screens, and report cards — with centralized colors and themes for consistency.

---

## 📁 Core Layer

The `core` folder contains reusable application-wide components:

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

---

## 👨‍🎓 Student Management Flow

```text
Student Screen → Add Student → Enter Information → Save to SQLite
   → Student List → Edit / Delete → Student Report
```

---

## 📊 Reporting Flow

```text
Home / Reports → Select Module → Read SQLite Data
   → Calculate / Display Data → Generate Report
```

Reports can provide information such as total students, total teachers, classes, attendance records, fee records, marks records, average marks, teacher subjects, and student information.

---

## 🌙 Theme Flow

```text
Settings → Appearance → Light Mode / Dark Mode
   → GetX Controller → MaterialApp ThemeMode → Application Theme Changes
```

---

## 🧪 Testing

**Authentication:** Admin Signup · Admin Login · Invalid Login · Logout

**Students:** Add · View · Update · Delete · Report

**Teachers:** Add · View · Update · Delete · Report

**Classes:** Add · View · Update · Delete

**Attendance:** Add · View · Update · Delete · Report

**Fees:** Add · View · Update · Delete

**Marks:** Add · View · Update · Delete · Average Report

**Settings:** School Information · Theme Switching · About Section

---

## 💡 Key Learning Outcomes

Through this project, I practiced and improved my understanding of:

- Flutter application architecture and feature-based project structure
- Dart OOP
- GetX state management, reactive programming with `.obs`, `Obx`, and dependency injection
- SQLite database integration and Sqflite CRUD operations
- Database table design and model classes
- Controller-based architecture
- Form handling and input validation
- Navigation and the Navigation Drawer
- Dialogs, reports, and calculations
- Light/Dark theme implementation
- Reusable widgets
- Git and GitHub workflow
- Flutter APK generation

---

## 📌 Project Highlights

```text
✅ Offline First Application
✅ Local SQLite Database
✅ Admin Authentication
✅ CRUD Operations
✅ Feature-Based Architecture
✅ GetX State Management
✅ Multiple Management Modules
✅ Reports
✅ Light & Dark Theme
✅ Navigation Drawer
✅ Reusable Components
✅ Responsive Material UI
```

---

## 🔮 Future Improvements

- 🔐 Password hashing
- 👤 Multiple admin roles
- ☁️ Cloud database synchronization
- 🔥 Firebase authentication
- 📄 PDF report generation
- 📊 Advanced analytics dashboard
- 📈 Attendance charts
- 📚 Subject management
- 🔎 Search and filtering
- 📤 Export reports
- 🔔 Notifications
- 💾 Backup and restore
- 🌐 Online synchronization

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
   → Feature-Based Architecture → Reports → Complete School Management Application
```

---

## 👨‍💻 Developer

**Saud Masood**
BS Computer Science Student
Flutter Developer | Mobile Application Developer

**Technical Interests:** Flutter & Dart · Mobile Application Development · Firebase · SQLite / Sqflite · GetX · REST APIs · AI/ML Integration · Software Development

---

## 📜 License

This project is licensed under the MIT License.

---

## ⭐ Support

If you find this project useful or interesting, consider giving the repository a ⭐ on GitHub.

---

**School Management System — Week 4 Flutter Internship Project**
Built with ❤️ using Flutter and Dart.
