import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kaboodle/features/createPackingList/provider/create_packing_list_provider.dart';

class DescriptionField extends StatefulWidget {
  const DescriptionField({Key? key}) : super(key: key);

  @override
  State<DescriptionField> createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends State<DescriptionField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final model = context.read<CreatePackingListProvider>();
    _controller = TextEditingController(text: model.description);

    _controller.addListener(() {
      model.updateDescription(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      minLines: 3,
      maxLines: 5,
      textInputAction: TextInputAction.done,
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
    );
  }
}
