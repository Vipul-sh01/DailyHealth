import 'package:get/get.dart';
import '../ services/apiservice.dart';
import '../models/activitymodel.dart';


class ActivityController extends GetxController {
  final logs = <ActivityLog>[].obs;
  var page = 1.obs;
  final limit = 10;
  final isLoading = false.obs;

  final _service = ActivityService();

  @override
  void onInit() {
    fetchLogs();
    super.onInit();
  }

  void fetchLogs() async {
    isLoading.value = true;
    try {
      final newLogs = await _service.fetchLogs(page: page.value, limit: limit);
      logs.value = newLogs;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void nextPage() {
    page.value++;
    fetchLogs();
  }

  void previousPage() {
    if (page.value > 1) {
      page.value--;
      fetchLogs();
    }
  }
}
