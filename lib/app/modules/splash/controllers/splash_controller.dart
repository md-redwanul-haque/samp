import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/Utils/AppStrings.dart';
import '../../../data/Utils/memory_management/memory_management.dart';
import '../../../data/Utils/memory_management/shared_pref_keys.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  final bool isOnBoardingShowed = SharedPreferencesRepository.getBool(SharedPrefsKeys.is_onboarding_showed);



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




  moveToNext() {
    Future.delayed(const Duration(milliseconds: 2000), () async{

        String? token = await SharedPreferencesRepository.readData(SharedPrefsKeys.JWT_Token);

        isOnBoardingShowed
            ? token != null ?Get.offNamed(Routes.HOME):Get.offNamed(Routes.LOGIN)
            : Get.offNamed(Routes.ON_BOARDING);


    });
  }





  void increment() => count.value++;
}
