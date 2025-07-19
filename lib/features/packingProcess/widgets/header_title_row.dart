import 'package:flutter/material.dart';
import 'package:kaboodle/features/packingProcess/provider/packing_process_provider.dart';
import 'package:kaboodle/features/packingProcess/widgets/header_menu.dart';

class HeaderTitleRow extends StatelessWidget {
  final PackingProcessProvider provider;

  const HeaderTitleRow({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final listTitle = provider.listData?['title'] ?? 'Packing List';

    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(
                Icons.checklist_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  listTitle,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        HeaderMenu(provider: provider),
      ],
    );
  }
}
