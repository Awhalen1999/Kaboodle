import 'package:flutter/material.dart';

class MainStepFourBody extends StatelessWidget {
  const MainStepFourBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Step 4: Overview',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
