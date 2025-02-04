import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgCheckboxListTile extends StatelessWidget {
  final String svgAsset;
  final String text;
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const CustomSvgCheckboxListTile({
    Key? key,
    required this.svgAsset,
    required this.text,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.surfaceContainer,
        ),
      ),
      child: CheckboxListTile(
        contentPadding: const EdgeInsets.only(left: 12, right: 12),
        visualDensity: VisualDensity.compact,
        checkboxScaleFactor: 1.2,
        checkboxShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        side: BorderSide(
          color: Theme.of(context).colorScheme.surfaceContainer,
          width: 1.4,
        ),
        title: Row(
          children: [
            SvgPicture.asset(
              svgAsset,
              height: 35,
              width: 35,
            ),
            const SizedBox(width: 12),
            Text(text),
          ],
        ),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
