import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {

  static final box = GetStorage();

  static dynamic read(String key) {
    return box.read(key);
  }

  static void write(String key, dynamic value) {
    box.write(key, value);
  }

  static dynamic remove(String key) {
    return box.remove(key);
  }


}
