import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'shared/services/services.dart';

class DependencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => PreferenceService().init());
    await GetStorage.init();
  }
}
