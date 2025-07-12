import 'package:kaboodle/features/editPackingList/widgets/edit_packing_list_body.dart';
import 'package:flutter/material.dart';
import 'package:kaboodle/shared/widgets/custom_app_bar.dart';
import 'package:kaboodle/shared/widgets/menu_drawer.dart';

class EditPackingListView extends StatelessWidget {
  final String listId;
  const EditPackingListView({super.key, required this.listId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit packing list',
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
      body: EditPackingListBody(listId: listId),
    );
  }
}
