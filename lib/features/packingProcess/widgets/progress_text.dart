import 'package:flutter/material.dart';
import 'package:kaboodle/features/packingProcess/provider/packing_process_provider.dart';

class ProgressText extends StatelessWidget {
  final PackingProcessProvider provider;

  const ProgressText({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${provider.checkedItems} of ${provider.totalItems} items packed',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        Text(
          '${(provider.progressPercentage * 100).toInt()}%',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ],
    );
  }
}
