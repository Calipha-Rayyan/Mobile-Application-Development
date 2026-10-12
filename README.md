# Mobile Application Development (MAD)

A centralized repository for coursework, lab assignments, Dart practice programs, and projects developed as part of the **Mobile Application Development** course at Quaid-i-Azam University, Islamabad.

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
│
├── Animal.dart
├── Animal1.dart
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
└── README.md
```

*Note: The structure above summarizes the known projects and files. Update it when the repository changes.*

## Projects and Lab Assignments

### 1. Campus Cafe Order System

A Dart-based project that demonstrates object-oriented programming and a simple cafe ordering workflow.

**Concepts covered:**
- Classes and objects
- Constructors and named constructors
- Factory constructors
- Initializer lists
- Assertions
- Getters and setters
- Collections
- Receipt generation
- Discount coupons

**Main file:** `Campus_Cafe_Order_System.dart`

### 2. Course Roster Manager

A course project focused on organizing and managing course roster information using Dart.

**Main file:** `course_roster.dart`

### 3. Library Desk Assistant

A Dart-based lab project that models a library desk assistant workflow and applies programming fundamentals to a practical scenario.

**Main file:** `Library_Desk_Assistant.dart`

Supporting images and project documentation are maintained alongside the project files.

### 4. Campus Library System — OOP Lab

This lab focuses on object-oriented programming concepts through a small library management system.

**Main file:** `oop_lab/library_lab.dart`

**Topics covered:**
- Inheritance and method overriding
- Abstract classes and interfaces
- Mixins and enhanced enums
- Extension methods
- Operator overloading
- Equality and hash codes
- Static members and constant objects
- Late-fee calculation and member discounts

**Supporting files:**
- `ANSWERS.md` — reflection answers
- `output.txt` — program output

### 5. Dart Practice Programs

The repository also contains individual Dart programs for practicing core language concepts.

| File | Purpose |
|---|---|
| `Hello_Dart.dart` | Basic Dart program |
| `input_output.dart` | Input and output |
| `interpolation.dart` | String interpolation |
| `safety_null.dart` | Null safety |
| `Animal.dart` and `Animal1.dart` | Animal-related class exercises |
| `equalequal.dart` | Equality operator practice |
| `logging.dart` | Logging practice |
| `MixExample.dart` | Mixin examples |
| `Overloading.dart` | Operator overloading |
| `PaymentMethod.dart` | Payment method and class concepts |
| `Shape.dart` | Shape-related class exercises |
| `my_first_app/` | Application practice |

## Getting Started

### Prerequisites

Install the Dart SDK and Git, and use an editor such as Visual Studio Code.

Check that Dart is available in your terminal:

```powershell
dart --version
```

### Run a Dart Program

For a root-level Dart file:

```powershell
dart run Hello_Dart.dart
```

For the Campus Cafe Order System:

```powershell
dart run --enable-asserts "Campus Cafe Order System/Campus_Cafe_Order_System.dart"
```

For the Campus Library System lab:

```powershell
dart run --enable-asserts oop_lab/library_lab.dart
```

### Format and Analyze Code

Format the repository's Dart files:

```powershell
dart format .
```

Analyze the Dart code:

```powershell
dart analyze .
```

Review and resolve relevant errors or warnings before submitting coursework.

## Git and GitHub Workflow

Keep changes organized and use meaningful commit messages that describe the work completed.

Check the current changes:

```powershell
git status
```

Stage a specific file:

```powershell
git add README.md
```

Create a meaningful commit:

```powershell
git commit -m "docs: improve repository documentation"
```

Push committed changes to GitHub:

```powershell
git push origin main
```

For labs with required checkpoints, follow the instructor's specified commit order and message format.

## Repository Organization

The repository uses a simple structure:

- **Project folders** contain related source code, documentation, and supporting files.
- **Root-level Dart files** contain smaller practice exercises.
- **Lab folders** keep assignment code, reflection answers, and output files together.
- **Git history** records changes and helps track development progress.

## Technology Stack

- Dart
- Dart SDK
- Git
- GitHub
- Visual Studio Code

## Purpose

The goal of this repository is to maintain an organized record of Mobile Application Development coursework, including lab submissions, individual programming exercises, and small projects.

It serves as a reference for revision, practical learning, debugging, project development, and version-controlled coursework submission.

## Author

**Muhammad Rayyan Bhatti**

Computer Science  
Quaid-i-Azam University, Islamabad

## Repository

[Mobile Application Development — GitHub](https://github.com/Calipha-Rayyan/Mobile-Application-Development)
