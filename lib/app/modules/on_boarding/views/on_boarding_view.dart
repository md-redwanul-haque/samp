import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/Utils/memory_management/memory_management.dart';
import '../../../data/Utils/memory_management/shared_pref_keys.dart';
import '../../../routes/app_pages.dart';
import '../controllers/on_boarding_controller.dart';
import 'mainPage_widget.dart';
import 'onboarding_contents.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        itemBuilder: (index) {
          final page = contents[index % contents.length];
          return SafeArea(child: MainPageWidget(page: page));
        },
        nextButtonBuilder: (context) => const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        colors: const [
          Color.fromARGB(255, 172, 254, 208),
          Colors.amber,
          Colors.teal
        ],
        onFinish: (){
          //Get.offNamed(Routes.ACCESS_TICKET);

          SharedPreferencesRepository.setBool(SharedPrefsKeys.is_onboarding_showed, true);

          Get.offNamed(Routes.LOGIN);
        },
      ),
    );
  }
}
