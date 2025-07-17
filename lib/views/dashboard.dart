import 'package:daily_health/costents/AppConstents.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/authcontroller.dart';
import '../controllers/timercontroller.dart';
import '../widgets/BottomBar.dart';
import '../widgets/fadeinanimation.dart';
import '../widgets/pressablebutton.dart';
import 'loginscreen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    final TimerController timer = Get.find<TimerController>();

    if (timer.remaining.value.inSeconds == 0) {
      timer.startTimer();
    }

    return Scaffold(
      appBar: _buildAppBar(authController),
      body: Center(
        child: Obx(() {
          final user = authController.user.value;
          if (user == null) return const CircularProgressIndicator();
          return _buildUserDashboard(user, timer);
        }),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  PreferredSizeWidget _buildAppBar(AuthController controller) {
    return AppBar(
      backgroundColor: AppConstants.primaryColor,
      title: const Text("Dashboard"),
      actions: [
        IconButton(
          icon: Icon(Get.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          onPressed: () {
            Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
          },
          tooltip: 'Toggle Theme',
        ),
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            await controller.signOut();
            Get.offAll(() => LoginScreen());
          },
        ),
      ],
    );
  }

  Widget _buildUserDashboard(user, TimerController timer) {
    final min = timer.remaining.value.inMinutes.remainder(60).toString().padLeft(2, '0');
    final sec = timer.remaining.value.inSeconds.remainder(60).toString().padLeft(2, '0');

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInAnimation(
            delay: const Duration(milliseconds: 50),
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.photoUrl),
              radius: 50,
            ),
          ),
          const SizedBox(height: 20),
          FadeInAnimation(
            delay: const Duration(milliseconds: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  user.email,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          FadeInAnimation(
            delay: const Duration(milliseconds: 200),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Get.isDarkMode ? Colors.grey[900] : Colors.teal.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal),
              ),
              child: Center(
                child: Text(
                  "Next walk in: $min:$sec",
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.teal),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          FadeInAnimation(
            delay: const Duration(milliseconds: 250),
            child: PressableButton(
              label: "Reset Timer",
              onPressed: timer.resetTimer,
            ),
          ),
        ],
      ),
    );
  }
}
