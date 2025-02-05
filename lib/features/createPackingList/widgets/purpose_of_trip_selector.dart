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
      children: [
        SvgButtonRow(
          svgAsset: 'assets/svg/business.svg',
          label: "Business",
          isSelected: model.tripPurpose == 'business',
          onPressed: () {
            model.updateTripPurpose('business');
          },
        ),
        SvgButtonRow(
          svgAsset: 'assets/svg/vacation.svg',
          label: "Vacation",
          isSelected: model.tripPurpose == 'vacation',
          onPressed: () {
            model.updateTripPurpose('vacation');
          },
        ),
      ],
    );
  }
}
