import 'package:flutter/material.dart';
import 'package:ioaon_mobile_v2/controllers/auth/auth_controller.dart';
import 'package:ioaon_mobile_v2/routes/routes.dart';
import 'package:ioaon_mobile_v2/shared/shared.dart';
import 'package:get/get.dart';
import 'package:ioaon_mobile_v2/shared/utils/logging.dart';

class AuthScreen extends GetView<AuthController> {
  final log = logger(AuthScreen);
  @override
  Widget build(BuildContext context) {
    // log.i('build(BuildContext context)');
    // var locale = Locale('th', 'TH');
    // Get.updateLocale(locale);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: _buildItems(context),
        ),
      ),
    );
  }

  Widget _buildItems(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      children: [
        Icon(
          Icons.home,
          size: SizeConfig().screenWidth * 0.26,
          color: Colors.blueGrey,
        ),
        SizedBox(height: 20.0),
        Text(
          'welcome'.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: CommonConstants.largeText,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.headline6!.color,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'let_start_now'.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: CommonConstants.normalText,
            color: Theme.of(context).textTheme.subtitle1!.color,
          ),
        ),
        SizedBox(height: 50.0),
        GradientButton(
          text: 'sign_in'.tr,
          onPressed: () {
            Get.toNamed(Routes.AUTH + Routes.LOGIN, arguments: controller);
          },
        ),
        SizedBox(height: 20.0),
        BorderButton(
          text: 'sign_up'.tr,
          onPressed: () {
            Get.toNamed(Routes.AUTH + Routes.REGISTER, arguments: controller);
          },
        ),
        SizedBox(height: 62.0),
        Text(
          'app_for_test'.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: CommonConstants.smallText,
            color: ColorConstants.tipColor,
          ),
        ),
      ],
    );
  }
}
