import 'package:copackr/features/createPackingList/widgets/purpose_of_trip_selector.dart';
import 'package:copackr/features/createPackingList/widgets/svg_button_column.dart';
import 'package:copackr/features/createPackingList/widgets/trip_length_slider.dart';
import 'package:copackr/features/createPackingList/widgets/weather_condition_selector.dart';
import 'package:copackr/shared/widgets/custom_svg_checkbox_list_tile.dart';
import 'package:flutter/material.dart';

class MainStepTwoBody extends StatelessWidget {
  const MainStepTwoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Let's personalize your list",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            "Tell us a bit more about your plans so we can tailor our recommendations.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceBright,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Purpose of the trip",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                const PurposeOfTripSelector(),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceBright,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Weather conditions",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 12),
                const WeatherConditionSelector(),
              ],
            ),
          ),
          const SizedBox(height: 16),
          TripLengthSlider(),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceBright,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Accommodations",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Other",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: SvgButtonColumn(
                            svgAsset: 'assets/svg/hotel.svg',
                            label: 'Hotel',
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SvgButtonColumn(
                            svgAsset: 'assets/svg/cabin.svg',
                            label: 'Rental Home',
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SvgButtonColumn(
                            svgAsset: 'assets/svg/home.svg',
                            label: 'Friends/Family',
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: SvgButtonColumn(
                            svgAsset: 'assets/svg/camping.svg',
                            label: 'Camping',
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SvgButtonColumn(
                            svgAsset: 'assets/svg/cruise.svg',
                            label: 'Cruise',
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SvgButtonColumn(
                            svgAsset: 'assets/svg/camper-van.svg',
                            label: 'Road Trip',
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 8,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceBright,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Items/Activities",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                Column(
                  children: [
                    CustomSvgCheckboxListTile(
                      svgAsset: "assets/svg/checklist.svg",
                      text: "Essential items",
                      value: false,
                      onChanged: (val) {},
                    ),
                    CustomSvgCheckboxListTile(
                      svgAsset: "assets/svg/hawaiian-shirt.svg",
                      text: "Clothes",
                      value: false,
                      onChanged: (val) {},
                    ),
                    CustomSvgCheckboxListTile(
                      svgAsset: "assets/svg/toothbrush.svg",
                      text: "Toiletries",
                      value: false,
                      onChanged: (val) {},
                    ),
                    CustomSvgCheckboxListTile(
                      svgAsset: "assets/svg/laptop.svg",
                      text: "Electronics",
                      value: false,
                      onChanged: (val) {},
                    ),
                    CustomSvgCheckboxListTile(
                      svgAsset: "assets/svg/camera.svg",
                      text: "Photography",
                      value: false,
                      onChanged: (val) {},
                    ),
                    CustomSvgCheckboxListTile(
                      svgAsset: "assets/svg/umbrella.svg",
                      text: "Beach",
                      value: false,
                      onChanged: (val) {},
                    ),
                    CustomSvgCheckboxListTile(
                      svgAsset: "assets/svg/dumbbell.svg",
                      text: "Gym",
                      value: false,
                      onChanged: (val) {},
                    ),
                    CustomSvgCheckboxListTile(
                      svgAsset: "assets/svg/bow-tie.svg",
                      text: "Formal Event",
                      value: false,
                      onChanged: (val) {},
                    ),
                    CustomSvgCheckboxListTile(
                      svgAsset: "assets/svg/bicycle.svg",
                      text: "Cycling",
                      value: false,
                      onChanged: (val) {},
                    ),
                    CustomSvgCheckboxListTile(
                      svgAsset: "assets/svg/mountain-route.svg",
                      text: "Hiking",
                      value: false,
                      onChanged: (val) {},
                    ),
                    CustomSvgCheckboxListTile(
                      svgAsset: "assets/svg/winter-hat.svg",
                      text: "Winter Sports",
                      value: false,
                      onChanged: (val) {},
                    ),
                    CustomSvgCheckboxListTile(
                      svgAsset: "assets/svg/rod.svg",
                      text: "Fishing",
                      value: false,
                      onChanged: (val) {},
                    ),
                    // Todo: Add more items
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
