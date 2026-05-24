import 'package:accel_test/colours.dart';
import 'package:flutter/material.dart';

class AccelXyz extends StatefulWidget {
  const AccelXyz({super.key});

  @override
  State<AccelXyz> createState() => _AccelXyzState();
}

class _AccelXyzState extends State<AccelXyz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.background,
      appBar: AppBar(
        backgroundColor: Colours.onBackground,
        title: Text('Accelerometer Test', style: TextStyle(color: Colors.white)),
      ),
    );

  }
}