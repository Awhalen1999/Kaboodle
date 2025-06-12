import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copackr/features/createPackingList/provider/create_packing_list_provider.dart';
import 'package:copackr/features/createPackingList/widgets/svg_button_column.dart';

class AccommodationSelector extends StatelessWidget {
  const AccommodationSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CreatePackingListProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: SvgButtonColumn(
                svgAsset: 'assets/svg/hotel.svg',
                label: 'Hotel/Resort',
                isSelected: provider.accommodation == 'hotel',
                onPressed: () => provider.updateAccommodation('hotel'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SvgButtonColumn(
                svgAsset: 'assets/svg/cabin.svg',
                label: 'Rental Home',
                isSelected: provider.accommodation == 'rentalHome',
                onPressed: () => provider.updateAccommodation('rentalHome'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SvgButtonColumn(
                svgAsset: 'assets/svg/home.svg',
                label: 'Friends/Family',
                isSelected: provider.accommodation == 'friendsFamily',
                onPressed: () => provider.updateAccommodation('friendsFamily'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: SvgButtonColumn(
                svgAsset: 'assets/svg/camping.svg',
                label: 'Camping',
                isSelected: provider.accommodation == 'camping',
                onPressed: () => provider.updateAccommodation('camping'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SvgButtonColumn(
                svgAsset: 'assets/svg/cruise.svg',
                label: 'Cruise',
                isSelected: provider.accommodation == 'cruise',
                onPressed: () => provider.updateAccommodation('cruise'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SvgButtonColumn(
                svgAsset: 'assets/svg/camper-van.svg',
                label: 'Road Trip',
                isSelected: provider.accommodation == 'roadTrip',
                onPressed: () => provider.updateAccommodation('roadTrip'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
