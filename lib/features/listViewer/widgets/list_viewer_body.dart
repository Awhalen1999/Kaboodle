import 'package:copackr/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListViewerBody extends StatelessWidget {
  const ListViewerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('L I S T #'),
          CustomButton(
            buttonText: "My packing lists",
            onPressed: () => context.go('/my-packing-lists'),
            textColor: Theme.of(context).colorScheme.onSurface,
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
