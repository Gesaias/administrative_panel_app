import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/themes/app_colors.dart';
import '../controllers/login.controller.dart';
import '../widgets/form_login.widget.dart';
import '../widgets/info_left_login.widget.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: AppColors.kPrimaryColor,
                spreadRadius: 4,
                blurRadius: 15,
                offset: Offset(4, 8),
              ),
            ],
          ),
          width: 900,
          height: 700,
          child: Row(
            children: [
              const InfoLeftLoginWidget(),
              Expanded(
                child: FormLoginWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
