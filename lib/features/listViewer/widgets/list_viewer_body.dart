import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kaboodle/services/data/packing_list_cache.dart';
import 'package:kaboodle/core/constants/app_icons.dart';
import 'package:kaboodle/core/constants/app_constants.dart';
import 'package:kaboodle/core/utils/date_formatter.dart';
import 'package:kaboodle/shared/widgets/custom_item_chip.dart';
import 'package:go_router/go_router.dart';

class ListViewerBody extends StatelessWidget {
  final String listId;
  const ListViewerBody({super.key, required this.listId});

  @override
  Widget build(BuildContext context) {
    return Consumer<PackingListCache>(
      builder: (context, cache, child) {
        if (cache.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (cache.error != null) {
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
                  cache.error!,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        final listData = cache.getListById(listId);
        if (listData == null) {
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
                  'Packing list not found',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'The packing list you\'re looking for doesn\'t exist or has been deleted.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        // Extract data from the list
        final title = listData['title'] ?? 'Untitled';
        final description = listData['description'] ?? '';
        final date = DateFormatter.formatDate(listData['travelDate']);
        final purpose = listData['tripPurpose'] ?? 'NA';
        final weather = listData['weatherCondition'] ?? 'NA';
        final tripLength =
            DateFormatter.formatTripLength(listData['tripLength'] ?? 0.0);
        final accommodation = listData['accommodation'] ?? 'NA';
        final itemsActivities =
            List<String>.from(listData['selectedSections'] ?? []);
        final itemsList = listData['items'] as List? ?? [];

        return Padding(
          padding: const EdgeInsets.only(left: 4, right: 4, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Concise summary card
              Card(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 1,
                color: Theme.of(context).colorScheme.surfaceContainerLow,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          if (description.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              description,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _InfoPair(label: 'Date', value: date),
                              _InfoPair(label: 'Purpose', value: purpose),
                              _InfoPair(label: 'Weather', value: weather),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _InfoPair(label: 'Duration', value: tripLength),
                              _InfoPair(label: 'Stay', value: accommodation),
                              const SizedBox(width: 60), // for alignment
                            ],
                          ),
                          if (itemsActivities.isNotEmpty) ...[
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: itemsActivities.map((activityId) {
                                final details = activityDetails[activityId];
                                if (details == null)
                                  return const SizedBox.shrink();
                                return CustomItemChip(
                                  label: details['label'],
                                  color: details['color'],
                                );
                              }).toList(),
                            ),
                          ],
                        ],
                      ),
                    ),
                    // Floating item count badge
                    Positioned(
                      top: 12,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.12),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          '${itemsList.length} items',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Scroll prompt
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.keyboard_arrow_down_rounded,
                        color: Theme.of(context).colorScheme.primary, size: 28),
                    const SizedBox(width: 4),
                    Text(
                      'Scroll to start packing',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              // Ready to pack section
              _buildPackingPrompt(context, itemsList.length),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPackingPrompt(BuildContext context, int itemCount) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.checklist_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ready to Pack?',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                      ),
                      Text(
                        '$itemCount items to pack',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Start the interactive packing process to check off items as you pack them into your bag.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.play_arrow_rounded,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                label: Text(
                  'Start Packing',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
                onPressed: () {
                  // TODO: Navigate to packing process
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Packing process coming soon!'),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                  );
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
          ],
        ),
      ),
    );
  }
}

class _InfoPair extends StatelessWidget {
  final String label;
  final String value;
  const _InfoPair({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
