import 'package:copackr/features/createPackingList/provider/create_packing_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:provider/provider.dart';

class TagOptions extends StatelessWidget {
  const TagOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CreatePackingListProvider>();

    return MultiSelectContainer(
      prefix: MultiSelectPrefix(
        selectedPrefix: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.circle,
            color: Colors.grey[800],
            size: 8,
          ),
        ),
        enabledPrefix: const Padding(
          padding: EdgeInsets.only(right: 5),
          child: Icon(
            Icons.circle,
            color: Colors.white,
            size: 8,
          ),
        ),
      ),
      items: [
        MultiSelectCard(
          label: 'Business',
          value: 'business',
          decorations: MultiSelectItemDecorations(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.25),
              borderRadius: BorderRadius.circular(25),
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.7),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          textStyles: MultiSelectItemTextStyles(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            selectedTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        MultiSelectCard(
          label: 'Vacation',
          value: 'vacation',
          decorations: MultiSelectItemDecorations(
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.25),
              borderRadius: BorderRadius.circular(25),
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.red.withOpacity(0.7),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          textStyles: MultiSelectItemTextStyles(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            selectedTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        MultiSelectCard(
          label: 'Personal',
          value: 'personal',
          decorations: MultiSelectItemDecorations(
            decoration: BoxDecoration(
              color: Colors.lightBlue.withOpacity(0.25),
              borderRadius: BorderRadius.circular(25),
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.lightBlue.withOpacity(0.7),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          textStyles: MultiSelectItemTextStyles(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            selectedTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        MultiSelectCard(
          label: 'Family',
          value: 'family',
          decorations: MultiSelectItemDecorations(
            decoration: BoxDecoration(
              color: Colors.orangeAccent.withOpacity(0.25),
              borderRadius: BorderRadius.circular(25),
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.orangeAccent.withOpacity(0.7),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          textStyles: MultiSelectItemTextStyles(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            selectedTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        MultiSelectCard(
          label: 'Adventure',
          value: 'adventure',
          decorations: MultiSelectItemDecorations(
            decoration: BoxDecoration(
              color: Colors.lightGreen.withOpacity(0.25),
              borderRadius: BorderRadius.circular(25),
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.lightGreen.withOpacity(0.7),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          textStyles: MultiSelectItemTextStyles(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            selectedTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        MultiSelectCard(
          label: 'Health',
          value: 'health',
          decorations: MultiSelectItemDecorations(
            decoration: BoxDecoration(
              color: Colors.purpleAccent.withOpacity(0.25),
              borderRadius: BorderRadius.circular(25),
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.purpleAccent.withOpacity(0.7),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          textStyles: MultiSelectItemTextStyles(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            selectedTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
      onChange: (allSelectedItems, selectedItem) {
        // This updates the provider with the newly selected items
        provider.updateTags(allSelectedItems);
      },
    );
  }
}
