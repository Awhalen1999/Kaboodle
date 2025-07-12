import 'package:flutter/material.dart';

class TripDetailsOverview extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final VoidCallback? onEdit;

  const TripDetailsOverview({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      color: Theme.of(context)
          .colorScheme
          .surfaceContainerLow, // Use surfaceContainer for background
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trip Details',
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
            _OverviewField(label: 'Title', value: title),
            const SizedBox(height: 8),
            _OverviewField(label: 'Description', value: description),
            const SizedBox(height: 8),
            _OverviewField(label: 'Date', value: date),
          ],
        ),
      ),
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
