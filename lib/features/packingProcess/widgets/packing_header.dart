import 'package:flutter/material.dart';
import 'package:kaboodle/features/packingProcess/provider/packing_process_provider.dart';
import 'package:kaboodle/features/packingProcess/widgets/header_title_row.dart';
import 'package:kaboodle/features/packingProcess/widgets/progress_bar.dart';
import 'package:kaboodle/features/packingProcess/widgets/progress_text.dart';

class PackingHeader extends StatelessWidget {
  final PackingProcessProvider provider;

  const PackingHeader({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _buildHeaderDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitleRow(provider: provider),
          const SizedBox(height: 12),
          ProgressBar(provider: provider),
          const SizedBox(height: 8),
          ProgressText(provider: provider),
        ],
      ),
    );
  }

  BoxDecoration _buildHeaderDecoration(BuildContext context) {
    return BoxDecoration(
      color:
          Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
      ),
    );
  }
}
