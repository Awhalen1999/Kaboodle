import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kaboodle/features/createPackingList/widgets/packing_list_builder.dart';
import 'package:kaboodle/features/createPackingList/provider/create_packing_list_provider.dart';
import 'package:kaboodle/features/createPackingList/provider/custom_items_provider.dart';

class StepThreeContent extends StatelessWidget {
  final String? gender;
  final String? tripPurpose;
  final String? weatherCondition;
  final String? accommodation;
  final List<String> selectedSections;
  final double tripLength;
  final Map<String, PackingListItem>? existingItems;
  final Function(PackingListItem)? onItemAdded;
  final Function(String)? onItemRemoved;
  final Function(PackingListItem)? onItemUpdated;
  final Function(String, String, int)? onCustomItemAdded;
  final Function(String, bool?)? onCustomItemToggled;
  final Function(CustomPackingItem)? onCustomItemUpdated;

  const StepThreeContent({
    super.key,
    this.gender,
    this.tripPurpose,
    this.weatherCondition,
    this.accommodation,
    this.selectedSections = const [],
    this.tripLength = 0.0,
    this.existingItems,
    this.onItemAdded,
    this.onItemRemoved,
    this.onItemUpdated,
    this.onCustomItemAdded,
    this.onCustomItemToggled,
    this.onCustomItemUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Almost Ready to Go!",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            "Check out our recommendations and choose the items you want to pack.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          Consumer2<CreatePackingListProvider, CustomItemsProvider>(
            builder: (context, provider, customItemsProvider, child) {
              return PackingListBuilder(
                gender: gender,
                tripPurpose: tripPurpose,
                weatherCondition: weatherCondition,
                accommodation: accommodation,
                selectedSections: selectedSections,
                tripLength: tripLength,
                existingItems: existingItems,
                onItemAdded: onItemAdded ?? provider.addItem,
                onItemRemoved: onItemRemoved ?? provider.removeItem,
                onItemUpdated: onItemUpdated ?? provider.updateItem,
                onCustomItemAdded: onCustomItemAdded ??
                    (section, itemName, quantity) => customItemsProvider
                        .addCustomItem(itemName, quantity, section),
                onCustomItemToggled: onCustomItemToggled ??
                    customItemsProvider.toggleCustomItemChecked,
                onCustomItemUpdated:
                    onCustomItemUpdated ?? customItemsProvider.updateCustomItem,
              );
            },
          ),
        ],
      ),
    );
  }
}
