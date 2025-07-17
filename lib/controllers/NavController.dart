import 'package:get/get.dart';

import '../views/activitylogscreen.dart';
import '../views/graphscreen.dart';


class NavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;

    // Navigate based on index
    switch (index) {
      case 0:
        Get.to(GraphScreen());
        break;
      case 1:
        Get.to(ActivityLogScreen());
        break;
    }
  }
}