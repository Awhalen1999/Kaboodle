import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kaboodle/features/createPackingList/provider/create_packing_list_provider.dart';
import 'package:kaboodle/features/createPackingList/provider/custom_items_provider.dart';

class TripItemsOverview extends StatelessWidget {
  final VoidCallback? onEdit;

  const TripItemsOverview({super.key, this.onEdit});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CreatePackingListProvider>();
    final customItemsProvider = context.watch<CustomItemsProvider>();

    // Get checked regular items
    final regularItems =
        provider.selectedItemsList.where((item) => item.isChecked).toList();
    // Get checked custom items
    final customItems = customItemsProvider.getCheckedCustomItems();

    // Combine all items for display
    final allItems = [...regularItems, ...customItems];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Packing List',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit, size: 18),
                  label: const Text('Edit'),
                  style: TextButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (allItems.isEmpty)
              Text('No items selected',
                  style: Theme.of(context).textTheme.bodyMedium),
            if (allItems.isNotEmpty)
              Column(
                children: allItems.map((item) {
                  // Handle both regular and custom items
                  final label = item is PackingListItem
                      ? item.label
                      : (item as CustomPackingItem).label;
                  final quantity = item is PackingListItem
                      ? item.finalQuantity
                      : (item as CustomPackingItem).quantity;
                  final note = item is PackingListItem
                      ? item.note
                      : (item as CustomPackingItem).note;
                  final iconData = item is PackingListItem
                      ? item.icon
                      : (item as CustomPackingItem).icon;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: Icon(
                              iconData,
                              size: 22,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        label,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface,
                                            ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'x$quantity',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface
                                                .withOpacity(0.6),
                                          ),
                                    ),
                                  ],
                                ),
                                if (note != null && note.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Text(
                                      note,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface
                                                .withOpacity(0.7),
                                          ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
