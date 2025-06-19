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
    return Padding(
      // Use the same padding as your other step bodies.
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 36, top: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Edit ${widget.label}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
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
              Text(_quantity.round().toString()),
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _noteController,
            maxLines: 1,
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
                  color: Theme.of(context).colorScheme.surfaceContainer,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final newQuantity = _quantity.round();
              final newNote = _noteController.text;

              // Only pass custom quantity if it was actually changed
              final quantityToSave =
                  newQuantity != _originalQuantity ? newQuantity : null;

              widget.onSave(quantityToSave, newNote);
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}
