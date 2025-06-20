import 'package:flutter/material.dart';
import 'package:copackr/features/createPackingList/widgets/trip_details_overview.dart';
import 'package:copackr/features/createPackingList/widgets/trip_requirements_overview.dart';
import 'package:copackr/features/createPackingList/widgets/trip_items_overview.dart';

class MainStepFourBody extends StatelessWidget {
  final VoidCallback? onEditTripDetails;
  final VoidCallback? onEditTripRequirements;
  final VoidCallback? onEditPackingList;

  const MainStepFourBody({
    Key? key,
    this.onEditTripDetails,
    this.onEditTripRequirements,
    this.onEditPackingList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section
          Text(
            "Overview",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            "Review your trip details and packing list before saving.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          TripDetailsOverview(onEdit: onEditTripDetails),
          TripRequirementsOverview(onEdit: onEditTripRequirements),
          TripItemsOverview(onEdit: onEditPackingList),
        ],
      ),
    );
  }
}
