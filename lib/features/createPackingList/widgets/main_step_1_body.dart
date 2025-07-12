import 'package:kaboodle/features/createPackingList/widgets/color_picker.dart';
import 'package:kaboodle/features/createPackingList/widgets/description_field.dart';
import 'package:kaboodle/features/createPackingList/widgets/time_date_picker.dart';
import 'package:kaboodle/features/createPackingList/widgets/title_field.dart';
import 'package:flutter/material.dart';

class MainStepOneBody extends StatelessWidget {
  const MainStepOneBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 4, right: 4, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Let's get started!",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            "Just a few quick details to set up your list and keep your lists organized.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          TitleField(),
          DescriptionField(),
          ColorPicker(),
          TravelDatePicker(),
        ],
      ),
    );
  }
}
