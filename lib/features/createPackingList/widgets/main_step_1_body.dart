import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

class MainStepOneBody extends StatelessWidget {
  const MainStepOneBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
                Text(
                  "Title",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: titleController,
                  obscureText: false,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: "Add a title...",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surfaceBright,
                    alignLabelWithHint: true,
                    floatingLabelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
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
                Text(
                  "Description",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: descriptionController,
                  obscureText: false,
                  minLines: 3,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: "Add a description...",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surfaceBright,
                    alignLabelWithHint: true,
                    floatingLabelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
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

            // * MultiSelectContainer

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MultiSelectContainer(
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
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.6),
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
                          color: Colors.red.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.6),
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
                          color: Colors.lightBlue.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Colors.lightBlue.withOpacity(0.6),
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
                          color: Colors.orangeAccent.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Colors.orangeAccent.withOpacity(0.6),
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
                  onChange: (allSelectedItems, selectedItem) {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
