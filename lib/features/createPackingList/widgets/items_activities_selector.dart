import 'package:kaboodle/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kaboodle/features/createPackingList/provider/create_packing_list_provider.dart';
import 'package:kaboodle/shared/widgets/custom_svg_checkbox_list_tile.dart';

class ItemsActivitiesSelector extends StatelessWidget {
  const ItemsActivitiesSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CreatePackingListProvider>();

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Items/Activities',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Column(
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
            ),
          ],
        ),
      ),
    );
  }
}
