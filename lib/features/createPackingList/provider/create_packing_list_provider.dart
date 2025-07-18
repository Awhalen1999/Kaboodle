import 'package:kaboodle/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'custom_items_provider.dart';

// Represents a packing list item as it will be stored in Firestore
class PackingListItem {
  final String id;
  final String label;
  final String section;
  final int baseQuantity;
  final int calculatedQuantity;
  final int? customQuantity;
  final String? note;
  final bool isChecked;
  final String iconName;

  const PackingListItem({
    required this.id,
    required this.label,
    required this.section,
    required this.baseQuantity,
    required this.calculatedQuantity,
    this.customQuantity,
    this.note,
    this.isChecked = false,
    required this.iconName,
  });

  // Factory constructor to create from Firestore data
  factory PackingListItem.fromMap(Map<String, dynamic> map) {
    return PackingListItem(
      id: map['id'] as String,
      label: map['label'] as String,
      section: map['section'] as String,
      baseQuantity: map['baseQuantity'] as int,
      calculatedQuantity: map['calculatedQuantity'] as int,
      customQuantity: map['customQuantity'] as int?,
      note: map['note'] as String?,
      isChecked: map['isChecked'] as bool? ?? false,
      iconName: map['iconName'] as String? ?? 'checkroom_rounded',
    );
  }

  // Create a copy with updated values
  PackingListItem copyWith({
    String? id,
    String? label,
    String? section,
    int? baseQuantity,
    int? calculatedQuantity,
    int? customQuantity,
    String? note,
    bool? isChecked,
    String? iconName,
  }) {
    return PackingListItem(
      id: id ?? this.id,
      label: label ?? this.label,
      section: section ?? this.section,
      baseQuantity: baseQuantity ?? this.baseQuantity,
      calculatedQuantity: calculatedQuantity ?? this.calculatedQuantity,
      customQuantity: customQuantity ?? this.customQuantity,
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
      'baseQuantity': baseQuantity,
      'calculatedQuantity': calculatedQuantity,
      'isChecked': isChecked,
      'iconName': iconName,
    };

    // Only include optional fields if they have values
    if (customQuantity != null) {
      map['customQuantity'] = customQuantity;
    }
    if (note != null && note!.isNotEmpty) {
      map['note'] = note;
    }

    return map;
  }

  // Get the final quantity to display (custom if set, otherwise calculated)
  int get finalQuantity => customQuantity ?? calculatedQuantity;

  // Convert stored icon string back to IconData
  IconData get icon => getIconByName(iconName);
}

class CreatePackingListProvider extends ChangeNotifier {
  // Step 1 & 2 data
  String _title = "";
  String _description = "";
  Color _listColor = Colors.grey;
  DateTime? _travelDate;
  String? _gender;
  String? _tripPurpose;
  String? _weatherCondition;
  double _tripLength = 1.0;
  String? _accommodation;
  final List<String> _itemsActivities = [];

  // Step 3 data - selected items with their state
  final Map<String, PackingListItem> _selectedItems = {};

  // Getters
  String get title => _title;
  String get description => _description;
  Color get listColor => _listColor;
  DateTime? get travelDate => _travelDate;
  String? get gender => _gender;
  String? get tripPurpose => _tripPurpose;
  String? get weatherCondition => _weatherCondition;
  double get tripLength => _tripLength;
  String? get accommodation => _accommodation;
  List<String> get itemsActivities => List.unmodifiable(_itemsActivities);

  // Step 3 getters
  Map<String, PackingListItem> get selectedItems =>
      Map.unmodifiable(_selectedItems);
  List<PackingListItem> get selectedItemsList => _selectedItems.values.toList();

  // Step 1 & 2 methods
  void updateTitle(String title) {
    debugPrint("[Provider] Changing title to $title");
    _title = title;
    notifyListeners();
  }

  void updateDescription(String desc) {
    debugPrint("[Provider] Changing description to $desc");
    _description = desc;
    notifyListeners();
  }

  void updateListColor(Color color) {
    debugPrint("[Provider] Changing list color to $color");
    _listColor = color;
    notifyListeners();
  }

  void updateTravelDate(DateTime? date) {
    debugPrint("[Provider] Changing travel date to $date");
    _travelDate = date;
    notifyListeners();
  }

  void updateGender(String? gender) {
    debugPrint("[Provider] Changing trip gender to $gender");
    _gender = gender;
    notifyListeners();
  }

  void updateTripPurpose(String? purpose) {
    debugPrint("[Provider] Changing trip purpose to $purpose");
    _tripPurpose = purpose;
    notifyListeners();
  }

  void updateWeatherCondition(String? condition) {
    debugPrint("[Provider] Changing weather condition to $condition");
    _weatherCondition = condition;
    notifyListeners();
  }

  void updateTripLength(double length) {
    debugPrint("[Provider] Changing trip length to $length");
    _tripLength = length;
    notifyListeners();
  }

  void updateAccommodation(String? accommodation) {
    debugPrint("[Provider] Changing accommodation to $accommodation");
    _accommodation = accommodation;
    notifyListeners();
  }

  void toggleItemActivity(String item) {
    if (_itemsActivities.contains(item)) {
      _itemsActivities.remove(item);
      debugPrint("[Provider] Removed section: $item");
    } else {
      _itemsActivities.add(item);
      debugPrint("[Provider] Added section: $item");
    }
    notifyListeners();
  }

  bool isItemSelected(String itemId) => _itemsActivities.contains(itemId);

