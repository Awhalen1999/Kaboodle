import 'package:copackr/features/createPackingList/widgets/packing_list_builder.dart';
import 'package:flutter/material.dart';

class MainStepThreeBody extends StatelessWidget {
  const MainStepThreeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
            "Tell us a bit more about your plans so we can tailor our recommendations.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          const PackingListBuilder(),
        ],
      ),
    );
  }
}
