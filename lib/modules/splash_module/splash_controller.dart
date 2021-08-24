import 'dart:async';
import 'package:adidas_ui/modules/home_module/home-page.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    loading();
  }

  loading() {
    Timer(
      Duration(seconds: 3),
      () => Get.off(
        HomePage(),
        transition: Transition.fadeIn,
        duration: Duration(
          milliseconds: 1500,
        ),
      ),
    );
  }
}
