import 'package:copackr/features/createPackingList/widgets/main_step_1_body.dart';
import 'package:copackr/features/createPackingList/widgets/main_step_2_body.dart';
import 'package:copackr/features/createPackingList/widgets/main_step_3_body.dart';
import 'package:copackr/features/createPackingList/widgets/main_step_4_body.dart';
import 'package:copackr/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

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

  void _nextStep() {
    if (_currentStep < 4) {
      setState(() => _currentStep++);
    } else {
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
                buttonText: "Next",
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
        return const MainStepFourBody();
    }
  }
}
