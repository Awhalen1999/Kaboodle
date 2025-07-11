import 'package:kaboodle/features/profile/widgets/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:kaboodle/shared/widgets/custom_app_bar.dart';
import 'package:kaboodle/shared/widgets/menu_drawer.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: const MenuDrawer(),
      body: const ProfileBody(),
    );
  }
}
