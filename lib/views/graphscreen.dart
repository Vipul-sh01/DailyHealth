import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/graphcontroller.dart';
import '../widgets/BottomBar.dart';
import '../widgets/healthcard.dart';
import '../widgets/heartbarchart.dart';
import '../widgets/steplinechart.dart';

class GraphScreen extends StatelessWidget {
  GraphScreen({super.key});

  final GraphController graphController = Get.put(GraphController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("Weekly Health Graph"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          final healthData = graphController.healthData;

          if (healthData.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: const [
              HealthCard(
                title: "Step Count (Last 7 Days)",
                child: SizedBox(height: 200, child: StepLineChart()),
              ),
              SizedBox(height: 24),
              HealthCard(
                title: "Heart Rate (BPM)",
                child: SizedBox(height: 200, child: HeartBarChart()),
              ),
            ],
          );
        }),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
