import 'package:copackr/shared/widgets/custom_chip.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    super.key,
  });

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
                trailing: const CustomChip(),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/my-packing-lists');
                },
              ),
              ListTile(
                title: const Text('Upcoming trips'),
                leading: const Icon(Icons.double_arrow_rounded),
                trailing: const CustomChip(),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/upcoming-trips');
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
                      "(5)",
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
                        context.go('/create-packing-list');
                      },
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text('List 1'),
                leading:
                    const Icon(Icons.square_rounded, color: Colors.pinkAccent),
                trailing: const CustomChip(),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/list-viewer');
                },
              ),
              ListTile(
                title: const Text('List 2'),
                leading:
                    const Icon(Icons.square_rounded, color: Colors.lightBlue),
                trailing: const CustomChip(),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/list-viewer');
                },
              ),
              ListTile(
                title: const Text('List 3'),
                leading: const Icon(Icons.square_rounded, color: Colors.amber),
                trailing: const CustomChip(),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/list-viewer');
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
                      "Tags",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "(9)",
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
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
                child: Wrap(
                  spacing: 8.0,
                  children: [
                    Chip(
                      label: const Text(
                        'Work',
                        style: TextStyle(fontSize: 12),
                      ),
                      backgroundColor: Colors.lightBlue,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                    ),
                    Chip(
                      label: const Text(
                        'Personal',
                        style: TextStyle(fontSize: 12),
                      ),
                      backgroundColor: Colors.green.shade100,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                    ),
                    Chip(
                      label: const Text(
                        'Urgent',
                        style: TextStyle(fontSize: 12),
                      ),
                      backgroundColor: Colors.red.shade100,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                    ),
                    Chip(
                      label: const Text(
                        'Travel',
                        style: TextStyle(fontSize: 12),
                      ),
                      backgroundColor: Colors.orange.shade100,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
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
                    context.go('/profile');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
