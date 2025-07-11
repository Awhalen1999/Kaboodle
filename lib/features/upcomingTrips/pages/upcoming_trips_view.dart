import 'package:flutter/material.dart';
import 'package:kaboodle/features/upcomingTrips/widgets/upcoming_trips_body.dart';
import 'package:kaboodle/shared/widgets/custom_app_bar.dart';
import 'package:kaboodle/shared/widgets/menu_drawer.dart';

class UpcomingTripsView extends StatelessWidget {
  const UpcomingTripsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Upcoming Trips',
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
      body: const UpcomingTripsBody(),
    );
  }
}
