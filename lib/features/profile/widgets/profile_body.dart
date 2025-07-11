import 'package:kaboodle/services/auth/auth_service.dart';
import 'package:kaboodle/services/data/firestore.dart';
import 'package:kaboodle/shared/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  // Use the new signout method, passing context
  Future<void> _logout(BuildContext context) async {
    await AuthService().signout(context: context);
  }

  void _getUserInfo() {
    final User? user = AuthService().getCurrentUser();
    if (user != null) {
      debugPrint('--- CURRENT USER INFO ---');
      debugPrint('User ID: ${user.uid}');
      debugPrint('Email: ${user.email}');
      debugPrint('Display Name: ${user.displayName}');
      debugPrint('Photo URL: ${user.photoURL}');
      debugPrint('Email Verified: ${user.emailVerified}');
      debugPrint('--- END ---');
    } else {
      debugPrint('--- No user is currently signed in. ---');
    }
  }

  Future<void> _testFirestoreConnection() async {
    try {
      debugPrint('🔍 Testing Firestore connection...');
      final firestoreService = FirestoreService();
      final isConnected = await firestoreService.testConnection();

      if (isConnected) {
        debugPrint('✅ Firestore connection test PASSED');
      } else {
        debugPrint('❌ Firestore connection test FAILED');
      }
    } catch (e) {
      debugPrint('❌ Firestore test error: $e');
    }
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
            onPressed: () => context.push('/my-packing-lists'),
            textColor: Theme.of(context).colorScheme.onSurface,
            isLoading: false,
          ),
          const SizedBox(height: 24),
          CustomButton(
            buttonText: "Get User Info (Test)",
            onPressed: _getUserInfo,
            textColor: Theme.of(context).colorScheme.onSurface,
            isLoading: false,
          ),
          const SizedBox(height: 24),
          CustomButton(
            buttonText: "Test Firestore Connection",
            onPressed: _testFirestoreConnection,
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
