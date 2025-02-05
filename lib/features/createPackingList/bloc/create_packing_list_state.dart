import 'package:flutter/material.dart';

class CreatePackingListState {
  final String title;
  final String description;
  final Color listColor;
  final List<String> tags;
  final DateTime? travelDate;

  CreatePackingListState({
    required this.title,
    required this.description,
    required this.listColor,
    required this.tags,
    required this.travelDate,
  });

  factory CreatePackingListState.initial() {
    return CreatePackingListState(
      title: "",
      description: "",
      listColor: Colors.grey, // default color option
      tags: [],
      travelDate: null,
    );
  }

  CreatePackingListState copyWith({
    String? title,
    String? description,
    Color? listColor,
    List<String>? tags,
    DateTime? travelDate,
  }) {
    return CreatePackingListState(
      title: title ?? this.title,
      description: description ?? this.description,
      listColor: listColor ?? this.listColor,
      tags: tags ?? this.tags,
      travelDate: travelDate ?? this.travelDate,
    );
  }
}
