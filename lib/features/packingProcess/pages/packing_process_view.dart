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
                                  case 'finish':
                                    provider.checkAllItems();
                                    _saveProgress(context, provider).then((_) {
                                      if (context.mounted) {
                                        _showCompletionDialog(
                                            context, provider);
                                      }
                                    });
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
                                const PopupMenuItem(
                                  value: 'finish',
                                  child: Row(
                                    children: [
                                      Icon(Icons.check_circle, size: 18),
                                      SizedBox(width: 8),
                                      Text('Finish Packing'),
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
                      onPressed: () async {
                        // Save progress before showing completion dialog
                        await _saveProgress(context, provider);
                        if (context.mounted) {
                          _showCompletionDialog(context, provider);
                        }
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

  void _showCompletionDialog(
      BuildContext context, PackingProcessProvider provider) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _CompletionBottomSheet(provider: provider),
    );
  }
}

class _CompletionBottomSheet extends StatefulWidget {
  final PackingProcessProvider provider;

  const _CompletionBottomSheet({required this.provider});

  @override
  State<_CompletionBottomSheet> createState() => _CompletionBottomSheetState();
}

class _CompletionBottomSheetState extends State<_CompletionBottomSheet> {
  bool _confirmDelete = false;

  void _handleDelete() {
    if (_confirmDelete) {
      // TODO: Implement delete functionality
      Navigator.of(context).pop(); // Close bottom sheet
      Navigator.of(context).pop(); // Go back to list viewer
    } else {
      setState(() {
        _confirmDelete = true;
      });
    }
  }

  void _resetConfirm() {
    if (_confirmDelete) {
      setState(() {
        _confirmDelete = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 32),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      'Packing Complete!',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  _resetConfirm();
                },
                icon: Icon(
                  Icons.close_rounded,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                style: IconButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.surfaceContainer,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Message
          Text(
            'Congratulations! You\'ve successfully packed all your items. Your list has been updated with your progress.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 32),
          // Continue Packing Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: Text(
                'Continue Packing',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              onPressed: () {
                Navigator.pop(context);
                _resetConfirm();
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Finish and Keep Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              label: Text(
                'Finish & Keep List',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
              onPressed: () async {
                // Record completion and reset items for future use
                widget.provider.uncheckAllItems();
                await widget.provider.recordCompletion();

                if (context.mounted) {
                  Navigator.pop(context);
                  context.go('/my-packing-lists');
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Finish and Delete Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              label: Text(
                _confirmDelete ? 'Are you sure?' : 'Finish & Delete List',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
              onPressed: _handleDelete,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: _confirmDelete
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
