import 'package:flutter/material.dart';
import 'package:kaboodle/shared/widgets/trip_details_overview.dart';
import 'package:kaboodle/shared/widgets/trip_requirements_overview.dart';
import 'package:kaboodle/shared/widgets/trip_items_overview.dart';

class EditPackingListBody extends StatelessWidget {
  final String listId;
  // For now, mock data. In the future, fetch from DB/cache using listId.
  const EditPackingListBody({super.key, required this.listId});

  @override
  Widget build(BuildContext context) {
    // Mock data for demonstration
    final title = 'Trip to Paris';
    final description = 'A fun trip to Paris!';
    final date = 'Jul 10, 2024';
    final purpose = 'Vacation';
    final weather = 'Warm';
    final tripLength = '1 week';
    final accommodation = 'Hotel';
    final itemsActivities = ['sightseeing', 'museum'];
    final items = [
      TripItemOverviewData(
        label: 'T-Shirt',
        quantity: 4,
        note: 'Pack extra',
        icon: Icons.checkroom_rounded,
      ),
      TripItemOverviewData(
        label: 'Medication',
        quantity: 1,
        note: 'Daily',
        icon: Icons.medication_rounded,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Edit packing list details",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            "Edit your packing list details. You can add, remove, and edit items.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          TripDetailsOverview(
            title: title,
            description: description,
            date: date,
          ),
          TripRequirementsOverview(
            purpose: purpose,
            weather: weather,
            tripLength: tripLength,
            accommodation: accommodation,
            itemsActivities: itemsActivities,
          ),
          TripItemsOverview(
            items: items,
          ),
        ],
      ),
    );
  }
}
