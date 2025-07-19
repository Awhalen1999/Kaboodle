import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kaboodle/features/packingProcess/provider/packing_process_provider.dart';
import 'package:kaboodle/features/packingProcess/widgets/completion_bottom_sheet.dart';
import 'package:kaboodle/shared/widgets/custom_button.dart';

class PackingBottomButton extends StatelessWidget {
  final PackingProcessProvider provider;

  const PackingBottomButton({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Consumer<PackingProcessProvider>(
      builder: (context, provider, _) {
        if (provider.isComplete) {
          return _buildCompletionButton(context);
        } else {
          return _buildSaveButton(context);
        }
      },
    );
  }

  Widget _buildCompletionButton(BuildContext context) {
    return CustomButton(
      buttonText: '🎉 All Packed!',
      onPressed: () => _handleCompletion(context),
      textColor: Theme.of(context).colorScheme.onPrimary,
      buttonColor: Colors.green,
      isLoading: false,
      borderRadius: 12,
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return CustomButton(
      buttonText: provider.isSaving ? 'Saving...' : 'Save Progress',
      onPressed: provider.isSaving ? null : () => _handleSave(context),
      textColor: Theme.of(context).colorScheme.onPrimary,
      buttonColor: Theme.of(context).colorScheme.primary,
      isLoading: provider.isSaving,
      borderRadius: 12,
    );
  }

  Future<void> _handleCompletion(BuildContext context) async {
    await _saveProgress(context);
    if (context.mounted) {
      _showCompletionDialog(context);
    }
  }

  Future<void> _handleSave(BuildContext context) async {
    await _saveProgress(context);
  }

  Future<void> _saveProgress(BuildContext context) async {
    try {
      await provider.saveProgress();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Progress saved successfully!'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving progress: $e'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  void _showCompletionDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CompletionBottomSheet(provider: provider),
    );
  }
}
