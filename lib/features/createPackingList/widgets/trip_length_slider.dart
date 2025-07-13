import 'package:flutter/material.dart';

class TripLengthSlider extends StatefulWidget {
  final double tripLength;
  final Function(double) onTripLengthChanged;

  const TripLengthSlider({
    super.key,
    required this.tripLength,
    required this.onTripLengthChanged,
  });

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
    final currentValue = widget.tripLength;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trip length',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Column(
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
                    widget.onTripLengthChanged(newValue);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
