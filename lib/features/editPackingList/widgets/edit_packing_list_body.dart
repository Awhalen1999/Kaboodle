import 'package:kaboodle/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditPackingListBody extends StatelessWidget {
  final String listId;
  const EditPackingListBody({super.key, required this.listId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Edit packing list'),
          Text('List ID: $listId'),
          CustomButton(
            buttonText: "Save",
            onPressed: () => context.push('/my-packing-lists'),
            textColor: Theme.of(context).colorScheme.onSurface,
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
