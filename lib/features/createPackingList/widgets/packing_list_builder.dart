import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copackr/shared/widgets/custom_checkbox_list_tile.dart';
import 'package:copackr/features/createPackingList/widgets/items_builder.dart';
import 'package:copackr/features/createPackingList/provider/create_packing_list_provider.dart';
import 'edit_items_modal.dart';

class PackingListBuilder extends StatelessWidget {
  const PackingListBuilder({Key? key}) : super(key: key);

  // Helper function that calculates the final quantity based on tripLength.
  // For fixed items, we return the baseQuantity.
  // For others, we multiply the baseQuantity by the trip length.
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

  // Opens the modal widget for editing quantity and note.
  void _openCustomizationSheet(
      BuildContext context, PackingItem item, int currentQuantity) {
    final provider = context.read<CreatePackingListProvider>();
    String currentNote = provider.itemNotes[item.id] ?? '';

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return EditItemsModal(
          label: item.label,
          initialQuantity: currentQuantity,
          initialNote: currentNote,
          onSave: (newQuantity, newNote) {
            provider.updateItemQuantity(item.id, newQuantity);
            provider.updateItemNote(item.id, newNote);
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
    final List<String> selectedSections = provider.itemsActivities;
    final double tripLength = provider.tripLength;

    List<Widget> listWidgets = [];

    for (var sectionKey in selectedSections) {
      final List<PackingItem>? sectionItems = packingItemsBySection[sectionKey];
      if (sectionItems == null || sectionItems.isEmpty) continue;

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

      for (var item in filteredItems) {
        final int quantity = provider.itemQuantities[item.id] ??
            getCalculatedQuantity(item, tripLength);
        final String note = provider.itemNotes[item.id] ?? '';
        final bool isChecked = provider.checkedItems[item.id] ?? false;

        listWidgets.add(
          CustomCheckboxListTile(
            iconData: item.iconData,
            text: item.label,
            quantity: quantity,
            note: note,
            value: isChecked,
            onChanged: (bool? newValue) {
              provider.toggleItemChecked(item.id, newValue);
            },
            onEdit: () => _openCustomizationSheet(context, item, quantity),
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
