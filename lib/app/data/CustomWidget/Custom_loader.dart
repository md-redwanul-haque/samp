import 'package:flutter/material.dart';


class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator()),
    );
  }
}