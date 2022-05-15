import 'package:flutter/material.dart';
import 'package:ioaon_mobile_v2/api/api.dart';
import 'package:ioaon_mobile_v2/models/models.dart';
import 'package:ioaon_mobile_v2/routes/app_pages.dart';
import 'package:ioaon_mobile_v2/shared/shared.dart';
import 'package:get/get.dart';
import 'package:ioaon_mobile_v2/shared/utils/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final log = logger(AuthController);
  final ApiRepository apiRepository;
  AuthController({required this.apiRepository});

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerConfirmPasswordController = TextEditingController();
  bool registerTermsChecked = false;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  @override
  void onInit() {
    log.w('onInit()');
    super.onInit();
  }

  @override
  void onReady() {
    log.w('onReady()');
    log.w('registerFormKey = $registerFormKey');
    log.w('loginFormKey = $loginFormKey');
    super.onReady();
  }

  void register(BuildContext context) async {
    log.w('register(BuildContext context)');
    AppFocus.unfocus(context);
    if (registerFormKey.currentState!.validate()) {
      if (!registerTermsChecked) {
        CommonWidget.toast('Please check the terms first.');
        return;
      }

      final res = await apiRepository.register(
        RegisterRequest(
          email: registerEmailController.text,
          password: registerPasswordController.text,
        ),
      );

      final prefs = Get.find<SharedPreferences>();
      if (res!.token.isNotEmpty) {
        prefs.setString(StorageConstants.token, res.token);
        print('Go to Home screen>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
      }
    }
  }

  void login(BuildContext context) async {
    log.w('login(BuildContext context)');
    AppFocus.unfocus(context);
    if (loginFormKey.currentState!.validate()) {
      final res = await apiRepository.login(
        LoginRequest(
          email: loginEmailController.text,
          password: loginPasswordController.text,
        ),
      );

      final prefs = Get.find<SharedPreferences>();
      if (res!.token.isNotEmpty) {
        prefs.setString(StorageConstants.token, res.token);
        Get.toNamed(Routes.HOME);
      }
    }
  }

  @override
  void onClose() {
    log.w('onClose()');
    super.onClose();

    registerEmailController.dispose();
    registerPasswordController.dispose();
    registerConfirmPasswordController.dispose();

    loginEmailController.dispose();
    loginPasswordController.dispose();
  }
}
