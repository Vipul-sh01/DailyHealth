import 'package:get/get.dart';
import '../models/healthdata.dart';

class GraphController extends GetxController {
  // Use RxList with observable annotation `.obs`
  var healthData = <HealthData>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMockData();
  }

  void loadMockData() {
    healthData.value = [
      HealthData(day: "Mon", steps: 3000, heartRate: 72),
      HealthData(day: "Tue", steps: 4500, heartRate: 76),
      HealthData(day: "Wed", steps: 6000, heartRate: 78),
      HealthData(day: "Thu", steps: 5000, heartRate: 74),
      HealthData(day: "Fri", steps: 8000, heartRate: 80),
      HealthData(day: "Sat", steps: 7500, heartRate: 79),
      HealthData(day: "Sun", steps: 6200, heartRate: 77),
    ];
  }
}
