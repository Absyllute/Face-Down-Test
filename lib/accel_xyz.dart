import 'dart:async';

import 'package:accel_test/colours.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AccelXyz extends StatefulWidget {
  const AccelXyz({super.key});

  @override
  State<AccelXyz> createState() => _AccelXyzState();
}

class _AccelXyzState extends State<AccelXyz> {

  StreamSubscription<AccelerometerEvent>? _subscription;

  void _startDetecting() {
    _subscription = accelerometerEventStream(
      samplingPeriod: SensorInterval.normalInterval
    ).listen(
      (AccelerometerEvent event) {
        setState(() {
          xPos = 'X: ${event.x.toStringAsFixed(2)}';
          yPos = 'Y: ${event.y.toStringAsFixed(2)}';
          zPos = 'Z: ${event.z.toStringAsFixed(2)}';
        });
      },
    );
  }

  late String xPos = '0.0';
  late String yPos = '0.0';
  late String zPos = '0.0';

  @override
  void initState() {
    _startDetecting();
    super.initState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.background,
      appBar: AppBar(
        backgroundColor: Colours.onBackground,
        title: Text('Accelerometer Test', style: TextStyle(color: Colors.white)),
      ),

      body: Center(
        child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.white,
            fontSize: 24
          ),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text(xPos),
              Text(yPos),
              Text(zPos)
            ],
          ),
        ),
      ),
    );

  }
}