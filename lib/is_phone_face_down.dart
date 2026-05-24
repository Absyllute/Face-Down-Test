import 'package:accel_test/constraints.dart';
import 'package:flutter/material.dart';

class IsPhoneFaceDown extends StatefulWidget {
  const IsPhoneFaceDown({super.key});

  @override
  State<IsPhoneFaceDown> createState() => _IsPhoneFaceDownState();
}

class _IsPhoneFaceDownState extends State<IsPhoneFaceDown> {

  @override
  void initState() {
    super.initState();
    PhoneConstraints.startDetecting( onUpdate: () => setState(() {}) );
  }

  @override
  void dispose() {
    PhoneConstraints.stopDetecting();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PhoneConstraints.phoneFaceDown ? Colors.green : Colors.red,

      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Icon(Icons.phone_android_rounded, color: Colors.white, size: 64),
            Text(PhoneConstraints.phoneFaceDown ? 'Phone Face Down :)' : 'Phone NOT face down :(',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24
              ),
            )
          ],
        ),
      ),
    );
  }
}