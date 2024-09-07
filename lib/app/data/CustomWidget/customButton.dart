import 'package:flutter/material.dart';

import '../Utils/app_colors.dart';


class CustomButtonSquare extends StatelessWidget {
  final Function() onPress;
  final Color? backgroundColor;
  final Color? textColor;
  final String? btnTitle;
  final double btnRadius;
  final double btnHeight;
  double btnWidth;

  CustomButtonSquare({
    Key? key,
    required this.onPress,
    this.backgroundColor = AppColors.textColor,
    this.btnTitle = "Continue",
    required this.btnWidth,
    required this.textColor,
    this.btnRadius = 7,
    this.btnHeight = 32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(btnRadius),
      ),
      child: MaterialButton(
          height: btnHeight,
          minWidth: btnWidth,
          color: backgroundColor,
          onPressed: onPress,
          child: Text(
            btnTitle!,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: textColor,
            ),
          )),
    );
  }
}
