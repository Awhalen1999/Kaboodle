import 'package:kaboodle/features/editPackingList/widgets/edit_packing_list_body.dart';
import 'package:flutter/material.dart';
import 'package:kaboodle/shared/widgets/custom_button.dart';

class EditPackingListView extends StatelessWidget {
  final String listId;
  const EditPackingListView({super.key, required this.listId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 4,
        // back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Edit packing list'),
        // close button
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.close_rounded),
              iconSize: 28,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: EditPackingListBody(listId: listId),
                ),
              ),
              CustomButton(
                buttonText: 'Save',
                onPressed: () {},
                textColor: Theme.of(context).colorScheme.onPrimary,
                buttonColor: Theme.of(context).colorScheme.primary,
                isLoading: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
