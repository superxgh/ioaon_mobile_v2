import 'package:get/get.dart';
import 'package:ioaon_mobile_v2/controllers/home/home_controller.dart';

class HomeBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
        () => HomeController(apiRepository: Get.find()));
  }
}
