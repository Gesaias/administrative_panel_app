import 'package:get/get.dart';

import '../../../data/repositories/authentication.repository.dart';

class AuthenticationController extends GetxController {
  final AuthenticationRepository authRepository;

  AuthenticationController({required this.authRepository});

  final RxBool _isLogged = false.obs;

  bool get isLogged => _isLogged.value;

  void logOut() async {
    _isLogged.value = false;
    await authRepository.removeToken();
  }

  Future<void> login(String token) async {
    _isLogged.value = true;
    await authRepository.saveToken(token);
  }

  String getToken() {
    return authRepository.getToken();
  }

  Future<void> checkLoginStatus() async {
    bool tokenValid = await _verifyToken();

    if (tokenValid) {
      _isLogged.value = true;
    } else {
      _isLogged.value = false;
    }
  }

  // Privates

  Future<bool> _verifyToken() async => await authRepository.verifyToken();
}
