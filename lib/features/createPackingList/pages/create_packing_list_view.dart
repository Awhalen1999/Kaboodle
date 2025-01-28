import 'package:copackr/features/createPackingList/widgets/main_step_1_body.dart';
import 'package:copackr/features/createPackingList/widgets/main_step_2_body.dart';
import 'package:copackr/features/createPackingList/widgets/main_step_3_body.dart';
import 'package:copackr/features/createPackingList/widgets/main_step_4_body.dart';
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
      backgroundColor: Theme.of(context).colorScheme.surface,
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
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_rounded),
                      color: Theme.of(context).colorScheme.onSurface,
                      onPressed: _previousStep,
                      tooltip: 'Back',
                    )
                  else
                    const Spacer(),
                  IconButton(
                    icon: Icon(
                      _currentStep < 4
                          ? Icons.arrow_forward_ios_rounded
                          : Icons.done_rounded,
                    ),
                    color: Theme.of(context).colorScheme.onSurface,
                    onPressed: _nextStep,
                    tooltip: _currentStep < 4 ? 'Next' : 'Finish',
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
