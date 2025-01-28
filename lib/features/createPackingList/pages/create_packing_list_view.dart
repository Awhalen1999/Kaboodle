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

  void _nextStep() {
    if (_currentStep < 4) {
      setState(() => _currentStep++);
    } else {
      // "Finish" action (save data, navigate, etc.)
    }
  }

  void _previousStep() {
    if (_currentStep > 1) {
      setState(() => _currentStep--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Packing List'),
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
                    Theme.of(context).colorScheme.tertiary,
                    Theme.of(context).primaryColor,
                  ],
                ),
                roundedEdges: const Radius.circular(10),
              ),
              const SizedBox(height: 16),
              Expanded(child: _buildStepContent(_currentStep)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentStep > 1)
                    CustomButton(
                      buttonText: "Back",
                      onPressed: _previousStep,
                      textColor: Theme.of(context).colorScheme.onSurface,
                      isLoading: false,
                      width: 100,
                      borderRadius: 12,
                      height: 40,
                    )
                  else
                    const SizedBox(width: 64),
                  CustomButton(
                    buttonText: (_currentStep < 4 ? 'Next' : 'Finish'),
                    onPressed: _nextStep,
                    textColor: Theme.of(context).colorScheme.onSurface,
                    isLoading: false,
                    width: 100,
                    borderRadius: 12,
                    height: 40,
                  ),
                ],
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
