import 'package:copackr/features/dashboard/widgets/dashboard_body.dart';
import 'package:copackr/shared/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: DashboardBody(),
    );
  }
}
