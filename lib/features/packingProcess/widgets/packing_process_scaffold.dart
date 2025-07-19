import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaboodle/features/packingProcess/provider/packing_process_provider.dart';
import 'package:kaboodle/features/packingProcess/widgets/packing_header.dart';
import 'package:kaboodle/features/packingProcess/widgets/packing_bottom_button.dart';
import 'package:kaboodle/features/packingProcess/widgets/unsaved_changes_bottom_sheet.dart';
import 'package:kaboodle/features/packingProcess/widgets/packing_process_body.dart';
import 'package:kaboodle/shared/widgets/custom_app_bar.dart';

class PackingProcessScaffold extends StatelessWidget {
  final PackingProcessProvider provider;

  const PackingProcessScaffold({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _handleWillPop(context),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: _buildAppBar(context),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                PackingHeader(provider: provider),
                const Expanded(child: PackingProcessBody()),
                PackingBottomButton(provider: provider),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: 'Packing Process',
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () => _handleBackNavigation(context),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            icon: const Icon(Icons.close_rounded),
            iconSize: 28,
            color: Theme.of(context).colorScheme.onSurface,
            onPressed: () => _handleCloseNavigation(context),
          ),
        ),
      ],
    );
  }

  Future<bool> _handleWillPop(BuildContext context) async {
    if (provider.hasUnsavedChanges) {
      _showUnsavedChangesDialog(context, isBackNavigation: true);
      return false;
    }
    return true;
  }

  void _handleBackNavigation(BuildContext context) {
    if (provider.hasUnsavedChanges) {
      _showUnsavedChangesDialog(context, isBackNavigation: true);
    } else {
      Navigator.of(context).pop();
    }
  }

  void _handleCloseNavigation(BuildContext context) {
    if (provider.hasUnsavedChanges) {
      _showUnsavedChangesDialog(context, isBackNavigation: false);
    } else {
      context.go('/my-packing-lists');
    }
  }

  void _showUnsavedChangesDialog(BuildContext context,
      {required bool isBackNavigation}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => UnsavedChangesBottomSheet(
        provider: provider,
        onSaveAndExit: () => _handleSaveAndExit(context, isBackNavigation),
        onExitWithoutSaving: () =>
            _handleExitWithoutSaving(context, isBackNavigation),
      ),
    );
  }

  Future<void> _handleSaveAndExit(
      BuildContext context, bool isBackNavigation) async {
    await _saveProgress(context);
    if (context.mounted) {
      _navigateAway(context, isBackNavigation);
    }
  }

  void _handleExitWithoutSaving(BuildContext context, bool isBackNavigation) {
    _navigateAway(context, isBackNavigation);
  }

  void _navigateAway(BuildContext context, bool isBackNavigation) {
    if (isBackNavigation) {
      Navigator.of(context).pop();
    } else {
      context.go('/my-packing-lists');
    }
  }

  Future<void> _saveProgress(BuildContext context) async {
    try {
      await provider.saveProgress();
      if (context.mounted) {
        _showSuccessSnackBar(context);
      }
    } catch (e) {
      if (context.mounted) {
        _showErrorSnackBar(context, e.toString());
      }
    }
  }

  void _showSuccessSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Progress saved successfully!'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showErrorSnackBar(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error saving progress: $error'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
