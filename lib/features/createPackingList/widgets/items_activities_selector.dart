import 'package:copackr/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copackr/features/createPackingList/provider/create_packing_list_provider.dart';
import 'package:copackr/shared/widgets/custom_svg_checkbox_list_tile.dart';

class ItemsActivitiesSelector extends StatelessWidget {
  const ItemsActivitiesSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CreatePackingListProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: activityDetails.entries.map((entry) {
        final String itemId = entry.key;
        final Map<String, dynamic> itemData = entry.value;
        final bool isChecked = provider.isItemSelected(itemId);

        return CustomSvgCheckboxListTile(
          svgAsset: itemData['svgPath'] as String,
          text: itemData['label'] as String,
          value: isChecked,
          onChanged: (val) {
            if (val != null) {
              provider.toggleItemActivity(itemId);
            }
          },
        );
      }).toList(),
    );
  }
}
