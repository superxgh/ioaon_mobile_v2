import 'package:get/get.dart';
import 'package:ioaon_mobile_v2/utils/logging.dart';

import 'auth_controller.dart';

class AuthBinding implements Bindings {
  final log = logger(AuthBinding);
  @override
  void dependencies() {
    log.i('dependencies()');
    Get.lazyPut<AuthController>(
        () => AuthController(apiRepository: Get.find()));
  }
}
