import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/CustomWidget/customButton.dart';
import '../../../data/Utils/app_colors.dart';
import '../../../data/Utils/memory_management/memory_management.dart';
import '../../../data/Utils/memory_management/shared_pref_keys.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  String domain = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() => SingleChildScrollView(
              child: Container(
                color: AppColors.backGroundColor,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Container(
                        height: Get.height * 0.525,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image:
                                AssetImage("assets/images/sheba.png")),
                            borderRadius: BorderRadius.circular(15)),
                      ),

                      const Text(
                          "Sign in",
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),

                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                       Text("UserName",style: TextStyle(color: Colors.grey),),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                          controller: controller.emailController..text = "emilys",
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            if (value.contains('@')) {
                              domain = value.substring(value.indexOf('@') + 1);
                            }
                          },

                          //validator: (input) => input!.isValidEmail() &&
                          validator: (input) => input!.isNotEmpty == true
                              ? null
                              : "Please Input Correct Email",

                          decoration: InputDecoration(
                              hintText: 'username',
                              hintStyle: TextStyle(color: Colors.grey.shade300),
                              isDense: true,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(6, 14, 14, 0),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                  color: AppColors.textColor,
                                ),
                              ),
                              focusColor: AppColors.primary_color,
                              filled: true,
                              fillColor: Colors.white),
                        ),

                      const SizedBox(
                        height: 5,
                      ),
                      Text("Password",style: TextStyle(color: Colors.grey),),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: controller.passwordController
                          ..text = "emilyspass",
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !controller.passwordVisible.value,
                        validator: (value) => value!.isEmpty
                            ? '*Please input your password'
                            : null,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            suffix: confirmPasswordVisibility(),
                            hintStyle:
                            TextStyle(color: Colors.grey.shade300),
                            isDense: true,
                            contentPadding:
                            const EdgeInsets.fromLTRB(6, 14, 14, 0),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                color: AppColors.textColor,
                              ),
                            ),
                            focusColor: AppColors.primary_color,
                            filled: true,
                            fillColor: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    CustomButtonSquare(
                              onPress: () {
                                controller.loginMethod(
                                    controller.emailController.text,
                                    controller.passwordController.text);
                              },
                              btnWidth: double.infinity,
                              textColor: Colors.white,
                              backgroundColor: AppColors.textColor,
                            )

                    ],
                  ),
                ),
              ),
            )
          ),
    )));
  }

  Widget confirmPasswordVisibility() {
    return InkWell(
      onTap: () {
        controller.passwordVisible.value = !controller.passwordVisible.value;
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
            controller.passwordVisible.value
                ? Icons.visibility_off
                : Icons.visibility,
            size: 18),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
