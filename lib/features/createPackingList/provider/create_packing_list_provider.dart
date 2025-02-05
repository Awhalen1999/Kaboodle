import 'package:flutter/material.dart';

class CreatePackingListProvider extends ChangeNotifier {
  String _title = "";
  String _description = "";
  Color _listColor = Colors.grey;
  List<String> _tags = [];
  DateTime? _travelDate;

  String get title => _title;
  String get description => _description;
  Color get listColor => _listColor;
  List<String> get tags => _tags;
  DateTime? get travelDate => _travelDate;

  void updateTitle(String newTitle) {
    debugPrint("[Provider] Changing title to $newTitle");
    _title = newTitle;
    notifyListeners();
  }

  void updateDescription(String newDesc) {
    debugPrint("[Provider] Changing description to $newDesc");
    _description = newDesc;
    notifyListeners();
  }

  void updateListColor(Color newColor) {
    debugPrint("[Provider] Changing list color to $newColor");
    _listColor = newColor;
    notifyListeners();
  }

// Todo: this is temporarily remove due to the state management with the selected params
  void updateTags(List<String> newTags) {
    debugPrint("[Provider] Changing tags to $newTags");
    _tags = newTags;
    notifyListeners();
  }

  void updateTravelDate(DateTime? date) {
    debugPrint("[Provider] Changing travel date to $date");
    _travelDate = date;
    notifyListeners();
  }
}
