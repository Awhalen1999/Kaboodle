import 'package:copackr/services/auth/auth_service.dart';
import 'package:copackr/shared/widgets/custom_button.dart';
import 'package:copackr/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> _signup() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      if (!mounted) return;
      Fluttertoast.showToast(
        msg: 'Passwords do not match',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
      return;
    }

    try {
      await AuthService().signup(
        email: _emailController.text,
        password: _passwordController.text,
        context: context,
      );
    } catch (e) {
      if (!mounted) return;
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
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
            Icons.person_add,
            size: 80,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          const SizedBox(height: 24),
          Text(
            'Kaboodle',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 24),
          Text(
            'Register Account',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 24),
          CustomTextFormField(
            hintText: 'Email',
            label: 'Email Address',
            isObscured: false,
            isDigit: false,
            isRequired: true,
            controller: _emailController,
            borderRadius: 12,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            hintText: 'Password',
            label: 'Password',
            isObscured: true,
            isDigit: false,
            isRequired: true,
            controller: _passwordController,
            borderRadius: 12,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            hintText: 'Confirm Password',
            label: 'Confirm Password',
            isObscured: true,
            isDigit: false,
            isRequired: true,
            controller: _confirmPasswordController,
            borderRadius: 12,
            textInputAction: TextInputAction.done,
            onEditingComplete: _signup,
          ),
          const SizedBox(height: 30),
          CustomButton(
            buttonText: "Sign Up",
            onPressed: _signup,
            textColor: Theme.of(context).colorScheme.onSurface,
            isLoading: false,
            borderRadius: 12,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already Have Account?',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 14,
                ),
              ),
              TextButton(
                onPressed: () => context.push('/login'),
                child: Text(
                  'Log In',
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
