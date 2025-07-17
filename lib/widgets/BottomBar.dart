import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/NavController.dart';
import '../costents/AppConstents.dart';

class BottomNavBar extends StatelessWidget {
  final NavController controller = Get.put(NavController());

  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
      currentIndex: controller.selectedIndex.value,
      onTap: controller.changeIndex,
      selectedItemColor: AppConstants.primaryColor,
      unselectedItemColor: AppConstants.primaryColor.withOpacity(0.6),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.auto_graph), label: AppConstants.routine),
        BottomNavigationBarItem(icon: Icon(Icons.volunteer_activism), label: AppConstants.streaks),
      ],
    ));
  }
}