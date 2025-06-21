import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copackr/shared/widgets/custom_checkbox_list_tile.dart';
import 'package:copackr/features/createPackingList/widgets/items_builder.dart';
import 'package:copackr/features/createPackingList/provider/create_packing_list_provider.dart';
import 'package:copackr/features/createPackingList/provider/custom_items_provider.dart';
import 'edit_items_modal.dart';
import 'add_custom_item_modal.dart';
import 'package:copackr/core/constants/app_icons.dart';

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

  // Convert PackingItem to PackingListItem
  PackingListItem createPackingListItem(
      PackingItem item, double tripLength, String sectionKey) {
    final calculatedQuantity = getCalculatedQuantity(item, tripLength);

    return PackingListItem(
      id: item.id,
      label: item.label,
      section: sectionKey,
      baseQuantity: item.baseQuantity,
      calculatedQuantity: calculatedQuantity,
      iconName: item.iconName,
    );
  }

  // Opens the modal widget for editing quantity and note.
  void _openCustomizationSheet(
      BuildContext context, PackingListItem packingItem) {
    final provider = context.read<CreatePackingListProvider>();

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return EditItemsModal(
          label: packingItem.label,
          initialQuantity: packingItem.finalQuantity,
          initialNote: packingItem.note ?? '',
          onSave: (newQuantity, newNote) {
            // Update the item with new quantity and note
            final updatedItem = packingItem.copyWith(
              customQuantity:
                  newQuantity, // Will be null if quantity wasn't changed
              note: newNote.isEmpty ? null : newNote,
            );
            provider.updateItem(updatedItem);
          },
        );
      },
    );
  }

  // Opens the modal widget for adding custom items
  void _openAddCustomItemSheet(BuildContext context, String sectionKey) {
    final customItemsProvider = context.read<CustomItemsProvider>();

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AddCustomItemModal(
          sectionTitle: _formatSectionTitle(sectionKey),
          onAdd: (itemName, quantity) {
            customItemsProvider.addCustomItem(itemName, quantity, sectionKey);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Read current criteria from the provider.
    final provider = context.watch<CreatePackingListProvider>();
    final customItemsProvider = context.watch<CustomItemsProvider>();
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

      // Get custom items for this section
      final customItems =
          customItemsProvider.getCustomItemsForSection(sectionKey);

      // Show section if it has filtered items OR custom items
      if (filteredItems.isEmpty && customItems.isEmpty) continue;

      listWidgets.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  _formatSectionTitle(sectionKey),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              IconButton(
                onPressed: () => _openAddCustomItemSheet(context, sectionKey),
                icon: Icon(
                  Icons.add_circle_outline_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      );

      for (var item in filteredItems) {
        // Check if this item is already selected
        final existingPackingItem = provider.getItem(item.id);

        if (existingPackingItem != null) {
          // Item is already selected - show it as selected (but not checked for packing)
          listWidgets.add(
            CustomCheckboxListTile(
              iconData: existingPackingItem.icon,
              text: existingPackingItem.label,
              quantity: existingPackingItem.finalQuantity,
              note: existingPackingItem.note ?? '',
              value:
                  true, // Always true when item is in the list (not isChecked)
              onChanged: (bool? newValue) {
                if (newValue == false) {
                  // User unselected this item - remove it from the list
                  provider.removeItem(item.id);
                }
                // If newValue is true, do nothing (item is already selected)
              },
              onEdit: () =>
                  _openCustomizationSheet(context, existingPackingItem),
            ),
          );
        } else {
          // Item is not selected - show it as unselected
          final calculatedQuantity = getCalculatedQuantity(item, tripLength);

          listWidgets.add(
            CustomCheckboxListTile(
              iconData: getIconByName(item.iconName),
              text: item.label,
              quantity: calculatedQuantity,
              note: '',
              value: false, // Not in the list yet
              onChanged: (bool? newValue) {
                if (newValue == true) {
                  // User selected this item - add it to the list
                  final packingItem =
                      createPackingListItem(item, tripLength, sectionKey);
                  provider.addItem(packingItem);
                  // Mark it as checked for packing
                  provider.toggleItemChecked(packingItem.id, true);
                }
              },
              onEdit: () {
                // Create the item first, then open edit modal
                final packingItem =
                    createPackingListItem(item, tripLength, sectionKey);
                provider.addItem(packingItem);
                // Mark it as checked for packing
                provider.toggleItemChecked(packingItem.id, true);
                _openCustomizationSheet(context, packingItem);
              },
            ),
          );
        }
      }

      // Add custom items for this section
      for (var customItem in customItems) {
        listWidgets.add(
          CustomCheckboxListTile(
            iconData: customItem.icon,
            text: customItem.label,
            quantity: customItem.quantity,
            note: customItem.note ?? '',
            value: customItem.isChecked,
            onChanged: (bool? newValue) {
              customItemsProvider.toggleCustomItemChecked(
                  customItem.id, newValue);
            },
            onEdit: () {
              // Open edit modal for custom item
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return EditItemsModal(
                    label: customItem.label,
                    initialQuantity: customItem.quantity,
                    initialNote: customItem.note ?? '',
                    onSave: (newQuantity, newNote) {
                      // Update the custom item with new quantity and note
                      final updatedItem = customItem.copyWith(
                        quantity: newQuantity ?? customItem.quantity,
                        note: newNote.isEmpty ? null : newNote,
                      );
                      customItemsProvider.updateCustomItem(updatedItem);
                    },
                  );
                },
              );
            },
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
