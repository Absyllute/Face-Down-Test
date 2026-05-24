import 'dart:async';

import 'package:sensors_plus/sensors_plus.dart';

class PhoneConstraints {
  static double target = 10.0;
  static double leniency = 1;
  static bool phoneFaceDown = false; 
  static StreamSubscription? subscription;

  static void startDetecting() {
    subscription = accelerometerEventStream(
      samplingPeriod: SensorInterval.normalInterval
    ).listen(
      (AccelerometerEvent event) {
        if ((event.z - target).abs() <= leniency) {
          phoneFaceDown = true;
        } else {
          phoneFaceDown = false;
        }
      }
    );
  }

  static void stopDetecting() {
    subscription?.cancel();
  }
}