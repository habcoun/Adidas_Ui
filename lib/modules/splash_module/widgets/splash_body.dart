import 'package:adidas_ui/shared/constant/const_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashBody extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: Get.height * 0.4),
        child: Image(
          width: 150,
          fit: BoxFit.contain,
          image: AssetImage(
            ImageApp.KLogoWhite,
          ),
        ),
      ),
    );
  }
}
