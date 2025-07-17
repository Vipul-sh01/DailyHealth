import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class TimerController extends GetxController {
  Rx<Duration> remaining = Duration(minutes: 10).obs;
  Timer? _timer;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    _initializeNotifications();
    startTimer();
  }

  void startTimer() {
    _timer?.cancel();
    remaining.value = Duration(minutes: 10);

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remaining.value.inSeconds <= 0) {
        timer.cancel();
        _showNotification();
        startTimer();
      } else {
        remaining.value -= const Duration(seconds: 1);
      }
    });
  }

  void resetTimer() {
    startTimer();
  }

  Future<void> _initializeNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidSettings);
    await flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  Future<void> _showNotification() async {
    const androidDetails = AndroidNotificationDetails(
      'walk_reminder_channel',
      'Walk Reminder',
      channelDescription: 'Reminder to take a walk or stretch',
      importance: Importance.max,
      priority: Priority.high,
    );

    const platformDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Time to Walk!',
      'Get up and take a 10-minute walk 🏃',
      platformDetails,
    );
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
