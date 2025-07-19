import 'package:flutter/material.dart';
import 'package:kaboodle/features/packingProcess/provider/packing_process_provider.dart';
import 'package:kaboodle/features/packingProcess/widgets/completion_bottom_sheet.dart';

class HeaderMenu extends StatelessWidget {
  final PackingProcessProvider provider;

  const HeaderMenu({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert, size: 20),
      onSelected: (value) => _handleMenuSelection(context, value),
      itemBuilder: (context) => _buildMenuItems(),
    );
  }

  List<PopupMenuItem<String>> _buildMenuItems() {
    return [
      _buildMenuItem('check_all', Icons.check_box, 'Check All'),
      _buildMenuItem(
          'uncheck_all', Icons.check_box_outline_blank, 'Uncheck All'),
      _buildMenuItem('save', Icons.save, 'Save Progress'),
      _buildMenuItem('finish', Icons.check_circle, 'Finish Packing'),
    ];
  }

  PopupMenuItem<String> _buildMenuItem(
      String value, IconData icon, String text) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

  void _handleMenuSelection(BuildContext context, String value) {
    switch (value) {
      case 'check_all':
        provider.checkAllItems();
        break;
      case 'uncheck_all':
        provider.uncheckAllItems();
        break;
      case 'save':
        _saveProgress(context);
        break;
      case 'finish':
        _finishPacking(context);
        break;
    }
  }

  Future<void> _saveProgress(BuildContext context) async {
    try {
      await provider.saveProgress();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Progress saved successfully!'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving progress: $e'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  Future<void> _finishPacking(BuildContext context) async {
    provider.checkAllItems();
    await _saveProgress(context);
    if (context.mounted) {
      _showCompletionDialog(context);
    }
  }

  void _showCompletionDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CompletionBottomSheet(provider: provider),
    );
  }
}
