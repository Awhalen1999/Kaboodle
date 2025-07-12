import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kaboodle/services/data/packing_list_cache.dart';
import 'package:kaboodle/shared/widgets/trip_details_overview.dart';
import 'package:kaboodle/shared/widgets/trip_requirements_overview.dart';
import 'package:kaboodle/shared/widgets/trip_items_overview.dart';
import 'package:kaboodle/core/constants/app_icons.dart';
import 'package:kaboodle/core/utils/date_formatter.dart';

class EditPackingListBody extends StatefulWidget {
  final String listId;
  const EditPackingListBody({super.key, required this.listId});

  @override
  State<EditPackingListBody> createState() => _EditPackingListBodyState();
}

class _EditPackingListBodyState extends State<EditPackingListBody> {
  @override
  void initState() {
    super.initState();
    // Ensure cache is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PackingListCache>().getLists();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PackingListCache>(
      builder: (context, cache, child) {
        if (cache.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (cache.error != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(height: 16),
                Text(
                  'Error loading packing list',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  cache.error!,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        final listData = cache.getListById(widget.listId);
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
                  'Packing list not found',
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

        // Extract data from the list
        final title = listData['title'] ?? 'Untitled';
        final description = listData['description'] ?? 'No description';
        final date = DateFormatter.formatDate(listData['travelDate']);
        final purpose = listData['tripPurpose'] ?? 'NA';
        final weather = listData['weatherCondition'] ?? 'NA';
        final tripLength =
            DateFormatter.formatTripLength(listData['tripLength'] ?? 0.0);
        final accommodation = listData['accommodation'] ?? 'NA';
        final itemsActivities =
            List<String>.from(listData['selectedSections'] ?? []);

        // Extract items from the list data
        final items = <TripItemOverviewData>[];
        final itemsList = listData['items'] as List? ?? [];
        for (final itemData in itemsList) {
          final item = itemData as Map<String, dynamic>;
          final iconName = item['iconName'] as String? ?? 'checkroom_rounded';
          items.add(TripItemOverviewData(
            label: item['label'] as String? ?? 'Unknown Item',
            quantity: item['customQuantity'] as int? ??
                item['calculatedQuantity'] as int? ??
                item['baseQuantity'] as int? ??
                1,
            note: item['note'] as String?,
            icon: getIconByName(iconName),
          ));
        }

        return Padding(
          padding: const EdgeInsets.only(left: 4, right: 4, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Edit packing list details",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                "Edit your packing list details. You can add, remove, and edit items.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              TripDetailsOverview(
                title: title,
                description: description,
                date: date,
              ),
              TripRequirementsOverview(
                purpose: purpose,
                weather: weather,
                tripLength: tripLength,
                accommodation: accommodation,
                itemsActivities: itemsActivities,
              ),
              TripItemsOverview(
                items: items,
              ),
            ],
          ),
        );
      },
    );
  }
}
