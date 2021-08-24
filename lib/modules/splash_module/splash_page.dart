import 'package:adidas_ui/modules/splash_module/splash_controller.dart';
import 'package:adidas_ui/shared/constant/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/splash_body.dart';

class SplashPage extends GetResponsiveView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.KPrimary,
      body: GetBuilder<SplashController>(
        init: SplashController(),
        initState: (_) {},
        builder: (_) {
          return SafeArea(
            child: SingleChildScrollView(
              child: SplashBody(),
            ),
          );
        },
      ),
    );
  }
}
