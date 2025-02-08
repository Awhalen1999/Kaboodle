import 'package:flutter/material.dart';

class CustomCheckboxListTile extends StatelessWidget {
  final IconData iconData;
  final String text;
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const CustomCheckboxListTile({
    Key? key,
    required this.iconData,
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
        contentPadding: const EdgeInsets.only(left: 12),
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
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(4),
              child: Icon(
                iconData,
                size: 22,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ],
        ),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
