import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sensors_plus/sensors_plus.dart';

class PhoneConstraints {
  static double target = -10.0;
  static double enterLeniency = 1.0;
  static double exitLeniency = 2.5; 
  static bool phoneFaceDown = false;
  static StreamSubscription? subscription;

  static void startDetecting({VoidCallback? onUpdate}) {
    subscription = accelerometerEventStream(
      samplingPeriod: SensorInterval.normalInterval,
    ).listen((AccelerometerEvent event) {
      final distance = (event.z - target).abs();

      if (!phoneFaceDown && distance <= enterLeniency) {
        phoneFaceDown = true;
        onUpdate?.call();
      } else if (phoneFaceDown && distance > exitLeniency) {
        phoneFaceDown = false;
        onUpdate?.call();
      }
    });
  }

  static void stopDetecting() {
    subscription?.cancel();
  }
}