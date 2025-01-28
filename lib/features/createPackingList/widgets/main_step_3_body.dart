import 'package:flutter/material.dart';

class MainStepThreeBody extends StatelessWidget {
  const MainStepThreeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Step 3: build list',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
