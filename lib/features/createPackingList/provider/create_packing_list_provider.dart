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

// * this is temporarily remove due to the state management with the selected params
  void updateTags(List<String> tags) {
    debugPrint("[Provider] Changing tags to $tags");
    _tags = tags;
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
}
