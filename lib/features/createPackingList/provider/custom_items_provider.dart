import 'package:copackr/core/constants/app_icons.dart';
import 'package:flutter/material.dart';

// Represents a custom packing list item
class CustomPackingItem {
  final String id;
  final String label;
  final String section;
  final int quantity;
  final String? note;
  final bool isChecked;
  final String iconName;

  const CustomPackingItem({
    required this.id,
    required this.label,
    required this.section,
    required this.quantity,
    this.note,
    this.isChecked = false,
    required this.iconName,
  });

  // Factory constructor to create from Firestore data
  factory CustomPackingItem.fromMap(Map<String, dynamic> map) {
    return CustomPackingItem(
      id: map['id'] as String,
      label: map['label'] as String,
      section: map['section'] as String,
      quantity: map['quantity'] as int,
      note: map['note'] as String?,
      isChecked: map['isChecked'] as bool? ?? false,
      iconName: map['iconName'] as String? ?? 'checkroom_rounded',
    );
  }

  // Create a copy with updated values
  CustomPackingItem copyWith({
    String? id,
    String? label,
    String? section,
    int? quantity,
    String? note,
    bool? isChecked,
    String? iconName,
  }) {
    return CustomPackingItem(
      id: id ?? this.id,
      label: label ?? this.label,
      section: section ?? this.section,
      quantity: quantity ?? this.quantity,
      note: note ?? this.note,
      isChecked: isChecked ?? this.isChecked,
      iconName: iconName ?? this.iconName,
    );
  }

  // Convert to Map for Firestore
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'label': label,
      'section': section,
      'quantity': quantity,
      'isChecked': isChecked,
      'iconName': iconName,
    };

    if (note != null && note!.isNotEmpty) {
      map['note'] = note;
    }

    return map;
  }

  // Convert stored icon string back to IconData
  IconData get icon => getIconByName(iconName);
}

class CustomItemsProvider extends ChangeNotifier {
  final Map<String, CustomPackingItem> _customItems = {};

  // Getters
  Map<String, CustomPackingItem> get customItems =>
      Map.unmodifiable(_customItems);
  List<CustomPackingItem> get customItemsList => _customItems.values.toList();

  // Add a new custom item
  void addCustomItem(String itemName, int quantity, String section) {
    final customId = 'custom_${DateTime.now().millisecondsSinceEpoch}';

    final customItem = CustomPackingItem(
      id: customId,
      label: itemName,
      section: section,
      quantity: quantity,
      iconName: 'checkroom_rounded', // Default icon
    );

    _customItems[customId] = customItem;
    debugPrint(
        "[CustomItemsProvider] Added custom item: $itemName to section: $section");
    notifyListeners();
  }

  // Remove a custom item
  void removeCustomItem(String itemId) {
    _customItems.remove(itemId);
    debugPrint("[CustomItemsProvider] Removed custom item: $itemId");
    notifyListeners();
  }

  // Update a custom item
  void updateCustomItem(CustomPackingItem updatedItem) {
    _customItems[updatedItem.id] = updatedItem;
    debugPrint(
        "[CustomItemsProvider] Updated custom item: ${updatedItem.label}");
    notifyListeners();
  }

  // Toggle the checked state of a custom item
  void toggleCustomItemChecked(String itemId, bool? value) {
    final item = _customItems[itemId];
    if (item != null) {
      final updatedItem = item.copyWith(isChecked: value ?? false);
      _customItems[itemId] = updatedItem;
      debugPrint(
          "[CustomItemsProvider] Custom item ${item.label} checked: ${updatedItem.isChecked}");
      notifyListeners();
    }
  }

  // Get custom items for a specific section
  List<CustomPackingItem> getCustomItemsForSection(String section) {
    return _customItems.values
        .where((item) => item.section == section)
        .toList();
  }

  // Get all checked custom items
  List<CustomPackingItem> getCheckedCustomItems() {
    return _customItems.values.where((item) => item.isChecked).toList();
  }

  // Clear all custom items
  void clearCustomItems() {
    _customItems.clear();
    debugPrint("[CustomItemsProvider] Cleared all custom items");
    notifyListeners();
  }

  // Get custom item by ID
  CustomPackingItem? getCustomItem(String itemId) => _customItems[itemId];

  // Check if custom item exists
  bool hasCustomItem(String itemId) => _customItems.containsKey(itemId);

  // Get count of custom items
  int get customItemsCount => _customItems.length;

  // Get count of checked custom items
  int get checkedCustomItemsCount =>
      _customItems.values.where((item) => item.isChecked).length;
}
