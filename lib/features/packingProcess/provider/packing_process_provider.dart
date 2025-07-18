import 'package:flutter/material.dart';
import 'package:kaboodle/services/data/packing_list_cache.dart';
import 'package:kaboodle/services/data/firestore.dart';
import 'package:kaboodle/core/constants/app_icons.dart';

class PackingProcessProvider extends ChangeNotifier {
  final String listId;
  final PackingListCache _cache;
  final FirestoreService _firestoreService = FirestoreService();

  Map<String, dynamic>? _listData;
  List<PackingProcessItem> _packingItems = [];
  bool _isLoading = true;
  String? _error;
  bool _isSaving = false;

  PackingProcessProvider(this.listId, this._cache) {
    _loadPackingList();
  }

  // Getters
  Map<String, dynamic>? get listData => _listData;
  List<PackingProcessItem> get packingItems => List.unmodifiable(_packingItems);
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isSaving => _isSaving;

  int get totalItems => _packingItems.length;
  int get checkedItems => _packingItems.where((item) => item.isChecked).length;
  double get progressPercentage =>
      totalItems > 0 ? checkedItems / totalItems : 0.0;
  bool get isComplete => checkedItems == totalItems && totalItems > 0;

  // Load the packing list data
  Future<void> _loadPackingList() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // Get the list from cache
      _listData = _cache.getListById(listId);

      if (_listData == null) {
        _error = 'Packing list not found';
        _isLoading = false;
        notifyListeners();
        return;
      }

      // Convert items to PackingProcessItem format
      final itemsList = _listData!['items'] as List? ?? [];
      _packingItems = itemsList.map((itemData) {
        final item = itemData as Map<String, dynamic>;
        final iconName = item['iconName'] as String? ?? 'checkroom_rounded';
        return PackingProcessItem(
          id: item['id'] as String? ?? '',
          label: item['label'] as String? ?? 'Unknown Item',
          quantity: item['customQuantity'] as int? ??
              item['calculatedQuantity'] as int? ??
              item['baseQuantity'] as int? ??
              1,
          note: item['note'] as String? ?? '',
          icon: getIconByName(iconName),
          isChecked: item['isChecked'] as bool? ?? false,
        );
      }).toList();

      _isLoading = false;
      notifyListeners();

      debugPrint('📦 Loaded ${_packingItems.length} items for packing process');
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      debugPrint('❌ Error loading packing list: $e');
    }
  }

  // Toggle item checked state
  void toggleItem(String itemId) {
    final index = _packingItems.indexWhere((item) => item.id == itemId);
    if (index != -1) {
      _packingItems[index] = _packingItems[index].copyWith(
        isChecked: !_packingItems[index].isChecked,
      );
      notifyListeners();
      debugPrint('📦 Toggled item: ${_packingItems[index].label}');
    }
  }

  // Check all items
  void checkAllItems() {
    for (int i = 0; i < _packingItems.length; i++) {
      _packingItems[i] = _packingItems[i].copyWith(isChecked: true);
    }
    notifyListeners();
    debugPrint('📦 Checked all items');
  }

  // Uncheck all items
  void uncheckAllItems() {
    for (int i = 0; i < _packingItems.length; i++) {
      _packingItems[i] = _packingItems[i].copyWith(isChecked: false);
    }
    notifyListeners();
    debugPrint('📦 Unchecked all items');
  }

  // Save progress to Firestore
  Future<void> saveProgress() async {
    if (_listData == null) return;

    try {
      _isSaving = true;
      notifyListeners();

      // Update the items in the list data
      final updatedItems = _packingItems.map((item) {
        final itemMap = <String, dynamic>{
          'id': item.id,
          'label': item.label,
          'section': 'packing', // We'll use a generic section for packing
          'baseQuantity': item.quantity,
          'calculatedQuantity': item.quantity,
          'customQuantity': item.quantity,
          'isChecked': item.isChecked,
          'iconName': 'checkroom_rounded', // Default icon
        };

        // Only include note if it has content
        if (item.note.isNotEmpty) {
          itemMap['note'] = item.note;
        }

        return itemMap;
      }).toList();

      final updatedListData = {
        ..._listData!,
        'items': updatedItems,
        'updatedAt': DateTime.now().toIso8601String(),
        'isCompleted': isComplete,
      };

      // Update in cache
      _cache.updateList(listId, updatedListData);

      // Update in Firestore
      await _firestoreService.updatePackingList(listId, updatedListData);

      _isSaving = false;
      notifyListeners();

      debugPrint('📦 Progress saved successfully');
    } catch (e) {
      _isSaving = false;
      notifyListeners();
      debugPrint('❌ Error saving progress: $e');
      rethrow;
    }
  }

  // Refresh the list data
  Future<void> refresh() async {
    await _loadPackingList();
  }
}

// Represents an item in the packing process
class PackingProcessItem {
  final String id;
  final String label;
  final int quantity;
  final String note;
  final IconData icon;
  final bool isChecked;

  const PackingProcessItem({
    required this.id,
    required this.label,
    required this.quantity,
    required this.note,
    required this.icon,
    required this.isChecked,
  });

  PackingProcessItem copyWith({
    String? id,
    String? label,
    int? quantity,
    String? note,
    IconData? icon,
    bool? isChecked,
  }) {
    return PackingProcessItem(
      id: id ?? this.id,
      label: label ?? this.label,
      quantity: quantity ?? this.quantity,
      note: note ?? this.note,
      icon: icon ?? this.icon,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
