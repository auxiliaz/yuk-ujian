# YukUjian!

YukUjian! is a frontend-only exam application built using **Flutter (Dart)**.  
This application is designed to simulate a school exam system for **junior high school (SMP)** students, supporting two roles: **Student (Siswa)** and **Teacher (Guru)**.

All data in this app is handled on the client side using dummy data and local storage for simulation purposes.

---

## Tech Stack

- Flutter
- Dart
- State Management: setState
- Navigation: Navigator (MaterialPageRoute / named routes)
- Local Storage (for saving created exams)

---

## Application Flow

### Splash & Onboarding
1. Splash Screen is displayed when the app is opened
2. Onboarding page introduces the app
3. User taps **Get Started** to continue

---

## Authentication Flow

### Register
1. User fills in:
   - Name
   - Date of birth
   - Phone number
   - Gender
2. Continue registration by filling:
   - Email
   - Password
3. User selects account type:
   - Student (Siswa)
   - Teacher (Guru)

### Login
- User logs in using email and password
- App redirects user based on selected role

---

## Student (Siswa) Flow

### Home Page
- Student selects their class (e.g. 9A, 9B)
- Main entry point for accessing exams

### Exam List Page
- Displays list of available exams based on selected class

### Start Exam
- Student enters:
  - Name
  - Class
- Student starts the exam

### Score Page
- Displays final exam score after submission

### Class Page
- Displays list of subjects (mapel) the student is enrolled in
- Shows student name
- Displays scores after exams are completed

### Profile
- Edit profile information

### Logout
- Ends user session and returns to authentication flow

---

## Teacher (Guru) Flow

### Home Page
- Main focus on:
  - Exams
  - Question Library
  - Teacher’s Classes

### Create Exam Page
Teacher can:
- Create exam title
- Add questions
- Choose question type:
  - Multiple choice
  - Essay
- View list of added questions
- Delete questions
- Save exam

### Question Library
- Displays all saved exams and questions
- View exam details
- Edit existing questions

### Class Page
Teacher can:
- View list of students
- Input student scores
- Add new classes

### Profile
- Edit profile information

### Logout
- Ends user session and returns to authentication flow

---

## Data Management

- User data and exam data are handled on the frontend
- Created exams are stored using local storage
- Exam data created by teachers is not yet synced to student exams
- No backend or server-side database is used

---

## Limitations

- Frontend only (no backend integration)
- Authentication is not secure for production use
- Student exams do not dynamically reflect newly created teacher exams
- Data is device-specific and stored locally

---
