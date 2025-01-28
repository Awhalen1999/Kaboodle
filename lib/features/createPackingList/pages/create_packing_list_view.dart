import 'package:copackr/features/createPackingList/widgets/create_packing_list_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreatePackingListView extends StatelessWidget {
  const CreatePackingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Create Packing List'),
      ),
      body: const CreatePackingListBody(),
    );
  }
}
