import 'package:copackr/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copackr/features/createPackingList/provider/create_packing_list_provider.dart';
import 'package:copackr/features/createPackingList/widgets/svg_button_row.dart';

class PurposeOfTripSelector extends StatelessWidget {
  const PurposeOfTripSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CreatePackingListProvider>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: purposeOfTripDetails.entries.map((entry) {
        final key = entry.key;
        final details = entry.value;
        return SvgButtonRow(
          svgAsset: details['svgPath']!,
          label: details['label']!,
          isSelected: model.tripPurpose == key,
          onPressed: () {
            model.updateTripPurpose(key);
          },
        );
      }).toList(),
    );
  }
}
