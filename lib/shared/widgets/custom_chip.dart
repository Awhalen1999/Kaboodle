import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        "9",
        style: TextStyle(
          fontWeight: FontWeight.w800,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      side: BorderSide.none,
      visualDensity: VisualDensity.compact,
    );
  }
}
