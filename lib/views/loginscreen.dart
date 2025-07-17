import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/authcontroller.dart';
import '../costents/AppConstents.dart';
import '../utils/showsnackbar.dart';
import '../widgets/scaletapanimation.dart';
import 'dashboard.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthController authController = Get.put(AuthController());

  void _handleSignIn() async {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    final success = await authController.signIn();
    Get.back();

    if (success) {
      Get.off(() => DashboardScreen());
    } else {
      DialogUtils.showSnackbar(
        AppConstants.loginFailedTitle,
        AppConstants.loginFailedMessage,
        isError: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppConstants.secondaryColor, AppConstants.primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 10,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: AppConstants.backgroundColor.withOpacity(0.95),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.health_and_safety,
                      size: 60, color: AppConstants.primaryColor),
                  const SizedBox(height: 20),
                  const Text(
                    AppConstants.appName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppConstants.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    AppConstants.loginSubtitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppConstants.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  AnimatedIconButton(
                    icon: const Icon(Icons.login, color: Colors.white),
                    label: AppConstants.googleLoginLabel,
                    onPressed: _handleSignIn,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
