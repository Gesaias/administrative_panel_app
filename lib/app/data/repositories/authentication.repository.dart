import '../models/authenticate.model.dart';
import '../providers/authentication.provider.dart';
import '../providers/cache_manager.provider.dart';

class AuthenticationRepository {
  CacheManagerProvider cacheProvider;
  AuthenticateProvider authenticateProvider;

  AuthenticationRepository({
    required this.cacheProvider,
    required this.authenticateProvider,
  });

  Future<Authenticate?> login(Map<String, dynamic> data) async =>
      await authenticateProvider.login(data);

  Future<bool> verifyToken() async {
    return await authenticateProvider.verifyToken();
  }

  Future<bool> saveToken(String token) async {
    return await cacheProvider.saveToken(token);
  }

  String getToken() => cacheProvider.getToken() ?? "";

  Future<void> removeToken() async => await cacheProvider.removeToken();
}
