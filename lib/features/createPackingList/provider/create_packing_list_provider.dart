import 'package:flutter/material.dart';

class CreatePackingListProvider extends ChangeNotifier {
  String _title = "";
  String _description = "";
  Color _listColor = Colors.grey;

  String get title => _title;
  String get description => _description;
  Color get listColor => _listColor;

  void updateTitle(String newTitle) {
    _title = newTitle;
    notifyListeners();
  }

  void updateDescription(String newDesc) {
    _description = newDesc;
    notifyListeners();
  }

  void updateListColor(Color newColor) {
    _listColor = newColor;
    notifyListeners();
  }
}
