import 'package:copackr/features/createPackingList/widgets/svg_button_column.dart';
import 'package:copackr/features/createPackingList/widgets/svg_button_row.dart';
import 'package:copackr/features/createPackingList/widgets/trip_length_slider.dart';
import 'package:copackr/shared/widgets/custom_svg_checkbox_list_tile.dart';
import 'package:flutter/material.dart';

class MainStepTwoBody extends StatelessWidget {
  const MainStepTwoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgButtonRow(
                      svgAsset: 'assets/svg/business.svg',
                      label: "Business",
                      onPressed: () {},
                    ),
                    SvgButtonRow(
                      svgAsset: 'assets/svg/vacation.svg',
                      label: "Vacation",
                      onPressed: () {},
                    ),
                  ],
                ),
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
                Row(
                  children: [
                    Text(
                      "Weather conditions",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Not sure yet",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgButtonRow(
                      svgAsset: 'assets/svg/warm.svg',
                      label: "Hot",
                      onPressed: () {},
                    ),
                    SvgButtonRow(
                      svgAsset: 'assets/svg/cool.svg',
                      label: "Cold",
                      onPressed: () {},
                    ),
                    SvgButtonRow(
                      svgAsset: 'assets/svg/mild.svg',
                      label: "Mild",
                      onPressed: () {},
                    ),
                  ],
                ),
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
                Text(
                  "Accommodations",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500),
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
                      svgAsset: "assets/svg/gym.svg",
                      text: "Gym",
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
                      svgAsset: "assets/svg/bow-tie.svg",
                      text: "Formal Event",
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
