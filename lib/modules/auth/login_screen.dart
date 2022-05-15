import 'package:flutter/material.dart';
import 'package:ioaon_mobile_v2/shared/shared.dart';
import 'package:get/get.dart';
import 'package:ioaon_mobile_v2/shared/utils/logging.dart';

import 'auth_controller.dart';

class LoginScreen extends StatelessWidget {
  final log = logger(LoginScreen);
  final AuthController controller = Get.arguments;
  @override
  Widget build(BuildContext context) {
    log.i('build(BuildContext context)');
    return Stack(
      children: [
        GradientBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CommonWidget.appBar(
            context,
            'sign_in'.tr,
            Icons.arrow_back,
            Colors.white,
          ),
          body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 35.0),
            child: _buildForms(context),
          ),
        ),
      ],
    );
  }

  Widget _buildForms(BuildContext context) {
    return Form(
      key: controller.loginFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputField(
              controller: controller.loginEmailController,
              keyboardType: TextInputType.text,
              labelText: 'email'.tr,
              placeholder: 'enter_email'.tr,
              validator: (value) {
                if (!Regex.isEmail(value!)) {
                  return 'error_email_format'.tr;
                }
                if (value.isEmpty) {
                  return 'error_email_format'.tr;
                }
                return null;
              },
            ),
            CommonWidget.rowHeight(),
            InputField(
              controller: controller.loginPasswordController,
              keyboardType: TextInputType.emailAddress,
              labelText: 'password'.tr,
              placeholder: 'enter_password'.tr,
              password: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please_input_password'.tr;
                }

                if (value.length < 6 || value.length > 15) {
                  return 'password_6_15'.tr;
                }

                return null;
              },
            ),
            CommonWidget.rowHeight(height: 80),
            BorderButton(
              text: 'sign_in'.tr,
              backgroundColor: Colors.white,
              onPressed: () {
                controller.login(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
