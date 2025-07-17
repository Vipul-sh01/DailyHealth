import 'package:flutter/material.dart';

class AppConstants {
  static const String routine = "Graph";
  static const String streaks = "Activity ";
  static const String appName = "Daily Health Tracker";

  // Login Screen
  static const String loginTitle = "Welcome Back!";
  static const String loginSubtitle = "Sign in to track your health journey.";
  static const String googleLoginLabel = "Continue with Google";

  // Dashboard
  static const String dashboardTitle = "Your Dashboard";
  static const String todayActivity = "Today's Activity";
  static const String weeklySummary = "Weekly Summary";
  static const String seeAll = "See All";

  // Health Metrics
  static const String stepsTaken = "Steps Taken";
  static const String caloriesBurned = "Calories Burned";
  static const String waterIntake = "Water Intake";
  static const String sleepHours = "Sleep Duration";

  // Errors & States
  static const String loginFailedTitle = "Login Failed";
  static const String loginFailedMessage = "Google sign-in was unsuccessful.";
  static const String noDataMessage = "No data available";
  static const String loading = "Loading...";

  // Buttons
  static const String retry = "Retry";
  static const String logout = "Log Out";
  static const String startTracking = "Start Tracking";

  // Notifications
  static const String reminderWater = "Time to hydrate!";
  static const String reminderSleep = "Maintain a healthy sleep cycle.";

  // Settings
  static const String settingsTitle = "Settings";
  static const String darkMode = "Dark Mode";
  static const String notifications = "Notifications";

  //Streak Screen text
  static const Color primaryColor = Color(0xFF7E57C2);
  static const Color secondaryColor = Color(0xFFD3C7F6);
  static const Color backgroundColor = Colors.white;
  static const Color errorColor = Colors.redAccent;
  static const Color textPrimary = Colors.black87;
  static const Color textSecondary = Colors.black54;

  // Colors
  static const Color whiteColor = Colors.white;
  static const Color iconColor = Color(0xFF1C0D12);
  static const Color textColor = Colors.black87;
  static const Color secondaryTextColor = Color(0xFF964F66);
  static const Color greenColor = Color(0xFF088759);


  static const TextStyle goalTextStyle = TextStyle(fontSize: 18, color: AppConstants.iconColor, fontWeight: FontWeight.w700);
}