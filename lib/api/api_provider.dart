import 'package:ioaon_mobile_v2/api/base_provider.dart';
import 'package:ioaon_mobile_v2/models/models.dart';
import 'package:get/get.dart';
import 'package:ioaon_mobile_v2/shared/utils/logging.dart';

class ApiProvider extends BaseProvider {
  final log = logger(ApiProvider);
  Future<Response> login(String path, LoginRequest data) {
    log.i('login(String path, LoginRequest data)');
    return post(path, data.toJson());
  }

  Future<Response> register(String path, RegisterRequest data) {
    log.i('register(String path, RegisterRequest data)');
    return post(path, data.toJson());
  }

  Future<Response> getUsers(String path) {
    log.i('getUsers(String path)');
    return get(path);
  }
}
