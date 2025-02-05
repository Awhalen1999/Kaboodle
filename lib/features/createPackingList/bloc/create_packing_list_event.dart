import 'package:flutter/material.dart';

abstract class CreatePackingListEvent {}

class TitleUpdated extends CreatePackingListEvent {
  final String title;
  TitleUpdated({required this.title});
}

class DescriptionUpdated extends CreatePackingListEvent {
  final String description;
  DescriptionUpdated({required this.description});
}

class ColorUpdated extends CreatePackingListEvent {
  final Color color;
  ColorUpdated({required this.color});
}

class TagsUpdated extends CreatePackingListEvent {
  final List<String> tags;
  TagsUpdated({required this.tags});
}

class DateUpdated extends CreatePackingListEvent {
  final DateTime? date;
  DateUpdated({this.date});
}
