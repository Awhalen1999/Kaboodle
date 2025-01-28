import 'package:copackr/features/myPackingLists/widgets/my_packing_lists_body.dart';
import 'package:flutter/material.dart';
import 'package:copackr/shared/widgets/custom_app_bar.dart';
import 'package:copackr/shared/widgets/menu_drawer.dart';

class MyPackingListsView extends StatelessWidget {
  const MyPackingListsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My packing lists',
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
      body: const MyPackingListsBody(),
    );
  }
}
