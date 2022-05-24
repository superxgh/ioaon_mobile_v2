import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ioaon_mobile_v2/api/api_repository.dart';
import 'package:ioaon_mobile_v2/api/provider/user_api_provider.dart';
import 'package:ioaon_mobile_v2/controllers/home/home_controller.dart';
import 'package:ioaon_mobile_v2/shared/constants/storage.dart';
import 'package:ioaon_mobile_v2/shared/services/preference_service.dart';
import 'package:ioaon_mobile_v2/shared/services/storage_service.dart';



Future<void> main() async {

  // WidgetsFlutterBinding.ensureInitialized();

 setUp(() async {

    // DependencyInjection.init();
    Get.testMode = true;
    await Get.putAsync(() => PreferenceService().init());
    await GetStorage.init();
    Get.put(UserApiProvider(), permanent: true);
    Get.put(ApiRepository(userApiProvider: Get.find()), permanent: true);
    PreferenceService.writeString(StorageConstants.authToken, '196fd9b5-2df2-4406-80c8-7ed9f17350d9');
    StorageService.write(StorageConstants.authToken, '196fd9b5-2df2-4406-80c8-7ed9f17350d9');
    EasyLoading.init();
 });

  test('Test first controller', () async {
    
      final homeController = HomeController(apiRepository: Get.find());
        // expect(homeController.name.value, 'name1');

        // Get.put(homeController); // onInit was called
        // expect(homeController.name.value, 'name2');
        //
        // homeController.changeName();
        // expect(homeController.name.value, 'name3');
        //
        // // controller.onReady();
        // await homeController.loadUserByToken();
        await homeController.postTestHttp();
            // /// onClose was called
        // Get.delete<HomeController>();
        // expect(controller.name.value, '');
      });

}
