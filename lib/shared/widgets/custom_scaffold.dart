import 'package:flutter/material.dart';
import 'package:copackr/shared/widgets/custom_app_bar.dart';
import 'package:copackr/shared/widgets/menu_drawer.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: const MenuDrawer(),
      body: SafeArea(child: body),
    );
  }
}
