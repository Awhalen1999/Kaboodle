import 'package:kaboodle/features/listViewer/widgets/list_viewer_body.dart';
import 'package:flutter/material.dart';

class ListViewerView extends StatelessWidget {
  final String listId;
  const ListViewerView({super.key, required this.listId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 4,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('View List'),
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
                  child: ListViewerBody(listId: listId),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
