import 'package:ioaon_mobile_v2/api/api.dart';
import 'package:get/get.dart';
import 'package:ioaon_mobile_v2/shared/utils/logging.dart';

class AppBinding extends Bindings {
  final log = logger(AppBinding);
  @override
  void dependencies() async {
    log.i('dependencies()');
    Get.put(UserApiProvider(), permanent: true);
    Get.put(ApiRepository(userApiProvider: Get.find()), permanent: true);
  }
}