  // Step 3 methods - much cleaner item management
  void addItem(PackingListItem item) {
    _selectedItems[item.id] = item;
    debugPrint("[Provider] Added item: ${item.label}");
    notifyListeners();
  }

  void removeItem(String itemId) {
    _selectedItems.remove(itemId);
    debugPrint("[Provider] Removed item: $itemId");
    notifyListeners();
  }

  void updateItem(PackingListItem updatedItem) {
    _selectedItems[updatedItem.id] = updatedItem;
    debugPrint("[Provider] Updated item: ${updatedItem.label}");
    notifyListeners();
  }

  // Convenience methods for common operations
  void toggleItemChecked(String itemId, bool? value) {
    final item = _selectedItems[itemId];
    if (item != null) {
      final updatedItem = item.copyWith(isChecked: value ?? false);
      _selectedItems[itemId] = updatedItem;
      debugPrint(
          "[Provider] Item ${item.label} checked: ${updatedItem.isChecked}");
      notifyListeners();
    }
  }

  void updateItemQuantity(String itemId, int quantity) {
    final item = _selectedItems[itemId];
    if (item != null) {
      final updatedItem = item.copyWith(customQuantity: quantity);
      _selectedItems[itemId] = updatedItem;
      debugPrint("[Provider] Item ${item.label} quantity: $quantity");
      notifyListeners();
    }
  }

  void updateItemNote(String itemId, String note) {
    final item = _selectedItems[itemId];
    if (item != null) {
      final updatedItem = item.copyWith(note: note.isEmpty ? null : note);
      _selectedItems[itemId] = updatedItem;
      debugPrint(
          "[Provider] Item ${item.label} note: ${note.isEmpty ? 'removed' : note}");
      notifyListeners();
    }
  }

  // Helper methods
  PackingListItem? getItem(String itemId) => _selectedItems[itemId];

  bool hasItem(String itemId) => _selectedItems.containsKey(itemId);

  int get selectedItemsCount => _selectedItems.length;

  int get checkedItemsCount =>
      _selectedItems.values.where((item) => item.isChecked).length;

  // Get all items for a specific section
  List<PackingListItem> getItemsForSection(String section) {
    return _selectedItems.values
        .where((item) => item.section == section)
        .toList();
  }

  // Clear all selected items (useful for resetting)
  void clearSelectedItems() {
    _selectedItems.clear();
    debugPrint("[Provider] Cleared all selected items");
    notifyListeners();
  }

  // Get the complete packing list data for saving to Firestore
  Map<String, dynamic> getPackingListData(
      [CustomItemsProvider? customItemsProvider]) {
    final checkedCustomItems = customItemsProvider?.customItemsList ?? [];

    // Convert custom items to the same structure as regular items
    final convertedCustomItems = checkedCustomItems.map((customItem) {
      return {
        'id': customItem.id,
        'label': customItem.label,
        'section': customItem.section,
        'baseQuantity': customItem.quantity,
        'calculatedQuantity': customItem.quantity,
        'customQuantity': customItem.quantity,
        'note': customItem.note,
        'isChecked': customItem.isChecked,
        'iconName': customItem.iconName,
      };
    }).toList();

    return {
      'title': _title,
      'description': _description,
      'listColor': _listColor.value, // Store as int
      'travelDate': _travelDate?.toIso8601String(),
      'gender': _gender,
      'tripPurpose': _tripPurpose,
      'weatherCondition': _weatherCondition,
      'tripLength': _tripLength,
      'accommodation': _accommodation,
      'selectedSections': _itemsActivities,
      'items': [
        ..._selectedItems.values
            .map((item) => item.toMap()), // Include all selected items
        ...convertedCustomItems, // Add converted custom items
      ],
      'createdAt': DateTime.now().toIso8601String(),
      'updatedAt': DateTime.now().toIso8601String(),
      'isCompleted': false,
    };
  }

  // Load packing list data from Firestore
  void loadPackingListData(Map<String, dynamic> data) {
    _title = data['title'] as String? ?? '';
    _description = data['description'] as String? ?? '';
    _listColor = Color(data['listColor'] as int? ?? Colors.grey.value);

    final travelDateString = data['travelDate'] as String?;
    _travelDate =
        travelDateString != null ? DateTime.tryParse(travelDateString) : null;

    _gender = data['gender'] as String?;
    _tripPurpose = data['tripPurpose'] as String?;
    _weatherCondition = data['weatherCondition'] as String?;
    _tripLength = (data['tripLength'] as num?)?.toDouble() ?? 1.0;
    _accommodation = data['accommodation'] as String?;
    _itemsActivities.clear();
    _itemsActivities
        .addAll(List<String>.from(data['selectedSections'] as List? ?? []));

    // Load items
    _selectedItems.clear();
    final itemsList = data['items'] as List? ?? [];
    for (final itemData in itemsList) {
      final item = PackingListItem.fromMap(itemData as Map<String, dynamic>);
      _selectedItems[item.id] = item;
    }

    debugPrint(
        "[Provider] Loaded packing list: ${_selectedItems.length} items");
    notifyListeners();
  }

  // Reset all data (useful for creating new lists)
  void reset() {
    _title = "";
    _description = "";
    _listColor = Colors.grey;
    _travelDate = null;
    _gender = null;
    _tripPurpose = null;
    _weatherCondition = null;
    _tripLength = 1.0;
    _accommodation = null;
    _itemsActivities.clear();
    _selectedItems.clear();

    debugPrint("[Provider] Reset all data");
    notifyListeners();
  }
}
