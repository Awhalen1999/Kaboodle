import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copackr/services/data/packing_list_cache.dart';
import 'package:copackr/core/constants/app_constants.dart';
import 'package:go_router/go_router.dart';
import 'package:copackr/shared/widgets/custom_item_chip.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class MyPackingListsBody extends StatefulWidget {
  const MyPackingListsBody({super.key});

  @override
  State<MyPackingListsBody> createState() => _MyPackingListsBodyState();
}

class _MyPackingListsBodyState extends State<MyPackingListsBody> {
  final _refreshController = StreamController<SwipeRefreshState>.broadcast();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PackingListCache>().getLists();
    });
  }

  @override
  void dispose() {
    _refreshController.close();
    super.dispose();
  }

  Future<void> _refresh() async {
    await context.read<PackingListCache>().refresh();
    _refreshController.sink.add(SwipeRefreshState.hidden);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PackingListCache>(
      builder: (context, cache, child) {
        Widget listContent;
        if (cache.isLoading) {
          listContent = const Center(child: CircularProgressIndicator());
        } else if (cache.error != null) {
          listContent = Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline,
                    size: 48, color: Theme.of(context).colorScheme.error),
                const SizedBox(height: 16),
                Text('Error loading lists',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(cache.error!,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => cache.refresh(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        } else if (cache.lists.isEmpty) {
          listContent = Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.inbox_outlined,
                    size: 48,
                    color: Theme.of(context).colorScheme.onSurfaceVariant),
                const SizedBox(height: 16),
                Text('No lists saved',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text('Create your first packing list to get started',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center),
              ],
            ),
          );
        } else {
          listContent = SwipeRefresh.builder(
            stateStream: _refreshController.stream,
            onRefresh: _refresh,
            itemCount: cache.lists.length,
            itemBuilder: (context, index) {
              final listData = cache.lists[index];
              final listName = listData['title'] as String? ?? 'Untitled List';
              final description = listData['description'] as String? ?? '';
              final listColorValue =
                  listData['listColor'] as int? ?? Colors.grey.value;
              final listColor = Color(listColorValue);
              final selectedSections =
                  (listData['selectedSections'] as List?)?.cast<String>() ?? [];

              return GestureDetector(
                onTap: () {
                  // TODO: Pass the list ID to the viewer
                  context.push('/list-viewer');
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceBright,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  constraints: const BoxConstraints(minHeight: 80),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              right: 16, left: 4, top: 8, bottom: 8),
                          width: 8,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: listColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                listName,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              if (description.isNotEmpty) ...[
                                const SizedBox(height: 2),
                                Text(
                                  description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.color
                                            ?.withOpacity(0.7),
                                      ),
                                ),
                              ],
                              if (selectedSections.isNotEmpty) ...[
                                const SizedBox(height: 10),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: selectedSections.map((sectionId) {
                                    final details = activityDetails[sectionId];
                                    if (details == null)
                                      return const SizedBox.shrink();
                                    return CustomItemChip(
                                      label: details['label'],
                                      color: details['color'],
                                    );
                                  }).toList(),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          );
        }

        return Stack(
          children: [
            listContent,
            Positioned(
              bottom: 36,
              right: 20,
              child: FloatingActionButton(
                onPressed: () => context.push('/create-packing-list'),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.add, size: 32),
              ),
            ),
          ],
        );
      },
    );
  }
}
