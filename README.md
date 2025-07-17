# 🏃‍♂️ Daily Health Tracker

## 📝 Description

**Daily Health Tracker** is a feature-rich Flutter application designed to monitor and visualize user activity and health trends. It includes Google Sign-In authentication, graphs for activity tracking, API integration, countdown reminders, and persistent user data — all built with scalable architecture (MVC + GetX) and a sleek UI.

---

## ❓ Problem Statement

This app solves several health-tracking and UI/UX challenges:

- 👤 Google Sign-In for secure access
- 📈 Display 7-day health data using graphs
- 📜 Lazy loading of large activity logs with infinite scroll
- ⏱️ Countdown timer reminders for walking or hydration
- 🎯 Clean and responsive UI with animations

It targets users who want to stay accountable and aware of their daily activity with real-time feedback and reminders.

---

## 🧰 Tech Stack

- **Flutter** – Cross-platform mobile UI toolkit
- **GetX** – State management, navigation, dependency injection
- **MVC Architecture** – Modular structure with clear separation of concerns
- **google_sign_in** – Google authentication
- **SharedPreferences** – Persistent local storage
- **HTTP** – REST API calls
- **fl_chart** – Health data visualization
- **Local Notifications** – Reminder alerts
- **Custom Widgets & Animations** – Modern UI/UX with smooth transitions

---

## 📸 Screenshots

<div align="center">
  <img src="https://github.com/Vipul-sh01/DailyHealth/blob/main/k9.jpg" width="30%">
  <img src="https://github.com/Vipul-sh01/DailyHealth/blob/main/k8.jpg" width="30%">
  <img src="https://github.com/Vipul-sh01/DailyHealth/blob/main/k7.jpg" width="30%">
  <img src="https://github.com/Vipul-sh01/DailyHealth/blob/main/k2.jpg" width="30%">
  <img src="https://github.com/Vipul-sh01/DailyHealth/blob/main/k3.jpg" width="30%">
  <img src="https://github.com/Vipul-sh01/DailyHealth/blob/main/k5.jpg" width="30%">
  <img src="https://github.com/Vipul-sh01/DailyHealth/blob/main/k6.jpg" width="30%">
  <img src="https://github.com/Vipul-sh01/DailyHealth/blob/main/k1.jpg" width="30%">
</div>

---

## 🎯 Features

| Feature | Description |
|--------|-------------|
| 👤 **Google Login** | Secure sign-in using `google_sign_in`. After login, users are redirected to a dashboard showing their profile info. |
| 🧱 **MVC + GetX Architecture** | Organized folder structure with GetX handling routing and state management. |
| 🌐 **REST API Integration** | Fetches activity logs or health data from a mock or live REST API. |
| 📊 **7-Day Graph View** | Visualizes user health or step data for the past 7 days using `fl_chart`. |
| 🔃 **Lazy Loading** | Infinite scroll for activity logs using `ListView.builder` and GetX observable pagination. |
| ⏲️ **Countdown Timer** | Countdown timer widget for next walk reminder with reset and auto-refresh options. |
| 🎞️ **Animations** | Smooth fade and scale animations on cards, charts, and transitions. |
| 🌗 **Dark Mode** | Toggle between light and dark themes with GetX theme controller. |
| 🔔 **Local Notifications** | Schedule reminders using `flutter_local_notifications`. |
| 💾 **Persistence** | Last selected activity or user data stored with SharedPreferences. |
| ✅ **Clean Code** | Modularized files for models, views, controllers, routes, services, and widgets. |
| 📄 **README + Submission** | Detailed documentation with setup guide, screenshots, and features list. |

---

## 🛠 Setup Instructions

This project uses **FVM (Flutter Version Management)** to manage the Flutter SDK version for consistency across development environments.

### ✅ Requirements

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [FVM CLI](https://fvm.app/docs/getting_started/installation) (`dart pub global activate fvm`)
- Dart 3.8.1
- DevTools 2.45.1

---

### 📦 Flutter & Dart Versions (via FVM)

- **Flutter version**: `3.32.5`
- **Channel**: `stable`
- **Dart version**: `3.8.1`
- **DevTools version**: `2.45.1`

---

### 🚀 How to Run the Project with FVM

1. **Clone the repository or unzip the project folder**
   ```bash
   git clone https://github.com/Vipul-sh01/DailyHealth
   cd daily_health
   dart pub global activate fvm
   fvm install 3.32.5
   fvm use 3.32.5
   fvm flutter pub get
   fvm flutter run 
   
