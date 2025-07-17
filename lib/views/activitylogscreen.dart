import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/activitycontroller.dart';
import '../widgets/activitycard.dart';
import '../widgets/BottomBar.dart';
import '../widgets/paginationcontrols.dart';

class ActivityLogScreen extends StatelessWidget {
  final ActivityController controller = Get.put(ActivityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Activity Logs')),
      body: Column(
        children: [
          Expanded(child: _buildActivityList()),
          const SizedBox(height: 10),
          PaginationControls(controller: controller),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildActivityList() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return ListView.builder(
        itemCount: controller.logs.length,
        itemBuilder: (context, index) {
          final log = controller.logs[index];
          return ActivityCard(log: log);
        },
      );
    });
  }
}
