import 'package:copackr/shared/widgets/custom_button.dart';
import 'package:copackr/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginBody extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginBody({super.key});

  void login() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.person,
            size: 80,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          const SizedBox(height: 24),
          Text(
            'C O P A C K R',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 24),
          Text('Login', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 24),
          CustomTextFormField(
            hintText: "",
            label: "email",
            isObscured: false,
            isDigit: false,
            isRequired: true,
            controller: emailController,
            borderRadius: 12,
          ),
          const SizedBox(height: 12),
          CustomTextFormField(
            hintText: "",
            label: "password",
            isObscured: true,
            isDigit: false,
            isRequired: true,
            controller: passwordController,
            borderRadius: 12,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Forgot password?',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          CustomButton(
            buttonText: "Login",
            onPressed: login,
            textColor: Theme.of(context).colorScheme.onSurface,
            isLoading: false,
            borderRadius: 12,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account?',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 14,
                ),
              ),
              TextButton(
                onPressed: () => context.go('/signup'),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
