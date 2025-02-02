import 'package:flutter/material.dart';

class TripLengthSlider extends StatefulWidget {
  const TripLengthSlider({Key? key}) : super(key: key);

  @override
  State<TripLengthSlider> createState() => _TripLengthSliderState();
}

class _TripLengthSliderState extends State<TripLengthSlider> {
  double _value = 1.0;

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
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Trip length",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              _formatValue(_value),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Slider(
            value: _value,
            min: 0.0,
            max: 4.0,
            divisions: 8,
            onChanged: (newValue) {
              setState(() => _value = newValue);
            },
          ),
        ],
      ),
    );
  }
}
