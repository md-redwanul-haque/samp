import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'app_colors.dart';


class MyTextStyle {
  static primaryLight({
    Color fontColor = AppColors.textColor,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight);
  }
  static final TextStyle bottomNavigationLabelStyle =
  TextStyle(color: Colors.black, fontSize:15);

  static primaryBold({
    Color fontColor = AppColors.textColor,
    double fontSize = 28,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight);
  }

  static secondaryLight({
    Color fontColor = AppColors.textColor,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight);
  }

  static secondaryBold({
    Color fontColor = AppColors.textColor,
    double fontSize = 48,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return TextStyle(

        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight);
  }

  static appLogoStyle({

    Color fontColor = AppColors.textColor,
    double fontSize = 28,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight);
  }



}


