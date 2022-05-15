import 'package:ioaon_mobile_v2/routes/routes.dart';
import 'package:ioaon_mobile_v2/shared/shared.dart';
import 'package:get/get.dart';
import 'package:ioaon_mobile_v2/shared/utils/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final log = logger(SplashController);
  @override
  void onReady() async {
    super.onReady();
    log.w('onReady()');

    await Future.delayed(Duration(milliseconds: 2000));
    var storage = Get.find<SharedPreferences>();
    try {
      if (storage.getString(StorageConstants.token) != null) {
        log.w('storage.getString(StorageConstants.token) = ${storage.getString(StorageConstants.token)}');
        log.w('goto Routes.HONE');
        Get.toNamed(Routes.HOME);
      } else {
        log.w('storage.getString(StorageConstants.token) = null');
        log.w('goto Routes.AUTH');
        Get.toNamed(Routes.AUTH);
      }
    } catch (e) {
      log.w('e =${e.toString()}');
      log.w('goto Routes.AUTH');
      Get.toNamed(Routes.AUTH);
    }
  }
}
