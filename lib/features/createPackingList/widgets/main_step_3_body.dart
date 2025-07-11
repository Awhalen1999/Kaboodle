import 'package:kaboodle/features/createPackingList/widgets/packing_list_builder.dart';
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
            "Almost Ready to Go!",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            "Check out our recommendations and choose the items you want to pack.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          const PackingListBuilder(),
        ],
      ),
    );
  }
}
