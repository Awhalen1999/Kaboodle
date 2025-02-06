import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:copackr/features/createPackingList/provider/create_packing_list_provider.dart';
import 'package:copackr/features/createPackingList/widgets/svg_button_row.dart';

class WeatherConditionSelector extends StatelessWidget {
  const WeatherConditionSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CreatePackingListProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgButtonRow(
          svgAsset: 'assets/svg/warm.svg',
          label: "Hot",
          isSelected: provider.weatherCondition == 'hot',
          onPressed: () => provider.updateWeatherCondition('hot'),
        ),
        SvgButtonRow(
          svgAsset: 'assets/svg/cool.svg',
          label: "Cold",
          isSelected: provider.weatherCondition == 'cold',
          onPressed: () => provider.updateWeatherCondition('cold'),
        ),
        SvgButtonRow(
          svgAsset: 'assets/svg/mild.svg',
          label: "Mild",
          isSelected: provider.weatherCondition == 'mild',
          onPressed: () => provider.updateWeatherCondition('mild'),
        ),
      ],
    );
  }
}
