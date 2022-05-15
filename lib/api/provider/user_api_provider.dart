import 'package:ioaon_mobile_v2/api/base_provider.dart';
import 'package:ioaon_mobile_v2/models/models.dart';
import 'package:get/get.dart';
import 'package:ioaon_mobile_v2/shared/utils/logging.dart';

class UserApiProvider extends BaseProvider {
  final log = logger(UserApiProvider);
  Future<Response> login(String path, LoginRequest data) async {
    log.i('login(String path, LoginRequest data)');
    log.i('path = $path');
    log.i('data.toJson() = ${data.toJson()}');
    Response res = await post(path, data.toJson());
    log.i('res = $res');
    return res;
  }

  Future<Response> register(String path, RegisterRequest data) {
    log.i('register(String path, RegisterRequest data)');
    return post(path, data.toJson());
  }

  Future<Response> getUsers(String path) {
    log.i('getUsers(String path)');
    return get(path);
  }

  Future<Response> getUserByToken(String path) {
    log.i('getUserByToken(String path)');
    return get(path);
  }

}
