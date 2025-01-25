import 'package:copackr/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('L O G I N'),
          CustomButton(
            buttonText: "Dashboard",
            onPressed: () => context.go('/dashboard'),
            textColor: Theme.of(context).colorScheme.onSurface,
            isLoading: false,
          )
        ],
      ),
    );
  }
}
