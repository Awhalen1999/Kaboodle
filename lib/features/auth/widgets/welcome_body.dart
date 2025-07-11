import 'package:kaboodle/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('W E L C O M E'),
          CustomButton(
            buttonText: "Sign Up",
            onPressed: () => context.push('/signup'),
            textColor: Theme.of(context).colorScheme.onSurface,
            isLoading: false,
          ),
          const SizedBox(height: 16),
          CustomButton(
            buttonText: "Login",
            onPressed: () => context.push('/login'),
            textColor: Theme.of(context).colorScheme.onSurface,
            isLoading: false,
          )
        ],
      ),
    );
  }
}
