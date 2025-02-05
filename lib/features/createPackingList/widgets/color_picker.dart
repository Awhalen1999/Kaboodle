import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copackr/features/createPackingList/provider/create_packing_list_provider.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({Key? key}) : super(key: key);

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int _selectedIndex = 0;
  late List<Color> _colors;

  @override
  void initState() {
    super.initState();

    // We'll define the color list once here
    _colors = [
      Colors.grey,
      Colors.red,
      Colors.pink,
      Colors.lightBlue,
      Colors.green,
      Colors.orange,
    ];

    // Check the provider's current color and find which index matches
    final model = context.read<CreatePackingListProvider>();
    final currentColor = model.listColor;

    // If the current color is in our list, pick that index. Otherwise default to 0.
    final index = _colors.indexOf(currentColor);
    if (index != -1) {
      _selectedIndex = index;
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CreatePackingListProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(_colors.length, (index) {
        final color = _colors[index];
        return IconButton(
          icon: Icon(
            Icons.circle,
            color: color,
            size: _selectedIndex == index ? 32 : 22,
          ),
          onPressed: () {
            setState(() {
              _selectedIndex = index;
            });
            // Update the provider with the new color
            model.updateListColor(_colors[index]);
          },
        );
      }),
    );
  }
}
