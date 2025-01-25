import 'package:copackr/services/auth/auth_service.dart';
import 'package:copackr/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  void logout(BuildContext context) async {
    final authService = AuthService();
    await authService.signOut();
    // ignore: use_build_context_synchronously
    context.go('/welcome');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('D A S H B O A R D'),
          CustomButton(
            buttonText: "Profile",
            onPressed: () => context.go('/profile'),
            textColor: Theme.of(context).colorScheme.onSurface,
            isLoading: false,
          ),
          const SizedBox(height: 16),
          CustomButton(
            buttonText: "Logout (Back to Welcome)",
            onPressed: () => logout(context),
            textColor: Theme.of(context).colorScheme.onSurface,
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
