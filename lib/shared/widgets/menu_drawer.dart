import 'package:copackr/shared/widgets/custom_chip.dart';
import 'package:copackr/shared/widgets/packing_list_tile.dart';
import 'package:copackr/services/data/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({
    super.key,
  });

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  List<Map<String, dynamic>> _packingLists = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadPackingLists();
  }

  Future<void> _loadPackingLists() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final firestoreService = FirestoreService();
      final lists = await firestoreService.getUserPackingLists();

      setState(() {
        _packingLists = lists;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
      print('Error loading packing lists: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ListTile(
                title: const Text('My packing lists'),
                leading: const Icon(Icons.format_list_bulleted),
                trailing: CustomChip(label: _packingLists.length.toString()),
                onTap: () {
                  Navigator.pop(context);
                  context.push('/my-packing-lists');
                },
              ),
              ListTile(
                title: const Text('Upcoming trips'),
                leading: const Icon(Icons.double_arrow_rounded),
                trailing: const CustomChip(label: "2"),
                onTap: () {
                  Navigator.pop(context);
                  context.push('/upcoming-trips');
                },
              ),
              const Divider(
                color: Colors.grey,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    const Text(
                      "Lists",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "(${_packingLists.length})",
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.add_rounded),
                      padding: EdgeInsets.all(
                        0,
                      ),
                      constraints: const BoxConstraints(),
                      style: const ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        context.push('/create-packing-list');
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _buildListsContent(),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.only(top: 8.0),
                child: ListTile(
                  visualDensity: const VisualDensity(
                    horizontal: -2,
                    vertical: -4,
                  ),
                  title: Text(
                    user?.email ?? 'Profile',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                  subtitle: const Text('View and edit'),
                  leading: CircleAvatar(
                    child: const Icon(Icons.person),
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {
                    Navigator.pop(context);
                    context.push('/profile');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListsContent() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Error loading lists',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              _error!,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadPackingLists,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_packingLists.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 48,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              'No lists saved',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Create your first packing list to get started',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
                context.push('/create-packing-list');
              },
              icon: const Icon(Icons.add),
              label: const Text('Create List'),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: _packingLists.map((listData) {
          final listName = listData['title'] as String? ?? 'Untitled List';
          final listColorValue =
              listData['listColor'] as int? ?? Colors.grey.value;
          final listColor = Color(listColorValue);
          final items = listData['items'] as List? ?? [];
          final itemCount = items.length;

          return PackingListTile(
            listName: listName,
            listColor: listColor,
            itemCount: itemCount,
            onTap: () {
              Navigator.pop(context);
              // TODO: Navigate to list viewer with the specific list ID
              context.push('/list-viewer');
            },
          );
        }).toList(),
      ),
    );
  }
}
