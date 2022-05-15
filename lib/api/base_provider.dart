
import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:ioaon_mobile_v2/models/response/error_response.dart';
import 'package:ioaon_mobile_v2/shared/utils/common_widget.dart';
import 'package:ioaon_mobile_v2/shared/utils/logging.dart';

import 'api.dart';

class BaseProvider extends GetConnect {

  final log = logger(BaseProvider);

  @override
  void onInit() {
    httpClient.baseUrl = ApiConstants.baseUrl;
    httpClient.addAuthenticator(authInterceptor);
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }

  FutureOr<Request> requestInterceptor(request) async {
    log.i('requestInterceptor(request)');
    // final authToken = StorageService.box.pull(StorageItems.accessToken);

    // request.headers['X-Requested-With'] = 'XMLHttpRequest';
    // request.headers['Authorization'] = 'Bearer $authToken';
    log.i('request = ${request.headers}');

    EasyLoading.show(status: 'loading...');
    return request;
  }

  FutureOr<Request> authInterceptor(request) async {
    // final token = StorageService.box.pull(StorageItems.accessToken);

    // request.headers['X-Requested-With'] = 'XMLHttpRequest';
    // request.headers['Authorization'] = 'Bearer $authToken';

    return request;
  }

  FutureOr<dynamic> responseInterceptor(
      Request request, Response response) async {
    EasyLoading.dismiss();

    if (response.statusCode != 200) {
      handleErrorStatus(response);
      return;
    }

    return response;
  }

  void handleErrorStatus(Response response) {
    switch (response.statusCode) {
      case 400:
        final message = ErrorResponse.fromJson(response.body);
        CommonWidget.toast(message.error);
        break;
      default:
    }

    return;
  }

}
