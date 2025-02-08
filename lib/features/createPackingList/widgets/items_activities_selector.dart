import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copackr/features/createPackingList/provider/create_packing_list_provider.dart';
import 'package:copackr/shared/widgets/custom_svg_checkbox_list_tile.dart';

class ItemsActivitiesSelector extends StatelessWidget {
  const ItemsActivitiesSelector({Key? key}) : super(key: key);

  // Define your items here (ID, label, and SVG path)
  static final List<_ActivityItem> _allItems = [
    _ActivityItem(
      id: "essential",
      label: "Essential items",
      svgPath: "assets/svg/checklist.svg",
    ),
    _ActivityItem(
      id: "clothes",
      label: "Clothes",
      svgPath: "assets/svg/hawaiian-shirt.svg",
    ),
    _ActivityItem(
      id: "toiletries",
      label: "Toiletries",
      svgPath: "assets/svg/toothbrush.svg",
    ),
    _ActivityItem(
      id: "electronics",
      label: "Electronics",
      svgPath: "assets/svg/laptop.svg",
    ),
    _ActivityItem(
      id: "photography",
      label: "Photography",
      svgPath: "assets/svg/camera.svg",
    ),
    _ActivityItem(
      id: "beach",
      label: "Beach",
      svgPath: "assets/svg/umbrella.svg",
    ),
    _ActivityItem(
      id: "gym",
      label: "Gym",
      svgPath: "assets/svg/dumbbell.svg",
    ),
    _ActivityItem(
      id: "formal",
      label: "Formal Event",
      svgPath: "assets/svg/bow-tie.svg",
    ),
    _ActivityItem(
      id: "cycling",
      label: "Cycling",
      svgPath: "assets/svg/bicycle.svg",
    ),
    _ActivityItem(
      id: "hiking",
      label: "Hiking",
      svgPath: "assets/svg/mountain-route.svg",
    ),
    _ActivityItem(
      id: "winterSports",
      label: "Winter Sports",
      svgPath: "assets/svg/winter-hat.svg",
    ),
    _ActivityItem(
      id: "fishing",
      label: "Fishing",
      svgPath: "assets/svg/rod.svg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CreatePackingListProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _allItems.map((item) {
        final isChecked = provider.isItemSelected(item.id);

        return CustomSvgCheckboxListTile(
          svgAsset: item.svgPath,
          text: item.label,
          value: isChecked,
          onChanged: (val) {
            if (val != null) {
              provider.toggleItemActivity(item.id);
            }
          },
        );
      }).toList(),
    );
  }
}

// Simple holder for item ID, label, and SVG icon path
class _ActivityItem {
  final String id;
  final String label;
  final String svgPath;

  const _ActivityItem({
    required this.id,
    required this.label,
    required this.svgPath,
  });
}
