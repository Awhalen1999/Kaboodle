import 'package:flutter/material.dart';

class CreatePackingListProvider extends ChangeNotifier {
  String _title = "";
  String _description = "";
  Color _listColor = Colors.grey;
  List<String> _tags = [];
  DateTime? _travelDate;
  String? _gender;
  String? _tripPurpose;
  String? _weatherCondition;
  double _tripLength = 1.0;
  String? _accommodation;
  final List<String> _itemsActivities = [];

  // New state for checked items
  final Map<String, bool> _checkedItems = {};
  final Map<String, int> _itemQuantities = {};
  final Map<String, String> _itemNotes = {};

  // Getters for the new state
  Map<String, bool> get checkedItems => Map.unmodifiable(_checkedItems);
  Map<String, int> get itemQuantities => Map.unmodifiable(_itemQuantities);
  Map<String, String> get itemNotes => Map.unmodifiable(_itemNotes);

  String get title => _title;
  String get description => _description;
  Color get listColor => _listColor;
  List<String> get tags => _tags;
  DateTime? get travelDate => _travelDate;
  String? get gender => _gender;
  String? get tripPurpose => _tripPurpose;
  String? get weatherCondition => _weatherCondition;
  double get tripLength => _tripLength;
  String? get accommodation => _accommodation;
  List<String> get itemsActivities => List.unmodifiable(_itemsActivities);

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
      debugPrint("[Provider] Removed item: $item");
    } else {
      _itemsActivities.add(item);
      debugPrint("[Provider] Added item: $item");
    }
    notifyListeners();
  }

  bool isItemSelected(String itemId) => _itemsActivities.contains(itemId);

  // New methods to manage checked items state
  void toggleItemChecked(String itemId, bool? value) {
    _checkedItems[itemId] = value ?? false;
    debugPrint(
        "[Provider] Item $itemId checked state: ${_checkedItems[itemId]}");
    notifyListeners();
  }

  void updateItemQuantity(String itemId, int quantity) {
    _itemQuantities[itemId] = quantity;
    debugPrint("[Provider] Item $itemId quantity updated to: $quantity");
    notifyListeners();
  }

  void updateItemNote(String itemId, String note) {
    if (note.isEmpty) {
      _itemNotes.remove(itemId);
      debugPrint("[Provider] Note removed for item: $itemId");
    } else {
      _itemNotes[itemId] = note;
      debugPrint("[Provider] Note updated for item $itemId: $note");
    }
    notifyListeners();
  }

  // Helper method to get the complete state of an item
  Map<String, dynamic> getItemState(String itemId) {
    return {
      'checked': _checkedItems[itemId] ?? false,
      'quantity': _itemQuantities[itemId],
      'note': _itemNotes[itemId],
    };
  }
}
