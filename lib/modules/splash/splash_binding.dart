import 'package:get/get.dart';
import 'package:ioaon_mobile_v2/utils/logging.dart';
import 'splash_controller.dart';

class SplashBinding extends Bindings {
  final log = logger(SplashBinding);
  @override
  void dependencies() {
    log.i('dependencies()');
    Get.put<SplashController>(SplashController());
  }
}
