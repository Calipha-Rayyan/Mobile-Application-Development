# Mobile Application Development (MAD)

A centralized repository for coursework, lab assignments, Flutter projects, Dart practice programs, and layout demonstrations developed as part of the **Mobile Application Development** course at Quaid-i-Azam University, Islamabad.

This repository organizes practical work in one place, making it easier to develop, maintain, review, and submit coursework while tracking progress through Git and GitHub.

## Repository Structure

```text
Mobile-Application-Development/
│
├── Campus Cafe Order System/
│   ├── Campus_Cafe_Order_System.dart
│   ├── program_output.png
│   └── README.md
│
├── Course Roster Manager/
│   ├── course_roster.dart
│   └── README.md
│
├── Library Desk Assistant/
│   ├── Library_Desk_Assistant.dart
│   ├── image.png
│   ├── image-1.png
│   └── README.md
│
├── oop_lab/
│   ├── library_lab.dart
│   ├── ANSWERS.md
│   └── output.txt
│
├── my_first_app/
│   └── ... (First Flutter application setup)
│
├── flutter_lab/
│   └── ... (Introductory Flutter widgets & state lab)
│
├── layout_lab/
│   ├── lib/
│   │   ├── main.dart
│   │   ├── ANSWERS.md
│   │   ├── screenshot.png
│   │   └── Screenshot 2.png
│   └── ...
│
├── navigation_lab/
│   ├── lib/
│   │   ├── screens/
│   │   │   ├── about_screen.dart
│   │   │   ├── detail_screen.dart
│   │   │   ├── home_screen.dart
│   │   │   └── settings_screen.dart
│   │   ├── data.dart
│   │   └── main.dart
│   ├── pubspec.yaml
│   └── README.md
│
├── demo15a_column_axes.dart
├── demo15b_row_main_axis.dart
├── demo16_overflow.dart
├── demo17_expanded_flexible.dart
├── demo18_container.dart
├── demo19_stack.dart
│
├── Animal.dart
├── Animal1.dart
├── clock_demo.dart
├── equalequal.dart
├── Hello_Dart.dart
├── input_output.dart
├── interpolation.dart
├── logging.dart
├── MixExample.dart
├── Overloading.dart
├── PaymentMethod.dart
├── safety_null.dart
├── Shape.dart
├── .gitignore
└── README.md
```

## Projects and Lab Assignments

### 1. Campus Cafe Order System

A Dart-based project that demonstrates object-oriented programming and a complete cafe ordering workflow.

**Concepts covered:**
- Classes, encapsulation, and objects
- Default, named, and factory constructors
- Initializer lists and assertions
- Getters, setters, and calculated values
- Collections and receipt generation
- Discount coupon handling

**Main file:** `Campus Cafe Order System/Campus_Cafe_Order_System.dart`

---

### 2. Course Roster Manager

A course project focused on organizing and managing student course roster information using Dart collections and data models.

**Main file:** `Course Roster Manager/course_roster.dart`

---

### 3. Library Desk Assistant

A Dart-based lab project that models library desk operations, lending rules, and practical assistant workflows.

**Main file:** `Library Desk Assistant/Library_Desk_Assistant.dart`

---

### 4. Campus Library System — OOP Lab

A comprehensive lab focusing on object-oriented programming paradigms in Dart.

**Main file:** `oop_lab/library_lab.dart`

**Topics covered:**
- Inheritance and method overriding
- Abstract classes and interfaces
- Mixins and enhanced enums
- Extension methods
- Operator overloading, equality, and hash codes
- Static members and constant objects
- Late-fee calculation and member discounts

---

### 5. Flutter Layout Lab (`layout_lab`)

A Flutter application lab dedicated to mastering Flutter layout concepts, component composition, and responsive screen design.

**Topics covered:**
- Row, Column, and nested layouts
- Expanded, Flexible, and SizedBox widgets
- Alignment, padding, and spacing
- Layout questions and visual verification (`ANSWERS.md` and screenshots)

---

### 6. Navigation Lab — Campus Bites (`navigation_lab`)

A Flutter application demonstrating multi-screen navigation and declarative routing with `go_router`.

**Features:**
- **Declarative Routing:** Configured route paths including parameterised routes (`/detail/:id`)
- **Screens:**
  - `HomeScreen`: Displays a catalog of campus dishes
  - `DetailScreen`: Displays dish details passed via route parameters
  - `SettingsScreen`: Theme mode selection (Light/Dark mode)
  - `AboutScreen`: Application overview and info
- **Dynamic Theming:** Light and dark theme switching using `MaterialApp.router`

---

### 7. Flutter Layout Demonstrations

Standalone Flutter layout scripts illustrating fundamental layout widgets:

| File | Topic & Concept |
|---|---|
| `demo15a_column_axes.dart` | Main axis vs. cross axis alignment in a `Column` |
| `demo15b_row_main_axis.dart` | Six values of `MainAxisAlignment` in a `Row` |
| `demo16_overflow.dart` | Handling render overflow issues and fixing them with `Expanded` |
| `demo17_expanded_flexible.dart` | Differences and flex ratios between `Expanded` and `Flexible` |
| `demo18_container.dart` | Box decoration, margins, padding, and constraints with `Container` |
| `demo19_stack.dart` | Layering widgets using `Stack` and `Positioned` |

---

### 8. Dart Practice Programs

Individual Dart programs for practicing language features and fundamentals:

| File | Purpose |
|---|---|
| `Hello_Dart.dart` | First Dart program |
| `input_output.dart` | Standard input and output handling |
| `interpolation.dart` | String interpolation techniques |
| `safety_null.dart` | Null safety mechanisms and operators |
| `Animal.dart` & `Animal1.dart` | Class hierarchy and OOP exercises |
| `clock_demo.dart` | Clock and periodic execution simulation |
| `equalequal.dart` | Object equality comparison |
| `logging.dart` | Logging utilities and patterns |
| `MixExample.dart` | Mixin composition and reuse |
| `Overloading.dart` | Operator overloading in Dart |
| `PaymentMethod.dart` | Polymorphism with payment methods |
| `Shape.dart` | Abstract shapes and area calculation |
| `my_first_app/` | Initial Flutter exploration |
| `flutter_lab/` | Flutter introductory widget lab |

## Getting Started

### Prerequisites

Install Flutter and the Dart SDK, and use an editor such as Visual Studio Code or Android Studio.

Verify your environment:

```powershell
flutter doctor
dart --version
```

### Running Dart Programs

For a root-level Dart practice program:

```powershell
dart run Hello_Dart.dart
```

For the Campus Cafe Order System (with assertions enabled):

```powershell
dart run --enable-asserts "Campus Cafe Order System/Campus_Cafe_Order_System.dart"
```

For the OOP Library Lab:

```powershell
dart run --enable-asserts oop_lab/library_lab.dart
```

### Running Flutter Applications & Demos

To run the Navigation Lab:

```powershell
cd navigation_lab
flutter pub get
flutter run
```

To run a layout demo (e.g., `demo15a_column_axes.dart`):

```powershell
flutter run -t demo15a_column_axes.dart
```

## Technology Stack

- **Languages:** Dart
- **Framework:** Flutter
- **Routing:** `go_router`
- **Tools:** Git, GitHub, Visual Studio Code

## Author

**Muhammad Rayyan Bhatti**  
Computer Science  
Quaid-i-Azam University, Islamabad

## Repository

[Mobile Application Development — GitHub](https://github.com/Calipha-Rayyan/Mobile-Application-Development)
