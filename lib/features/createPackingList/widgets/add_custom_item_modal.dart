import 'package:flutter/material.dart';

class AddCustomItemModal extends StatefulWidget {
  final String sectionTitle;
  final Function(String itemName, int quantity) onAdd;

  const AddCustomItemModal({
    Key? key,
    required this.sectionTitle,
    required this.onAdd,
  }) : super(key: key);

  @override
  State<AddCustomItemModal> createState() => _AddCustomItemModalState();
}

class _AddCustomItemModalState extends State<AddCustomItemModal> {
  final TextEditingController _itemNameController = TextEditingController();
  double _quantity = 1.0;

  @override
  void dispose() {
    _itemNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 36, top: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Add Custom Item to ${widget.sectionTitle}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _itemNameController,
            maxLines: 1,
            decoration: InputDecoration(
              labelText: "Item Name",
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
          ElevatedButton(
            onPressed: () {
              final itemName = _itemNameController.text.trim();
              if (itemName.isNotEmpty) {
                widget.onAdd(itemName, _quantity.round());
                Navigator.pop(context);
              }
            },
            child: const Text("Add Item"),
          ),
        ],
      ),
    );
  }
}
