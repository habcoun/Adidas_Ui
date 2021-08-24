import 'dart:ui';
import 'package:adidas_ui/shared/constant/const_colors.dart';
import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final String linkIcon;
  const SocialIcon({
    required this.linkIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorsApp.KGrey,
              blurRadius: 20,
              spreadRadius: 0.2,
            ),
          ],
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        height: 50,
        width: 50,
        child: Center(
          child: GestureDetector(
            onTap: () {},
            child: Image.asset(
              linkIcon,
            ),
          ),
        ),
      ),
    );
  }
}

class Defaultbotton extends StatelessWidget {
  Defaultbotton(
      {this.background = Colors.blue,
      this.width = double.infinity,
      required this.text,
      this.radius = 5.0,
      required this.onPress});
  final double width;
  final Color background;
  final String text;
  final double radius;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 65.0,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontFamily: 'PoppinsSemiBold',
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}

class CostumTextFormFeild extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String label;
  final dynamic onSubmit;
  final dynamic onChange;
  final dynamic onTap;
  final dynamic validate;
  final dynamic prefix;
  final dynamic suffix;
  final dynamic suffixPressed;
  final bool isPassword;

  CostumTextFormFeild({
    required this.label,
    required this.controller,
    required this.type,
    required this.prefix,
    required this.onSubmit,
    this.onChange,
    required this.validate,
    this.onTap,
    this.suffixPressed,
    this.suffix,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        errorStyle: TextStyle(
          fontSize: 11,
          fontFamily: 'Poppins',
          color: Colors.red,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFCCCCCC),
            width: 0.1,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        suffixIcon: Icon(
          suffix,
          size: 24,
          color: Color(0xFFCCCCCC),
        ),
        prefixIcon: GestureDetector(
          onTap: () {},
          child: Icon(
            prefix,
            size: 24,
            color: Color(0xFFCCCCCC),
          ),
        ),
        labelStyle: TextStyle(
            fontSize: 16,
            fontFamily: 'PoppinsSemiBold',
            color: Color(
              0xFFA8AFB9,
            )),
      ),
      obscureText: isPassword,
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      onSaved: onSubmit,
      validator: validate,
    );
  }
}

class MyDividerText extends StatelessWidget {
  final String text;
  const MyDividerText({
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            height: 1.0,
            color: Color(0xFFC4C4C4),
          ),
        ),
        Text(
          text,
          style: TextStyle(
              color: Color(0xFFC4C4C4),
              fontSize: 14,
              fontFamily: 'PoppinsSemiBold',
              fontWeight: FontWeight.bold),
        ),
        Flexible(
          child: Container(
            height: 1.0,
            color: Color(0xFFC4C4C4),
          ),
        ),
      ],
    );
  }
}

class MyDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        height: 1.0,
        color: Color(0xFFC4C4C4),
      ),
    );
  }
}
