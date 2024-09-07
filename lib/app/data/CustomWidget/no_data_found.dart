import 'package:flutter/material.dart';

class NodataFound extends StatelessWidget {
  const NodataFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('No data Found'),
      ),
    );
  }
}