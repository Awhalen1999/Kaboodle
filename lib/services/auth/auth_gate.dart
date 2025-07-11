import 'package:kaboodle/features/auth/pages/welcome_view.dart';
import 'package:kaboodle/features/myPackingLists/pages/my_packing_lists_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MyPackingListsView();
          } else {
            return const WelcomeView();
          }
        },
      ),
    );
  }
}
