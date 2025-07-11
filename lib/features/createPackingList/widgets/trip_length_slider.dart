import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kaboodle/features/createPackingList/provider/create_packing_list_provider.dart';

class TripLengthSlider extends StatefulWidget {
  const TripLengthSlider({Key? key}) : super(key: key);

  @override
  State<TripLengthSlider> createState() => _TripLengthSliderState();
}

class _TripLengthSliderState extends State<TripLengthSlider> {
  String _formatValue(double value) {
    if (value == 0.0) {
      return "1-3 days";
    } else if (value == 0.5) {
      return "3-7 days";
    } else if (value == 1.0) {
      return "1 week";
    } else if (value == 4.0) {
      return "4+ weeks";
    } else {
      return "${value.toStringAsFixed(1)} weeks";
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CreatePackingListProvider>();
    final currentValue = provider.tripLength;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Text(
            _formatValue(currentValue),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        Slider(
          value: currentValue,
          min: 0.0,
          max: 4.0,
          divisions: 8,
          onChanged: (newValue) {
            provider.updateTripLength(newValue);
          },
        ),
      ],
    );
  }
}
