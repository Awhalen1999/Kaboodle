import 'package:flutter/material.dart';
import 'package:copackr/shared/widgets/custom_checkbox_list_tile.dart';
import 'package:copackr/features/createPackingList/widgets/items_builder.dart';
import 'package:copackr/features/createPackingList/provider/create_packing_list_provider.dart';
import 'package:provider/provider.dart';

class PackingListBuilder extends StatefulWidget {
  const PackingListBuilder({Key? key}) : super(key: key);

  @override
  State<PackingListBuilder> createState() => _PackingListBuilderState();
}

class _PackingListBuilderState extends State<PackingListBuilder> {
  // Checkbox state for each item (keyed by unique id)
  Map<String, bool> checkedItems = {};

  @override
  Widget build(BuildContext context) {
    // Read current criteria from the provider.
    final provider = context.watch<CreatePackingListProvider>();
    final String gender = provider.gender ?? '';
    final String tripPurpose = provider.tripPurpose ?? '';
    final String weather = provider.weatherCondition ?? '';
    final String accommodation = provider.accommodation ?? '';
    // The user-selected sections (Items/Activities) are stored as a list of section keys.
    final List<String> selectedSections = provider.itemsActivities;

    // Build a list of widgets (section headers and item checkboxes)
    List<Widget> listWidgets = [];

    for (var sectionKey in selectedSections) {
      // Get items for this section.
      final List<PackingItem>? sectionItems = packingItemsBySection[sectionKey];
      if (sectionItems == null || sectionItems.isEmpty) continue;

      // Filter the items based on user criteria.
      final filteredItems = sectionItems.where((item) {
        return itemMatchesCriteria(
          item,
          gender: gender,
          tripPurpose: tripPurpose,
          weather: weather,
          accommodation: accommodation,
        );
      }).toList();

      if (filteredItems.isEmpty) continue;

      // Add a section header.
      listWidgets.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            _formatSectionTitle(sectionKey),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );

      // Add each filtered item as a checkbox tile.
      for (var item in filteredItems) {
        // Initialize state for the item if not already done.
        if (!checkedItems.containsKey(item.id)) {
          checkedItems[item.id] = false;
        }
        listWidgets.add(
          CustomCheckboxListTile(
            iconData:
                item.iconData, // Use the icon data from the item definition.
            text: item.label,
            value: checkedItems[item.id]!,
            onChanged: (bool? newValue) {
              setState(() {
                checkedItems[item.id] = newValue ?? false;
              });
            },
          ),
        );
      }
    }

    return ListView(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // Let the parent scroll view handle scrolling.
      children: listWidgets,
    );
  }

  // Helper to convert a section key into a nicer title.
  String _formatSectionTitle(String key) {
    switch (key) {
      case 'commonItems':
        return 'Common Items';
      case 'clothes':
        return 'Clothes';
      case 'toiletries':
        return 'Toiletries';
      case 'electronics':
        return 'Electronics';
      case 'beach':
        return 'Beach';
      case 'gym':
        return 'Gym';
      default:
        return key;
    }
  }
}
