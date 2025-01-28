import 'package:flutter/material.dart';

class MainStepThreeBody extends StatelessWidget {
  const MainStepThreeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      child: Column(
        children: [
          const Text(
            'Step 3: build list',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
