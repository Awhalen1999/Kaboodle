import 'package:copackr/firebase_options.dart';
import 'package:copackr/router.dart';
import 'package:copackr/theme/dark_mode.dart';
import 'package:copackr/theme/light_mode.dart';
import 'package:copackr/services/data/packing_list_cache.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/createPackingList/provider/create_packing_list_provider.dart';
import 'features/createPackingList/provider/custom_items_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CreatePackingListProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CustomItemsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PackingListCache(),
        ),
        // more providers
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      // Refresh cache when app resumes
      final cache = context.read<PackingListCache>();
      if (cache.hasLoaded) {
        cache.refresh();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
