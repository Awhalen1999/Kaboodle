import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copackr/shared/widgets/custom_checkbox_list_tile.dart';
import 'package:copackr/features/createPackingList/widgets/items_builder.dart';
import 'package:copackr/features/createPackingList/provider/create_packing_list_provider.dart';
import 'edit_items_modal.dart'; // Updated import

class PackingListBuilder extends StatefulWidget {
  const PackingListBuilder({Key? key}) : super(key: key);

  @override
  State<PackingListBuilder> createState() => _PackingListBuilderState();
}

class _PackingListBuilderState extends State<PackingListBuilder> {
  // Checkbox state for each item (keyed by unique id)
  Map<String, bool> checkedItems = {};

  // Custom quantities that override calculated quantities (if edited)
  Map<String, int> customQuantities = {};

  // Helper function that calculates the final quantity based on tripLength.
  // For fixed items we return the baseQuantity.
  // For others we multiply the baseQuantity by the trip length.
  int getCalculatedQuantity(PackingItem item, double tripLength) {
    const fixedItems = {
      'medication',
      'wallet',
      'watch',
      'map',
      'campas',
      'portable_charger',
      'glasses',
      'earbuds',
      'toothbrush',
      'toothpaste',
      'razor',
      'electric_shaver',
      'hairbrush',
      'nail_clippers',
      'shampoo',
      'conditioner',
      'shaving_cream',
      'mouthwash',
      'tweezers',
      'contacts',
      'contact_solution',
      'deodorant',
      'cologne',
      'laptop',
      'laptop_case',
      'laptop_charger',
      'tablet',
      'tablet_charger',
      'tablet_case',
      'phone',
      'phone_charger',
      'headphones',
      'headphones_charger',
      'keyboard',
      'mouse',
      'camera',
      'camera_charger',
    };

    if (fixedItems.contains(item.id)) {
      return item.baseQuantity;
    }
    return (item.baseQuantity * tripLength).round();
  }

  // Opens the custom modal widget for editing quantity.
  void _openCustomizationSheet(PackingItem item, int currentQuantity) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return EditItemsModal(
          label: item.label,
          initialQuantity: currentQuantity,
          onSave: (newQuantity) {
            setState(() {
              customQuantities[item.id] = newQuantity;
            });
          },
        );
      },
    );
  }

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
    // Trip length for calculating quantities.
    final double tripLength = provider.tripLength;

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

      // Section header.
      listWidgets.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            _formatSectionTitle(sectionKey),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      );

      // Add each filtered item as a checkbox tile.
      for (var item in filteredItems) {
        if (!checkedItems.containsKey(item.id)) {
          checkedItems[item.id] = false;
        }
        final int quantity = customQuantities[item.id] ??
            getCalculatedQuantity(item, tripLength);
        listWidgets.add(
          CustomCheckboxListTile(
            iconData: item.iconData,
            text: item.label,
            quantity: quantity,
            value: checkedItems[item.id]!,
            onChanged: (bool? newValue) {
              setState(() {
                checkedItems[item.id] = newValue ?? false;
              });
            },
            onEdit: () => _openCustomizationSheet(item, quantity),
          ),
        );
      }
    }

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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
      case 'formal':
        return 'Formal';
      case 'photography':
        return 'Photography';
      default:
        return key;
    }
  }
}
