# Mobile Application Development (MAD)

A centralized repository for coursework, lab assignments, Flutter projects, Dart practice programs, state management labs, Firebase integrations, and layout demonstrations developed as part of the **Mobile Application Development** course at Quaid-i-Azam University, Islamabad.

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
├── Riverpod/
│   ├── lib/
│   │   ├── cart_badge.dart
│   │   ├── cart_provider.dart
│   │   ├── counter_page.dart
│   │   ├── data.dart
│   │   ├── detail_screen.dart
│   │   ├── home_screen.dart
│   │   ├── json_demo.dart
│   │   └── main.dart
│   ├── LAB_ANSWERS.md
│   └── README.md
│
├── Flutter/
│   └── counter_demo/
│       ├── lib/
│       │   ├── firebase_demo_main.dart
│       │   ├── firebase_options.dart
│       │   ├── task.dart
│       │   ├── task.freezed.dart
│       │   └── task.g.dart
│       ├── android/
│       ├── ios/
│       ├── linux/
│       ├── macos/
│       ├── web/
│       ├── windows/
│       ├── firebase.json
│       ├── pubspec.yaml
│       └── README.md
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

### 7. Riverpod State Management & REST Lab (`Riverpod/`)

A comprehensive lab focusing on shared application state management using Riverpod (`flutter_riverpod`) and REST API consumption in Flutter.

**Key Architecture & Concepts:**
- **`ProviderScope`:** Enclosing root widget (`lib/main.dart`) that stores all provider states.
- **`StateNotifier` & `StateNotifierProvider`:** Encapsulates state mutation logic in `lib/cart_provider.dart`.
- **Immutable State Updates:** Demonstrates safe collection updating (`state = [...state, dish]`) to trigger dependent widget rebuilds without in-place mutation bugs.
- **Reactive UI (`ref.watch`):** `lib/cart_badge.dart` automatically updates the cart count on both catalog (`HomeScreen`) and product pages (`DetailScreen`).
- **Targeted Reading (`ref.read`):** Used inside action handlers (e.g. `counter_page.dart`) without unneeded rebuilds.
- **REST & JSON Handling:** `lib/json_demo.dart` demonstrates fetching and parsing JSON into structured Dart objects.
- **Lab Q&A (`LAB_ANSWERS.md`):** Complete conceptual explanations of `setState` limitations, lifting state up, Riverpod notifiers, and REST endpoints.

---

### 8. Firebase, Firestore & Freezed Task Manager (`Flutter/counter_demo/`)

A production-style Flutter application demonstrating cloud authentication, real-time NoSQL database persistence, code generation, and reactive state management.

**Key Components & Architecture:**
- **Firebase Authentication (`lib/firebase_demo_main.dart`):**
  - Reactive auth state monitoring via `StreamProvider<User?>` (`authStateProvider`).
  - `AuthGate` dynamically switches between authentication and main application screens.
  - User registration and login with comprehensive `FirebaseAuthException` error handling.
- **Cloud Firestore Real-Time CRUD:**
  - Real-time task synchronization via Firestore collection snapshots (`snapshots().map(...)`).
  - Interactive task creation, status toggling, and deletion.
- **Immutable Models with Freezed (`lib/task.dart`):**
  - Generates immutable `Task` data models using `freezed` and `json_serializable`.
  - Type-safe JSON serialization (`task.g.dart`) and copy-with utilities (`task.freezed.dart`).
- **FlutterFire Multiplatform Configuration:**
  - Platform-specific initialization in `lib/firebase_options.dart` and `android/app/google-services.json`.

---

### 9. Flutter Layout Demonstrations

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

### 10. Dart Practice Programs

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

#### Navigation Lab:

```powershell
cd navigation_lab
flutter pub get
flutter run
```

#### Riverpod & REST Lab:

```powershell
# Copy Riverpod/lib into your Flutter project or run standalone examples:
dart run Riverpod/lib/json_demo.dart
```

#### Firebase Task Manager (`Flutter/counter_demo`):

```powershell
cd Flutter/counter_demo
flutter pub get

# Generate Freezed and JSON models if modified:
dart run build_runner build --delete-conflicting-outputs

# Run the Firebase demo application:
flutter run -t lib/firebase_demo_main.dart
```

#### Standalone Layout Demos:

```powershell
flutter run -t demo15a_column_axes.dart
```

## Technology Stack

- **Languages:** Dart (3.x)
- **Framework:** Flutter
- **Routing:** `go_router`
- **State Management:** Riverpod (`flutter_riverpod`)
- **Backend & Cloud:** Firebase Auth (`firebase_auth`), Cloud Firestore (`cloud_firestore`), Firebase Core (`firebase_core`)
- **Code Generation & Serialization:** Freezed (`freezed`, `freezed_annotation`), JSON Serializable (`json_serializable`, `json_annotation`), Build Runner (`build_runner`)
- **Tools:** Git, GitHub, Visual Studio Code

## Author

**Muhammad Rayyan Bhatti**  
Computer Science  
Quaid-i-Azam University, Islamabad

## Repository

[Mobile Application Development — GitHub](https://github.com/Calipha-Rayyan/Mobile-Application-Development)
