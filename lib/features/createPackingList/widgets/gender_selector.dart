import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copackr/features/createPackingList/provider/create_packing_list_provider.dart';
import 'package:copackr/features/createPackingList/widgets/svg_button_row.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CreatePackingListProvider>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgButtonRow(
          svgAsset: 'assets/svg/male.svg',
          label: "Male",
          isSelected: model.gender == 'male',
          onPressed: () {
            model.updateGender('male');
          },
        ),
        SvgButtonRow(
          svgAsset: 'assets/svg/female.svg',
          label: "Female",
          isSelected: model.gender == 'female',
          onPressed: () {
            model.updateGender('female');
          },
        ),
        SvgButtonRow(
          svgAsset: 'assets/svg/other.svg',
          label: "Other",
          isSelected: model.gender == 'other',
          onPressed: () {
            model.updateGender('other');
          },
        ),
      ],
    );
  }
}
