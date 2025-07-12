import 'package:kaboodle/features/createPackingList/widgets/accommodation_selector.dart';
import 'package:kaboodle/features/createPackingList/widgets/gender_selector.dart';
import 'package:kaboodle/features/createPackingList/widgets/items_activities_selector.dart';
import 'package:kaboodle/features/createPackingList/widgets/purpose_of_trip_selector.dart';
import 'package:kaboodle/features/createPackingList/widgets/trip_length_slider.dart';
import 'package:kaboodle/features/createPackingList/widgets/weather_condition_selector.dart';
import 'package:flutter/material.dart';

class MainStepTwoBody extends StatelessWidget {
  const MainStepTwoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 4, right: 4, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Let's personalize your list",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            "Tell us a bit more about your plans so we can tailor our packing recommendations. Feel free to skip any questions you don't want to answer or are unsure about.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          const GenderSelector(),
          const PurposeOfTripSelector(),
          const WeatherConditionSelector(),
          const TripLengthSlider(),
          const AccommodationSelector(),
          const ItemsActivitiesSelector(),
        ],
      ),
    );
  }
}
