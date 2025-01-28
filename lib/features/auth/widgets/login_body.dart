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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      await AuthService().signin(
        email: _emailController.text,
        password: _passwordController.text,
        context: context,
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          Text(
            'Login',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 24),
          CustomTextFormField(
            hintText: '',
            label: 'Email',
            isObscured: false,
            isDigit: false,
            isRequired: true,
            controller: _emailController,
            borderRadius: 12,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            hintText: '',
            label: 'Password',
            isObscured: true,
            isDigit: false,
            isRequired: true,
            controller: _passwordController,
            borderRadius: 12,
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot password?',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 30),
          CustomButton(
            buttonText: "Login",
            onPressed: _login,
            textColor: Theme.of(context).colorScheme.onSurface,
            isLoading: false,
            borderRadius: 12,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
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
