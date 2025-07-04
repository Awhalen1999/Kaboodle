import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String label;

  const CustomChip({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
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
