import 'package:ioaon_mobile_v2/api/base_provider.dart';
import 'package:ioaon_mobile_v2/models/models.dart';
import 'package:get/get.dart';
import 'package:ioaon_mobile_v2/shared/utils/logging.dart';

class UserApiProvider extends BaseProvider {
  final log = logger(UserApiProvider);
  Future<Response> login(String path, LoginRequest data) async {
    log.w('>>> login(String path, LoginRequest data) in');
    log.w('path = $path');
    log.w('data.toJson() = ${data.toJson()}');
    Response res = await post(path, data.toJson());
    log.w('res = $res');
    log.w('>>> login(String path, LoginRequest data) out');
    return res;
  }

  Future<Response> register(String path, RegisterRequest data) async {
    log.w('>>> register(String path, RegisterRequest data) in');
    Response res = await post(path, data.toJson());
    log.w('>>> register(String path, RegisterRequest data) out');
    return res;
  }

  Future<Response> getUsers(String path) async {
    log.w('>>> getUsers(String path) in');
    Response res = await get(path);
    log.w('>>> getUsers(String path) in');
    return res;
  }

  Future<Response> getUserByToken(String path) async {
    try {
      log.w('>>> getUserByToken($path) in');
      Response? res = await get(path);
      log.w('res.statusCode = ${res.statusCode}');
      log.w('res.body = ${res.body}');
      return res;
    } catch (e) {
      log.w(e);
      throw e;
    }
  }

  Future<Response> postTestHttp(String path, dynamic data) async {
    try {
      log.w('>>> getTestHttp() )in');
      log.w('path = $path');
      log.w('data = $data');
      Response? res = await post(path, data);
      log.w('res.statusCode = ${res.statusCode}');
      log.w('res.body = ${res.body}');
      return res;
    } catch (e) {
      log.w(e);
      throw e;
    }
  }

}
