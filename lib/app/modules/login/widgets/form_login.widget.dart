import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/themes/app_colors.dart';
import '../../../core/utils/loading_widget.dart';
import '../controllers/login.controller.dart';

class FormLoginWidget extends GetWidget<LoginController> {
  FormLoginWidget({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: AppColors.white,
      ),
      child: Center(
        child: SizedBox(
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText(
                'Login',
                style: GoogleFonts.sourceSansPro(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Divider(color: AppColors.white),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.usernameController,
                      decoration: InputDecoration(
                        labelText: 'User',
                        suffixIcon: Icon(
                          Icons.person,
                          color: Colors.grey[600],
                        ),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Mandatory';
                        }
                        return null;
                      },
                    ),
                    const Divider(color: AppColors.white),
                    Obx(
                      () => TextFormField(
                        controller: controller.passwordController,
                        obscureText: controller.hidePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: controller.iconShowPassword,
                            color: Colors.grey[600],
                            onPressed: () => controller.showPassword(),
                          ),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Mandatory';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: AppColors.white),
              SizedBox(
                height: 40,
                width: 180,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kPrimaryColor,
                  ),
                  onPressed: () async => await controller.login(formKey),
                  child: Obx(
                    () => controller.isLoading
                        ? LoadingWidget(
                            height: 25,
                            width: 25,
                          )
                        : Text(
                            'Login',
                            style: GoogleFonts.sourceSansPro(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
              const Divider(color: AppColors.white),
            ],
          ),
        ),
      ),
    );
  }
}
