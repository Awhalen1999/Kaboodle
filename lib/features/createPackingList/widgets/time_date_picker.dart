import 'package:flutter/material.dart';

class TravelDatePicker extends StatefulWidget {
  const TravelDatePicker({Key? key}) : super(key: key);

  @override
  State<TravelDatePicker> createState() => _TravelDatePickerState();
}

class _TravelDatePickerState extends State<TravelDatePicker> {
  DateTime? _selectedDate;

  Future<void> _openCalendar() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: DateTime(now.year - 10),
      lastDate: DateTime(now.year + 10),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceBright,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Select a travel date",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Text(
                  "Not sure yet",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: _openCalendar,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 56,
              child: Row(
                children: [
                  Text(
                    _selectedDate == null
                        ? "Select a date..."
                        : "${_selectedDate!.month}/${_selectedDate!.day}/${_selectedDate!.year}",
                  ),
                  const Spacer(),
                  Icon(
                    Icons.calendar_today_rounded,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
