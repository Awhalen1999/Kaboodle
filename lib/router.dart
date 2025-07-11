import 'package:kaboodle/features/auth/pages/login_view.dart';
import 'package:kaboodle/features/auth/pages/signup_view.dart';
import 'package:kaboodle/features/auth/pages/welcome_view.dart';
import 'package:kaboodle/features/createPackingList/pages/create_packing_list_view.dart';
import 'package:kaboodle/features/listViewer/pages/list_viewer_view.dart';
import 'package:kaboodle/features/myPackingLists/pages/my_packing_lists_view.dart';
import 'package:kaboodle/features/profile/pages/profile_view.dart';
import 'package:kaboodle/features/upcomingTrips/pages/upcoming_trips_view.dart';
import 'package:kaboodle/services/auth/auth_gate.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => AuthGate(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => WelcomeView(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignupView(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => ProfileView(),
    ),
    GoRoute(
      path: '/upcoming-trips',
      builder: (context, state) => UpcomingTripsView(),
    ),
    GoRoute(
      path: '/my-packing-lists',
      builder: (context, state) => MyPackingListsView(),
    ),
    GoRoute(
      path: '/list-viewer',
      builder: (context, state) => ListViewerView(),
    ),
    GoRoute(
      path: '/create-packing-list',
      builder: (context, state) => CreatePackingListView(),
    ),
  ],
);
