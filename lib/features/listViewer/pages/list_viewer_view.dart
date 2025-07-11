import 'package:kaboodle/features/listViewer/widgets/list_viewer_body.dart';
import 'package:flutter/material.dart';
import 'package:kaboodle/shared/widgets/custom_app_bar.dart';
import 'package:kaboodle/shared/widgets/menu_drawer.dart';

class ListViewerView extends StatelessWidget {
  const ListViewerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My lists',
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
      body: const ListViewerBody(),
    );
  }
}
