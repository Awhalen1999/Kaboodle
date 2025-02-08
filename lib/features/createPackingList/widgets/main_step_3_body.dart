import 'package:copackr/features/createPackingList/provider/create_packing_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainStepThreeBody extends StatelessWidget {
  const MainStepThreeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      child: Column(
        children: [
          const Text(
            'Step 3: build list',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {
              final provider = context.read<CreatePackingListProvider>();

              debugPrint("---- CURRENT PACKING LIST STATE ----");
              debugPrint("Title: ${provider.title}");
              debugPrint("Description: ${provider.description}");
              debugPrint("List Color: ${provider.listColor}");
              debugPrint("Tags: ${provider.tags}");
              debugPrint("Travel Date: ${provider.travelDate}");
              debugPrint("Trip Purpose: ${provider.tripPurpose}");
              debugPrint("Weather Condition: ${provider.weatherCondition}");
              debugPrint("Trip Length: ${provider.tripLength}");
              debugPrint("Accommodation: ${provider.accommodation}");
              debugPrint("Items/Activities: ${provider.itemsActivities}");
            },
            child: const Text("Log Current Selections"),
          ),
        ],
      ),
    );
  }
}
