import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kaboodle/features/packingProcess/provider/packing_process_provider.dart';
import 'package:kaboodle/features/packingProcess/widgets/widgets.dart';
import 'package:kaboodle/services/data/packing_list_cache.dart';

class PackingProcessView extends StatelessWidget {
  final String listId;

  const PackingProcessView({super.key, required this.listId});

  @override
  Widget build(BuildContext context) {
    final cache = context.read<PackingListCache>();
    final packingProvider = PackingProcessProvider(listId, cache);

    return ChangeNotifierProvider.value(
      value: packingProvider,
      child: Consumer<PackingProcessProvider>(
        builder: (context, provider, _) =>
            PackingProcessScaffold(provider: provider),
      ),
    );
  }
}
