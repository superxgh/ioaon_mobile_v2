import 'package:get/get.dart';
import 'package:ioaon_mobile_v2/controllers/splash/splash_controller.dart';
import 'package:ioaon_mobile_v2/shared/utils/logging.dart';

class SplashBinding extends Bindings {
  final log = logger(SplashBinding);
  @override
  void dependencies() {
    log.i('dependencies()');
    Get.put<SplashController>(SplashController());
  }
}
