import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../routes/app_pages.dart';
import '../providers/login_provider.dart';
class LoginController extends GetxController {



  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  LoginProvider loginProvider = LoginProvider();
  final count = 0.obs;
  RxBool passwordVisible = false.obs;






  loginMethod(String email, String password) async {

    loginProvider.loginMethod(username: email, password: password).then((response) async {


      emailController.clear();
      passwordController.clear();
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
