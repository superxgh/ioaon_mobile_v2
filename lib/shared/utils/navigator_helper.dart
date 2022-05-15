import 'package:get/get.dart';

import 'logging.dart';

class NavigatorHelper {
  static void popLastScreens({
    required int popCount,
  }) {
    final log = logger(NavigatorHelper);
    log.w('popLastScreens()');
    int count = 0;
    while (count < popCount) {
      log.w('count = $count');
      Get.back();
      count++;
    }
  }
}
