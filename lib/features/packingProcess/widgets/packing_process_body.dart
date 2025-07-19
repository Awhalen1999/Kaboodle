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
}
