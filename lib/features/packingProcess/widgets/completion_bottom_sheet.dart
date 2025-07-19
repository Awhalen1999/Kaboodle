import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaboodle/features/packingProcess/provider/packing_process_provider.dart';

class CompletionBottomSheet extends StatefulWidget {
  final PackingProcessProvider provider;

  const CompletionBottomSheet({super.key, required this.provider});

  @override
  State<CompletionBottomSheet> createState() => _CompletionBottomSheetState();
}

class _CompletionBottomSheetState extends State<CompletionBottomSheet> {
  bool _confirmDelete = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 32),
      decoration: _buildDecoration(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 16),
          _buildMessage(context),
          const SizedBox(height: 32),
          _buildButtons(context),
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Packing Complete!',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
            _resetConfirm();
          },
          icon: Icon(
            Icons.close_rounded,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          style: IconButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          ),
        ),
      ],
    );
  }

  Widget _buildMessage(BuildContext context) {
    return Text(
      'Congratulations! You\'ve successfully packed all your items. Your list has been updated with your progress.',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        _buildContinueButton(context),
        const SizedBox(height: 16),
        _buildFinishKeepButton(context),
        const SizedBox(height: 16),
        _buildFinishDeleteButton(context),
      ],
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        icon: Icon(
          Icons.arrow_back,
          color: Theme.of(context).colorScheme.primary,
        ),
        label: Text(
          'Continue Packing',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        onPressed: () {
          Navigator.pop(context);
          _resetConfirm();
        },
        style: _buildOutlinedButtonStyle(context),
      ),
    );
  }

  Widget _buildFinishKeepButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(
          Icons.home,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        label: Text(
          'Finish & Keep List',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        onPressed: () => _handleFinishKeep(context),
        style: _buildElevatedButtonStyle(context),
      ),
    );
  }

  Widget _buildFinishDeleteButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(
          Icons.delete,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        label: Text(
          _confirmDelete ? 'Are you sure?' : 'Finish & Delete List',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        onPressed: () => _handleDelete(context),
        style: _buildElevatedButtonStyle(context, isError: _confirmDelete),
      ),
    );
  }

  ButtonStyle _buildOutlinedButtonStyle(BuildContext context) {
    return OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 16),
      side: BorderSide(
        color: Theme.of(context).colorScheme.primary,
        width: 2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  ButtonStyle _buildElevatedButtonStyle(BuildContext context,
      {bool isError = false}) {
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 16),
      backgroundColor: isError
          ? Theme.of(context).colorScheme.error
          : Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Future<void> _handleFinishKeep(BuildContext context) async {
    widget.provider.uncheckAllItems();
    await widget.provider.recordCompletion();

    if (context.mounted) {
      Navigator.pop(context);
      context.go('/my-packing-lists');
    }
  }

  void _handleDelete(BuildContext context) {
    if (_confirmDelete) {
      // TODO: Implement delete functionality
      Navigator.of(context).pop(); // Close bottom sheet
      Navigator.of(context).pop(); // Go back to list viewer
    } else {
      setState(() {
        _confirmDelete = true;
      });
    }
  }

  void _resetConfirm() {
    if (_confirmDelete) {
      setState(() {
        _confirmDelete = false;
      });
    }
  }
}
