import 'package:get/get.dart';

import '../../core/utils/constants.dart';
import '../api/exceptions/rest_exception.dart';
import '../interfaces/i_authenticate_api.interface.dart';
import '../models/authenticate.model.dart';
import '../services/rest_client.service.dart';

class AuthenticateProvider implements IAuthenticateApi {
  RestClientService restClientService;

  AuthenticateProvider({required this.restClientService});

  @override
  dynamic authDecoder(dynamic map) {
    if (map is Map<String, dynamic>) return Authenticate.fromJson(map);
    if (map is List) {
      return map.map((item) => Authenticate.fromJson(item)).toList();
    }
  }

  @override
  Future<Authenticate?> login(Map<String, dynamic> data) async {
    final response = await restClientService.insert(
      EndPoints.login,
      body: data,
    );

    if (response.hasError) {
      throw RestException(
        status: response.statusCode ?? 500,
        msg: response.statusText ?? "Não capturado!",
      );
    }

    return authDecoder(response.body);
  }

  @override
  Future<bool> verifyToken() async {
    final Response response = await restClientService.find(EndPoints.userToken);

    if (response.hasError) {
      return false;
    }
    return true;
  }
}
