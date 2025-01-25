import 'package:copackr/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('P R O F I L E'),
          CustomButton(
            buttonText: "Dashboard",
            onPressed: () => context.go('/dashboard'),
            textColor: Theme.of(context).colorScheme.onSurface,
            isLoading: false,
          ),
          const SizedBox(height: 16),
          CustomButton(
            buttonText: "Logout (Back to Welcome)",
            onPressed: () => context.go('/'),
            textColor: Theme.of(context).colorScheme.onSurface,
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
