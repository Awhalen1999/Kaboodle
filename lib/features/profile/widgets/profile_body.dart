import 'package:copackr/services/auth/auth_service.dart';
import 'package:copackr/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  // Use the new signout method, passing context
  Future<void> _logout(BuildContext context) async {
    await AuthService().signout(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('P R O F I L E'),
          CustomButton(
            buttonText: "My packing lists",
            onPressed: () => context.go('/my-packing-lists'),
            textColor: Theme.of(context).colorScheme.onSurface,
            isLoading: false,
          ),
          const SizedBox(height: 24),
          CustomButton(
            buttonText: "Logout",
            onPressed: () => _logout(context),
            textColor: Theme.of(context).colorScheme.onSurface,
            isLoading: false,
          )
        ],
      ),
    );
  }
}
