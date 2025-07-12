import 'package:kaboodle/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kaboodle/features/createPackingList/provider/create_packing_list_provider.dart';
import 'package:kaboodle/features/createPackingList/widgets/svg_button_row.dart';

class WeatherConditionSelector extends StatelessWidget {
  const WeatherConditionSelector({super.key});

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
              'Weather conditions',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
