import 'package:flutter/material.dart';
import 'package:kaboodle/core/constants/app_constants.dart';
import 'package:kaboodle/shared/widgets/custom_item_chip.dart';

class TripRequirementsOverview extends StatelessWidget {
  final String purpose;
  final String weather;
  final String tripLength;
  final String accommodation;
  final List<String> itemsActivities;
  final VoidCallback? onEdit;

  const TripRequirementsOverview({
    super.key,
    required this.purpose,
    required this.weather,
    required this.tripLength,
    required this.accommodation,
    required this.itemsActivities,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trip Requirements',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit, size: 18),
                  label: const Text('Edit'),
                  style: TextButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _OverviewField(label: 'Purpose of Trip', value: purpose),
            const SizedBox(height: 8),
            _OverviewField(label: 'Weather Preference', value: weather),
            const SizedBox(height: 8),
            _OverviewField(label: 'Trip Length', value: tripLength),
            const SizedBox(height: 8),
            _OverviewField(label: 'Accommodations', value: accommodation),
            const SizedBox(height: 8),
            _buildItemsActivities(context, itemsActivities),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsActivities(
      BuildContext context, List<String> itemsActivities) {
    if (itemsActivities.isEmpty) {
      return const _OverviewField(label: 'Items / Activities', value: 'NA');
    }

    List<Widget> chips = itemsActivities.map((activityId) {
      final details = activityDetails[activityId];
      if (details == null) {
        return const SizedBox.shrink();
      }
      return Padding(
        padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
        child: CustomItemChip(
          label: details['label'],
          color: details['color'],
        ),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Items / Activities',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),
        ),
        const SizedBox(height: 4),
        Wrap(
          children: chips,
        ),
      ],
    );
  }
}

class _OverviewField extends StatelessWidget {
  final String label;
  final String value;
  const _OverviewField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
