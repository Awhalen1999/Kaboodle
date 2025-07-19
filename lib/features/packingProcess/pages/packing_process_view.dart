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
              // Header Container with Title and Menu
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: 0.2),
                  ),
                ),
                child: Consumer<PackingProcessProvider>(
                  builder: (context, provider, child) {
                    final listTitle =
                        provider.listData?['title'] ?? 'Packing List';

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Row with Title and Menu
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.checklist_rounded,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      listTitle,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Menu Button
                            PopupMenuButton<String>(
                              icon: const Icon(Icons.more_vert, size: 20),
                              onSelected: (value) {
                                switch (value) {
                                  case 'check_all':
                                    provider.checkAllItems();
                                    break;
                                  case 'uncheck_all':
                                    provider.uncheckAllItems();
                                    break;
                                  case 'save':
                                    _saveProgress(context, provider);
                                    break;
                                }
                              },
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                  value: 'check_all',
                                  child: Row(
                                    children: [
                                      Icon(Icons.check_box, size: 18),
                                      SizedBox(width: 8),
                                      Text('Check All'),
                                    ],
                                  ),
                                ),
                                const PopupMenuItem(
                                  value: 'uncheck_all',
                                  child: Row(
                                    children: [
                                      Icon(Icons.check_box_outline_blank,
                                          size: 18),
                                      SizedBox(width: 8),
                                      Text('Uncheck All'),
                                    ],
                                  ),
                                ),
                                const PopupMenuItem(
                                  value: 'save',
                                  child: Row(
                                    children: [
                                      Icon(Icons.save, size: 18),
                                      SizedBox(width: 8),
                                      Text('Save Progress'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Progress Bar
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
                        const SizedBox(height: 8),
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                            ),
                            Text(
                              '${(provider.progressPercentage * 100).toInt()}%',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
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
