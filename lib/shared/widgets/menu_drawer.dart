import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ListTile(
                title: const Text('Upcoming trips'),
                leading: const Icon(Icons.double_arrow_rounded),
                trailing: const Chip(label: Text('3')),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/upcoming-trips');
                },
              ),
              ListTile(
                title: const Text('My packing lists'),
                leading: const Icon(Icons.format_list_bulleted),
                trailing: const Chip(label: Text('7')),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/my-packing-lists');
                },
              ),
              ListTile(
                title: const Text('Calendar'),
                leading: const Icon(Icons.calendar_month_rounded),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/calendar');
                },
              ),
              const Divider(
                color: Colors.grey,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
                child: const Text(
                  "Lists",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                title: const Text('List 1'),
                leading:
                    const Icon(Icons.square_rounded, color: Colors.pinkAccent),
                trailing: const Chip(label: Text('17')),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/list-viewer');
                },
              ),
              ListTile(
                title: const Text('List 2'),
                leading:
                    const Icon(Icons.square_rounded, color: Colors.lightBlue),
                trailing: const Chip(label: Text('9')),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/list-viewer');
                },
              ),
              ListTile(
                title: const Text('List 3'),
                leading: const Icon(Icons.square_rounded, color: Colors.amber),
                trailing: const Chip(label: Text('22')),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/list-viewer');
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
                child: Row(
                  children: [
                    const Text(
                      "Tags",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        // Add functionality to add a new tag
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
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
              const Divider(
                color: Colors.grey,
              ),
              // TODO:  add a profile tile to access settings / profile settings / logout
            ],
          ),
        ),
      ),
    );
  }
}
