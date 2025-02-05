import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  final Function(Color)? onColorSelected;
  const ColorPicker({Key? key, this.onColorSelected}) : super(key: key);

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Theme.of(context).colorScheme.surfaceContainer,
      Colors.red,
      Colors.pink,
      Colors.lightBlue,
      Colors.green,
      Colors.orange,
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(colors.length, (index) {
        return IconButton(
          icon: Icon(
            Icons.circle,
            color: colors[index],
            size: _selectedIndex == index ? 32 : 22,
          ),
          onPressed: () {
            setState(() {
              _selectedIndex = index;
            });
            widget.onColorSelected?.call(colors[index]);
          },
        );
      }),
    );
  }
}
