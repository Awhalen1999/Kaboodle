import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:go_router/go_router.dart';
import 'package:kaboodle/features/packingProcess/provider/packing_process_provider.dart';
import 'package:kaboodle/features/packingProcess/widgets/packing_process_body.dart';
import 'package:kaboodle/services/data/packing_list_cache.dart';
import 'package:kaboodle/shared/widgets/custom_button.dart';
import 'package:kaboodle/shared/widgets/custom_app_bar.dart';

class PackingProcessView extends StatelessWidget {
  final String listId;

  const PackingProcessView({super.key, required this.listId});

  @override
  Widget build(BuildContext context) {
    final cache = context.read<PackingListCache>();
    final packingProvider = PackingProcessProvider(listId, cache);

    return ChangeNotifierProvider.value(
      value: packingProvider,
      child: _PackingProcessContent(),
    );
  }
}

class _PackingProcessContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CustomAppBar(
        title: 'Packing Process',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.close_rounded),
              iconSize: 28,
              color: Theme.of(context).colorScheme.onSurface,
              onPressed: () => context.go('/my-packing-lists'),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              // Progress indicator
              Consumer<PackingProcessProvider>(
                builder: (context, provider, child) {
                  return Column(
                    children: [
                      StepProgressIndicator(
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
                      ),
                      const SizedBox(height: 12),
                      // Progress text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${provider.checkedItems} of ${provider.totalItems} items packed',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          Text(
                            '${(provider.progressPercentage * 100).toInt()}%',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),
              // Main content
              Expanded(
                child: const PackingProcessBody(),
              ),
              // Bottom button
              Consumer<PackingProcessProvider>(
                builder: (context, provider, child) {
                  if (provider.isComplete) {
                    return CustomButton(
                      buttonText: '🎉 All Packed!',
                      onPressed: () {
                        _showCompletionDialog(context);
                      },
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      buttonColor: Colors.green,
                      isLoading: false,
                      borderRadius: 12,
                    );
                  } else {
                    return CustomButton(
                      buttonText:
                          provider.isSaving ? 'Saving...' : 'Save Progress',
                      onPressed: provider.isSaving
                          ? null
                          : () => _saveProgress(context, provider),
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      buttonColor: Theme.of(context).colorScheme.primary,
                      isLoading: provider.isSaving,
                      borderRadius: 12,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveProgress(
      BuildContext context, PackingProcessProvider provider) async {
    try {
      await provider.saveProgress();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Progress saved successfully!'),
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
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            Icon(
              Icons.celebration,
              color: Colors.green,
              size: 28,
            ),
            const SizedBox(width: 8),
            const Text('Packing Complete!'),
          ],
        ),
        content: const Text(
          'Congratulations! You\'ve successfully packed all your items. Your list has been updated with your progress.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Continue Packing'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Go back to list viewer
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}
