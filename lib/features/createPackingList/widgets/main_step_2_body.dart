import 'package:flutter/material.dart';

class MainStepTwoBody extends StatelessWidget {
  const MainStepTwoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Step 2: Travel Requirements',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
