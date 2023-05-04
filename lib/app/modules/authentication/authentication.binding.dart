import 'package:get/get.dart';

import '../../data/providers/authentication.provider.dart';
import '../../data/providers/cache_manager.provider.dart';
import '../../data/repositories/authentication.repository.dart';
import '../../data/services/rest_client.service.dart';
import 'controllers/authentication.controller.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CacheManagerProvider());
    Get.put(RestClientService(cacheProvider: Get.find<CacheManagerProvider>()));

    Get.put(AuthenticateProvider(restClientService: Get.find()));

    Get.put(AuthenticationRepository(
      cacheProvider: Get.find(),
      authenticateProvider: Get.find(),
    ));

    Get.put<AuthenticationController>(
      AuthenticationController(authRepository: Get.find()),
    );
  }
}
