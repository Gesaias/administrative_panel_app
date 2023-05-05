import 'package:administrative_panel_app/app/modules/authentication/controllers/authentication.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/widgets/app_alert/snackbar_widget.dart';
import '../../../data/models/authenticate.model.dart';
import '../../../data/repositories/authentication.repository.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  AuthenticationRepository authRepository;

  LoginController({required this.authRepository});

  final AuthenticationController _authController =
      Get.find<AuthenticationController>();

  final SnackbarAlertWidget _alert = SnackbarAlertWidget();

  final Rx<TextEditingController> _usernameController =
      TextEditingController().obs;
  final Rx<TextEditingController> _passwordController =
      TextEditingController().obs;

  final RxBool _hidePassword = true.obs;
  final Rx<Icon> _iconShowPassword = const Icon(Icons.visibility).obs;
  final RxBool _isLoading = false.obs;

  TextEditingController get usernameController => _usernameController.value;
  TextEditingController get passwordController => _passwordController.value;

  bool get hidePassword => _hidePassword.value;
  Icon get iconShowPassword => _iconShowPassword.value;

  bool get isLoading => _isLoading.value;

  Future<void> login(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      _setLoading();

      Map<String, dynamic> data = {
        "username": _usernameController.value.text.trim(),
        "password": _passwordController.value.text.trim(),
      };

      await authRepository.login(data).then((Authenticate? authenticate) async {
        await _authController.login(authenticate!.token);
        _authController.checkLoginStatus();

        _setLoading();
        _passwordController.value.clear();

        if (_authController.isLogged) {
          Get.offAndToNamed(Routes.HOME);
        } else {
          _alert.alertError(
            title: 'Unable to login!',
            description:
                'Try logging in again, if you still cant try again later.',
          );
        }
      }).catchError((e) {
        print(e);

        _setLoading();
        _passwordController.value.clear();

        _alert.alertError(
          title: 'Invalid User/Password',
          description: 'Try again with a valid username and password!',
        );
      });
    }
  }

  void showPassword() {
    _hidePassword.value = !_hidePassword.value;

    if (_hidePassword.value) {
      _iconShowPassword.value = const Icon(Icons.visibility);
    } else {
      _iconShowPassword.value = const Icon(Icons.visibility_off);
    }
  }

  void _setLoading() => _isLoading.value = !_isLoading.value;
}
