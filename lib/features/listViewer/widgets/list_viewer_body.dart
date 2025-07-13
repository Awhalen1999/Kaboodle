import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kaboodle/services/data/packing_list_cache.dart';

class ListViewerBody extends StatelessWidget {
  final String listId;
  const ListViewerBody({super.key, required this.listId});

  @override
  Widget build(BuildContext context) {
    return Consumer<PackingListCache>(
      builder: (context, cache, child) {
        if (cache.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final listData = cache.getListById(listId);
        if (listData == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.inbox_outlined,
                  size: 64,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(height: 16),
                Text(
                  'List not found',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'The packing list you\'re looking for doesn\'t exist or has been deleted.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        final title = listData['title'] as String? ?? 'Untitled List';

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'List ID: $listId',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Title: $title',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
