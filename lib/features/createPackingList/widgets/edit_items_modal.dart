import 'package:flutter/material.dart';

class EditItemsModal extends StatefulWidget {
  final String label;
  final int initialQuantity;
  final ValueChanged<int> onSave;

  const EditItemsModal({
    Key? key,
    required this.label,
    required this.initialQuantity,
    required this.onSave,
  }) : super(key: key);

  @override
  State<EditItemsModal> createState() => _EditItemsModalState();
}

class _EditItemsModalState extends State<EditItemsModal> {
  late double _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity.toDouble();
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
          TextField(),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              widget.onSave(_quantity.round());
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}
