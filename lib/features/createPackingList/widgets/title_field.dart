import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copackr/features/createPackingList/provider/create_packing_list_provider.dart';

class TitleField extends StatefulWidget {
  const TitleField({Key? key}) : super(key: key);

  @override
  State<TitleField> createState() => _TitleFieldState();
}

class _TitleFieldState extends State<TitleField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final model = context.read<CreatePackingListProvider>();
    _controller = TextEditingController(text: model.title);

    _controller.addListener(() {
      model.updateTitle(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
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
    );
  }
}
