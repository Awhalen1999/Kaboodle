import 'package:copackr/features/profile/widgets/profile_body.dart';
import 'package:copackr/shared/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(body: ProfileBody());
  }
}
