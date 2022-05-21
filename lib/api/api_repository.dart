import 'dart:async';
import 'package:ioaon_mobile_v2/api/provider/user_api_provider.dart';
import 'package:ioaon_mobile_v2/models/models.dart';
import 'package:ioaon_mobile_v2/models/response/user_response.dart';
import 'package:ioaon_mobile_v2/shared/utils/logging.dart';

import 'api_constants.dart';


class ApiRepository {

  final log = logger(ApiRepository);

  ApiRepository({required this.userApiProvider});

  final UserApiProvider userApiProvider;

  Future<LoginResponse?> login(LoginRequest data) async {
    log.d('login(LoginRequest data)');
    log.d('data = ${data.toJson()}');
    final res = await userApiProvider.login(ApiConstants.login, data);
    log.d('statusCode = ${res.statusCode}');
    log.d('body = ${res.body}');
    if (res.statusCode == 200) {
      return LoginResponse.fromJson(res.body);
    }
    return null;
  }

  Future<RegisterResponse?> register(RegisterRequest data) async {
    final res = await userApiProvider.register('/api/register', data);
    if (res.statusCode == 200) {
      return RegisterResponse.fromJson(res.body);
    }
    return null;
  }

  Future<UserResponse?> getUsers() async {
    log.d('getUsers()');
    final res = await userApiProvider.getUsers(ApiConstants.login);
    log.d('res = $res');
    if (res.statusCode == 200) {
      return UserResponse.fromJson(res.body);
    }
    return null;
  }

  Future<UserResponse?> getUserByToken() async {
    try {
      log.d('>>> getUserByToken() in');
      final res = await userApiProvider.getUserByToken(ApiConstants.getUser);
      log.d('res.statusCode = ${res.statusCode}');
      log.d('res.body = ${res.body}');
      if (res.statusCode == 200) {
        UserResponse? user = UserResponse.fromJson(res.body);
        log.d('>>> getUserByToken() out');
        return user;
      }
      log.d('>>> getUserByToken() out');
      return null;
    } catch (e) {
      log.d(e);
      throw e;
    }
  }

  Future<UserResponse?> getTestHttp(dynamic data) async {
    try {
      log.d('>>> getTestHttp() in');
      log.d('data = $data');
      final res = await userApiProvider.postTestHttp(ApiConstants.getTestHttp, data);
      log.d('res.statusCode = ${res.statusCode}');
      log.d('res.body = ${res.body}');
      if (res.statusCode == 200) {
        UserResponse? user = UserResponse.fromJson(res.body);
        log.d('>>> getTestHttp() out');
        return user;
      }
      log.d('>>> getTestHttp() out');
      return null;
    } catch (e) {
      log.d(e);
      throw e;
    }
  }
}
