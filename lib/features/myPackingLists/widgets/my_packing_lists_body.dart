import 'package:copackr/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyPackingListsBody extends StatelessWidget {
  const MyPackingListsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('M Y P A C K I N G L I S T S'),
          CustomButton(
            buttonText: "Dashboard",
            onPressed: () => context.go('/dashboard'),
            textColor: Theme.of(context).colorScheme.onSurface,
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
