import 'package:flutter/material.dart';

class MainStepOneBody extends StatelessWidget {
  const MainStepOneBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.surfaceBright,
              labelText: 'List name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), // Rounded corners
                borderSide: BorderSide.none, // No visible border
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .primary, // Optional: Change color on focus
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.surfaceBright,
              labelText: 'Description',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), // Rounded corners
                borderSide: BorderSide.none, // No visible border
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .primary, // Optional: Change color on focus
                ),
              ),
            ),
            keyboardType: TextInputType.multiline, // Allows multiple lines
            maxLines: 5, // Specifies the maximum number of lines
            minLines: 1,
          ),
        ],
      ),
    );
  }
}
