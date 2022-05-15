import 'package:ioaon_mobile_v2/api/api.dart';
import 'package:get/get.dart';
import 'package:ioaon_mobile_v2/utils/logging.dart';

class AppBinding extends Bindings {
  final log = logger(AppBinding);
  @override
  void dependencies() async {
    log.i('dependencies()');
    Get.put(ApiProvider(), permanent: true);
    Get.put(ApiRepository(apiProvider: Get.find()), permanent: true);
  }
}
