import 'package:kaboodle/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kaboodle/features/createPackingList/provider/create_packing_list_provider.dart';
import 'package:kaboodle/features/createPackingList/widgets/svg_button_row.dart';

class WeatherConditionSelector extends StatelessWidget {
  const WeatherConditionSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CreatePackingListProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: weatherConditionDetails.entries.map((entry) {
        final key = entry.key;
        final details = entry.value;
        return SvgButtonRow(
          svgAsset: details['svgPath']!,
          label: details['label']!,
          isSelected: provider.weatherCondition == key,
          onPressed: () => provider.updateWeatherCondition(key),
        );
      }).toList(),
    );
  }
}
