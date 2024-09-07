import 'package:flutter/material.dart';
Widget customCard({required Widget child, double radius =15, double horizontalPadding =8, double verticalPadding =0, double horizontalMargin =0, double verticalMargin =0,double width = double.infinity}){
  return Container(
    width: width,
    padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
    margin: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: verticalMargin),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(width: 0.2),
      color: Colors.white70,
    ),
    child: child,
  );
}