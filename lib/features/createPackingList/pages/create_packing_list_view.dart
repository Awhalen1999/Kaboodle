import 'package:copackr/features/createPackingList/widgets/main_step_1_body.dart';
import 'package:copackr/features/createPackingList/widgets/main_step_2_body.dart';
import 'package:copackr/features/createPackingList/widgets/main_step_3_body.dart';
import 'package:copackr/features/createPackingList/widgets/main_step_4_body.dart';
import 'package:copackr/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:provider/provider.dart';
import 'package:copackr/features/createPackingList/provider/create_packing_list_provider.dart';
import 'package:copackr/features/createPackingList/provider/custom_items_provider.dart';

class CreatePackingListView extends StatefulWidget {
  const CreatePackingListView({Key? key}) : super(key: key);

  @override
  State<CreatePackingListView> createState() => _CreatePackingListViewState();
}

class _CreatePackingListViewState extends State<CreatePackingListView> {
  int _currentStep = 1;

  String _getAppBarTitle() {
    switch (_currentStep) {
      case 1:
        return 'Add List';
      case 2:
        return 'List Details';
      case 3:
        return 'Choose Items';
      case 4:
      default:
        return 'Overview List';
    }
  }

  bool _canProceedToNextStep() {
    if (_currentStep == 1) {
      final title = context.read<CreatePackingListProvider>().title;
      if (title.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Please enter a title for your list'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
        return false;
      }
    }
    return true;
  }

  void _nextStep() {
    if (!_canProceedToNextStep()) return;

    if (_currentStep < 4) {
      setState(() => _currentStep++);
    } else {
      // Log the complete data structure that would be saved to Firestore
      final provider = context.read<CreatePackingListProvider>();
      final customItemsProvider = context.read<CustomItemsProvider>();
      final packingListData = provider.getPackingListData(customItemsProvider);

      print('=== PACKING LIST DATA FOR FIRESTORE ===');
      print('Complete structure:');
      print(packingListData);
      print('\n=== BREAKDOWN ===');
      print('Title: ${packingListData['title']}');
      print('Description: ${packingListData['description']}');
      print('List Color: ${packingListData['listColor']}');
      print('Travel Date: ${packingListData['travelDate']}');
      print('Gender: ${packingListData['gender']}');
      print('Trip Purpose: ${packingListData['tripPurpose']}');
      print('Weather: ${packingListData['weatherCondition']}');
      print('Trip Length: ${packingListData['tripLength']}');
      print('Accommodation: ${packingListData['accommodation']}');
      print('Selected Sections: ${packingListData['selectedSections']}');
      print('Items Count: ${(packingListData['items'] as List).length}');
      print('\n=== ITEMS DETAILS ===');
      for (final item in packingListData['items'] as List) {
        final calculatedQty = item['calculatedQuantity'];
        final customQty = item['customQuantity'];
        final finalQty = customQty ?? calculatedQty;
        print(
            '• ${item['label']} (${item['section']}) - Calculated: $calculatedQty, Custom: $customQty, Final: $finalQty - Note: ${item['note'] ?? 'none'}');
      }
      print('=== END LOG ===');

      // final step action
    }
  }

  void _previousStep() {
    if (_currentStep > 1) {
      setState(() => _currentStep--);
    } else {
      Navigator.pop(context);
    }
  }

  String _getButtonText() {
    if (_currentStep == 2) return 'Build List';
    if (_currentStep == 4) return 'Finish';
    return 'Next';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 4,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: _previousStep,
        ),
        title: Text(_getAppBarTitle()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.close_rounded),
              iconSize: 28,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              StepProgressIndicator(
                totalSteps: 4,
                currentStep: _currentStep,
                size: 8,
                unselectedColor: Colors.grey.shade300,
                selectedGradientColor: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.primary,
                  ],
                ),
                roundedEdges: const Radius.circular(10),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: _buildStepContent(_currentStep),
                  ),
                ),
              ),
              CustomButton(
                buttonText: _getButtonText(),
                onPressed: _nextStep,
                textColor: Theme.of(context).colorScheme.onPrimary,
                buttonColor: Theme.of(context).colorScheme.primary,
                isLoading: false,
                borderRadius: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepContent(int step) {
    switch (step) {
      case 1:
        return const MainStepOneBody();
      case 2:
        return const MainStepTwoBody();
      case 3:
        return const MainStepThreeBody();
      case 4:
      default:
        return MainStepFourBody(
          onEditTripDetails: () => setState(() => _currentStep = 1),
          onEditTripRequirements: () => setState(() => _currentStep = 2),
          onEditPackingList: () => setState(() => _currentStep = 3),
        );
    }
  }
}
