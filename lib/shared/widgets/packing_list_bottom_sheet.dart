import 'package:flutter/material.dart';

class PackingListSettingsSheet extends StatelessWidget {
  final String title;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const PackingListSettingsSheet({
    Key? key,
    required this.title,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit'),
              onTap: onEdit,
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete'),
              textColor: Theme.of(context).colorScheme.error,
              iconColor: Theme.of(context).colorScheme.error,
              onTap: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
