import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService extends GetxService {

  Future<SharedPreferences> init() async {
    return await SharedPreferences.getInstance();
  }

  // String
  static void writeString(String key, String value) {
    var prefs = Get.find<SharedPreferences>();
    prefs.setString(key, value);
  }
  static String? readString(String key) {
    var prefs = Get.find<SharedPreferences>();
    prefs.getString(key);
    return null;
  }

  static void clear() {
    var prefs = Get.find<SharedPreferences>();
    prefs.clear();
  }

}
