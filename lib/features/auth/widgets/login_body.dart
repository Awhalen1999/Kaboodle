import 'package:copackr/services/auth/auth_service.dart';
import 'package:copackr/shared/widgets/custom_button.dart';
import 'package:copackr/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void login() async {
    final _authService = AuthService();

    try {
      await _authService.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
      if (mounted) {
        context.go('/my-packing-lists');
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

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
