import 'package:flutter/material.dart';
import 'package:copackr/shared/widgets/custom_chip.dart';

class PackingListTile extends StatelessWidget {
  final String listName;
  final Color listColor;
  final int itemCount;
  final VoidCallback? onTap;

  const PackingListTile({
    Key? key,
    required this.listName,
    required this.listColor,
    required this.itemCount,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        listName,
        style: Theme.of(context).textTheme.bodyLarge,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      leading: Icon(
        Icons.square_rounded,
        color: listColor,
        size: 24,
      ),
      trailing: CustomChip(
        label: itemCount.toString(),
      ),
      onTap: onTap,
    );
  }
}
