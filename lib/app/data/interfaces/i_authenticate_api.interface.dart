import '../models/authenticate.model.dart';

abstract class IAuthenticateApi {
  Future<Authenticate?> login(Map<String, dynamic> data);
  Future<bool> verifyToken();

  dynamic authDecoder(dynamic map);
}
