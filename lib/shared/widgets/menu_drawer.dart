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
              const Divider(),
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
                child: const Text(
                  "Lists",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                title: const Text('List 1'),
                leading: const Icon(Icons.square_rounded, color: Colors.red),
                trailing: const Chip(label: Text('17')),
                onTap: () {
                  Navigator.pop(context);
                  context.go('/list-viewer');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
