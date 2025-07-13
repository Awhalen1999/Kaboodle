import 'package:kaboodle/features/auth/pages/login_view.dart';
import 'package:kaboodle/features/auth/pages/signup_view.dart';
import 'package:kaboodle/features/auth/pages/welcome_view.dart';
import 'package:kaboodle/features/createPackingList/pages/create_packing_list_view.dart';
import 'package:kaboodle/features/listViewer/pages/list_viewer_view.dart';
import 'package:kaboodle/features/myPackingLists/pages/my_packing_lists_view.dart';
import 'package:kaboodle/features/profile/pages/profile_view.dart';
import 'package:kaboodle/features/upcomingTrips/pages/upcoming_trips_view.dart';
import 'package:kaboodle/features/editPackingList/pages/edit_packing_list_view.dart';
import 'package:go_router/go_router.dart';
import 'package:kaboodle/services/auth/auth_gate.dart';

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
      path: '/list-viewer/:listId',
      builder: (context, state) => ListViewerView(
        listId: state.pathParameters['listId']!,
      ),
    ),
    GoRoute(
      path: '/create-packing-list',
      builder: (context, state) => CreatePackingListView(),
    ),
    GoRoute(
      path: '/edit-packing-list/:listId',
      builder: (context, state) => EditPackingListView(
        listId: state.pathParameters['listId']!,
      ),
    ),
  ],
);
