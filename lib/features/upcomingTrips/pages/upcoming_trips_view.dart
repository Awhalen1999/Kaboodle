import 'package:copackr/features/upcomingTrips/widgets/upcoming_trips_body.dart';
import 'package:copackr/shared/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class UpcomingTripsView extends StatelessWidget {
  const UpcomingTripsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(body: UpcomingTripsBody());
  }
}
