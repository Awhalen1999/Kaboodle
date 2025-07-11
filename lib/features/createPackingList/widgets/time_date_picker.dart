import 'package:kaboodle/features/createPackingList/provider/create_packing_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TravelDatePicker extends StatefulWidget {
  const TravelDatePicker({Key? key}) : super(key: key);

  @override
  State<TravelDatePicker> createState() => _TravelDatePickerState();
}

class _TravelDatePickerState extends State<TravelDatePicker> {
  Future<void> _openCalendar() async {
    final now = DateTime.now();
    final provider = context.read<CreatePackingListProvider>();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: provider.travelDate ?? now,
      firstDate: DateTime(now.year - 10),
      lastDate: DateTime(now.year + 10),
    );
    if (pickedDate != null) {
      provider.updateTravelDate(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CreatePackingListProvider>();
    final dateText = provider.travelDate == null
        ? "Select a date..."
        : "${provider.travelDate!.month}/${provider.travelDate!.day}/${provider.travelDate!.year}";

    return InkWell(
      onTap: _openCalendar,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.surfaceContainer,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text(dateText),
            const Spacer(),
            Icon(
              Icons.calendar_today_rounded,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}
