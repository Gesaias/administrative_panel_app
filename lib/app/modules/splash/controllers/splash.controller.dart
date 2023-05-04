import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../authentication/controllers/authentication.controller.dart';

class SplashController extends GetxController {
  SplashController();

  final AuthenticationController _authController =
      Get.find<AuthenticationController>();

  final RxBool _isLogged = false.obs;

  bool get isLogged => _isLogged.value;

  @override
  void onInit() async {
    super.onInit();

    await initializeSettings();
  }

  Future<void> initializeSettings() async {
    await _authController.checkLoginStatus();
    _isLogged.value = _authController.isLogged;

    if (_isLogged.value) {
      Get.toNamed(Routes.HOME);
    } else {
      Get.toNamed(Routes.LOGIN);
    }
  }
}
