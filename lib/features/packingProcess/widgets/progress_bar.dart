import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:kaboodle/features/packingProcess/provider/packing_process_provider.dart';

class ProgressBar extends StatelessWidget {
  final PackingProcessProvider provider;

  const ProgressBar({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return StepProgressIndicator(
      totalSteps: provider.totalItems,
      currentStep: provider.checkedItems,
      size: 8,
      unselectedColor: Colors.grey.shade300,
      selectedGradientColor: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Theme.of(context).colorScheme.secondary,
          Theme.of(context).colorScheme.primary,
        ],
      ),
      roundedEdges: const Radius.circular(10),
    );
  }
}
