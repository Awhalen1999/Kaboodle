import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgButtonRow extends StatelessWidget {
  final String svgAsset;
  final String label;
  final VoidCallback? onPressed;

  // Indicates whether this button is selected and should be highlighted.
  final bool isSelected;

  const SvgButtonRow({
    Key? key,
    required this.svgAsset,
    required this.label,
    this.onPressed,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // change the background color based on the selection state
    final bgColor = isSelected
        ? Theme.of(context).colorScheme.primaryContainer
        : Theme.of(context).colorScheme.surface;

    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      icon: SvgPicture.asset(
        svgAsset,
        height: 24,
        width: 24,
      ),
      label: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
