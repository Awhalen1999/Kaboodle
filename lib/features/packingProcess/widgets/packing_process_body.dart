import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kaboodle/features/packingProcess/provider/packing_process_provider.dart';
import 'package:kaboodle/shared/widgets/custom_checkbox_list_tile.dart';

class PackingProcessBody extends StatelessWidget {
  const PackingProcessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PackingProcessProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (provider.error != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(height: 16),
                Text(
                  'Error loading packing list',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  provider.error!,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => provider.refresh(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (provider.packingItems.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.inbox_outlined,
                  size: 64,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(height: 16),
                Text(
                  'No items to pack',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'This packing list doesn\'t have any items to pack.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        // Get list title for header
        final listTitle = provider.listData?['title'] ?? 'Packing List';

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pack Your Bag',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Check off items as you pack them into your bag.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    // List title card
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primaryContainer
                            .withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.checklist_rounded,
                            color: Theme.of(context).colorScheme.primary,
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
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ),
                          Consumer<PackingProcessProvider>(
                            builder: (context, provider, child) {
                              return PopupMenuButton<String>(
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
                                        Icon(Icons.check_box),
                                        SizedBox(width: 8),
                                        Text('Check All'),
                                      ],
                                    ),
                                  ),
                                  const PopupMenuItem(
                                    value: 'uncheck_all',
                                    child: Row(
                                      children: [
                                        Icon(Icons.check_box_outline_blank),
                                        SizedBox(width: 8),
                                        Text('Uncheck All'),
                                      ],
                                    ),
                                  ),
                                  const PopupMenuItem(
                                    value: 'save',
                                    child: Row(
                                      children: [
                                        Icon(Icons.save),
                                        SizedBox(width: 8),
                                        Text('Save Progress'),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Items list
              ...provider.packingItems
                  .map((item) => _buildPackingItem(context, item, provider)),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPackingItem(BuildContext context, PackingProcessItem item,
      PackingProcessProvider provider) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: CustomCheckboxListTile(
        iconData: item.icon,
        text: item.label,
        quantity: item.quantity,
        value: item.isChecked,
        note: item.note,
        onChanged: (value) {
          provider.toggleItem(item.id);
        },
        onEdit: null, // No edit functionality in packing process
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
}
