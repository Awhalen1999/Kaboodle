import 'package:flutter/material.dart';

class EditItemsModal extends StatefulWidget {
  final String label;
  final int initialQuantity;
  final String initialNote;
  final void Function(int?, String) onSave; // One-parameter callback

  const EditItemsModal({
    Key? key,
    required this.label,
    required this.initialQuantity,
    this.initialNote = '',
    required this.onSave,
  }) : super(key: key);

  @override
  State<EditItemsModal> createState() => _EditItemsModalState();
}

class _EditItemsModalState extends State<EditItemsModal> {
  late double _quantity;
  late TextEditingController _noteController;
  late int _originalQuantity;

  @override
  void initState() {
    super.initState();
    _originalQuantity = widget.initialQuantity;
    _quantity = widget.initialQuantity.toDouble();
    _noteController = TextEditingController(text: widget.initialNote);
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Edit ${widget.label}",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.close_rounded,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                style: IconButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.surfaceContainer,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Quantity Section
          Text(
            "Quantity",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text("Quantity: "),
              Expanded(
                child: Slider(
                  value: _quantity,
                  min: 1,
                  max: 20,
                  divisions: 19,
                  label: _quantity.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      _quantity = value;
                    });
                  },
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _quantity.round().toString(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Note Section
          Text(
            "Note (Optional)",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _noteController,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: "Add a note...",
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
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Cancel",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final newQuantity = _quantity.round();
                    final newNote = _noteController.text;

                    // Only pass custom quantity if it was actually changed
                    final quantityToSave =
                        newQuantity != _originalQuantity ? newQuantity : null;

                    widget.onSave(quantityToSave, newNote);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Save",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
