import 'dart:async';
import 'package:ioaon_mobile_v2/api/api.dart';
import 'package:ioaon_mobile_v2/models/models.dart';
import 'package:ioaon_mobile_v2/models/response/users_response.dart';
import 'package:ioaon_mobile_v2/shared/utils/logging.dart';

import 'api.dart';

class ApiRepository {

  final log = logger(ApiRepository);

  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<LoginResponse?> login(LoginRequest data) async {
    log.e('login(LoginRequest data)');
    log.e('data = ${data.toJson()}');
    final res = await apiProvider.login(ApiConstants.login, data);
    log.e('statusCode = ${res.statusCode}');
    log.e('body = ${res.body}');
    if (res.statusCode == 200) {
      return LoginResponse.fromJson(res.body);
    }
  }

  Future<RegisterResponse?> register(RegisterRequest data) async {
    final res = await apiProvider.register('/api/register', data);
    if (res.statusCode == 200) {
      return RegisterResponse.fromJson(res.body);
    }
  }

  Future<UsersResponse?> getUsers() async {
    log.e('getUsers()');
    final res = await apiProvider.getUsers(ApiConstants.login);
    log.e('res = $res');
    if (res.statusCode == 200) {
      return UsersResponse.fromJson(res.body);
    }
  }
}
