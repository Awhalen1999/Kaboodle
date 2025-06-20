import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copackr/features/createPackingList/provider/create_packing_list_provider.dart';
import 'package:copackr/features/createPackingList/widgets/svg_button_column.dart';
import 'package:copackr/core/constants/app_constants.dart';

class AccommodationSelector extends StatelessWidget {
  const AccommodationSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CreatePackingListProvider>();

    // Helper to build a row of buttons
    Widget buildRow(List<String> keys) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: keys.map((key) {
          final details = accommodationDetails[key]!;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: SvgButtonColumn(
                svgAsset: details['svgPath']!,
                label: details['label']!,
                isSelected: provider.accommodation == key,
                onPressed: () => provider.updateAccommodation(key),
              ),
            ),
          );
        }).toList(),
      );
    }

    // Get the keys and split them for two rows
    final keys = accommodationDetails.keys.toList();
    final firstRowKeys = keys.sublist(0, (keys.length / 2).ceil());
    final secondRowKeys = keys.sublist((keys.length / 2).ceil());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildRow(firstRowKeys),
        const SizedBox(height: 16),
        buildRow(secondRowKeys),
      ],
    );
  }
}
