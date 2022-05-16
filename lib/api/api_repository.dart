import 'dart:async';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
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
    log.e('login(LoginRequest data)');
    log.e('data = ${data.toJson()}');
    final res = await userApiProvider.login(ApiConstants.login, data);
    log.e('statusCode = ${res.statusCode}');
    log.e('body = ${res.body}');
    if (res.statusCode == 200) {
      return LoginResponse.fromJson(res.body);
    }
  }

  Future<RegisterResponse?> register(RegisterRequest data) async {
    final res = await userApiProvider.register('/api/register', data);
    if (res.statusCode == 200) {
      return RegisterResponse.fromJson(res.body);
    }
  }

  Future<UserResponse?> getUsers() async {
    log.e('getUsers()');
    final res = await userApiProvider.getUsers(ApiConstants.login);
    log.e('res = $res');
    if (res.statusCode == 200) {
      return UserResponse.fromJson(res.body);
    }
  }

  Future<UserResponse?> getUserByToken() async {
    log.e('getUserByToken()');
    final res = await userApiProvider.getUserByToken(ApiConstants.getUser);
    log.e('res.statusCode = ${res.statusCode}');
    log.e('res.body = ${res.body}');
    if (res.statusCode == 200) {
      return UserResponse.fromJson(res.body);
    }
  }
}
