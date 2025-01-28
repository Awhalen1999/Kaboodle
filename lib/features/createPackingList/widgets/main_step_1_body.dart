import 'package:flutter/material.dart';

class MainStepOneBody extends StatelessWidget {
  const MainStepOneBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Step 1: Basic Info',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: const InputDecoration(
            labelText: 'List Title',
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Description',
          ),
        ),
      ],
    );
  }
}
