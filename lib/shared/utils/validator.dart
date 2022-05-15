

import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:ioaon_mobile_v2/shared/utils/regex.dart';

String? validateEmail(String? str) {
  if (null == str) return null;
  if (!Regex.isEmail(str)) {
    return 'error_email_format'.tr;
  }
  if (str.isEmpty) {
    return 'error_email_format'.tr;
  }
  return null;
}

String? validatePassword(String? str) {
  if (null == str) return null;
  if (str.isEmpty) {
    return 'please_input_password'.tr;
  }
  if (str.length < 6 || str.length > 15) {
    return 'password_6_15'.tr;
  }
  return null;
}

