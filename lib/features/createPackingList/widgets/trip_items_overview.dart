import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copackr/features/createPackingList/provider/create_packing_list_provider.dart';

class TripItemsOverview extends StatelessWidget {
  const TripItemsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CreatePackingListProvider>();
    final items = provider.selectedItemsList;

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
                  onPressed: () {}, // TODO: Implement edit action
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
            if (items.isEmpty)
              Text('No items selected',
                  style: Theme.of(context).textTheme.bodyMedium),
            if (items.isNotEmpty)
              ...items.map((item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Icon(item.iconDataAsIcon,
                            size: 24,
                            color: Theme.of(context).colorScheme.primary),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            item.label,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Text(
                          '${item.finalQuantity}x',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
