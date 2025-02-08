import 'package:flutter/material.dart';

class PackingItem {
  final String id;
  final String label;
  final int baseQuantity;
  final List<String> requiredWeathers;
  final List<String> requiredPurposes;
  final List<String> requiredAccommodations;
  final List<String> applicableProfiles;
  final IconData iconData;

  const PackingItem({
    required this.id,
    required this.label,
    required this.iconData,
    this.baseQuantity = 1,
    this.requiredWeathers = const [],
    this.requiredPurposes = const [],
    this.requiredAccommodations = const [],
    this.applicableProfiles = const ['all'],
  });
}

// A master list mapping section keys to packing items
final Map<String, List<PackingItem>> packingItemsBySection = {
  'commonItems': [
    PackingItem(
      id: 'book',
      label: 'Book',
      iconData: Icons.menu_book_rounded,
      baseQuantity: 1,
      requiredPurposes: ['business', 'leisure'],
    ),
    PackingItem(
      id: 'medication',
      label: 'Medication',
      iconData: Icons.medication_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'wallet',
      label: 'Wallet',
      iconData: Icons.account_balance_wallet_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'watch',
      label: 'Watch',
      iconData: Icons.watch_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'map',
      label: 'Map',
      iconData: Icons.map_rounded,
      baseQuantity: 1,
      requiredAccommodations: ['roadTrip', 'camping'],
    ),
    PackingItem(
      id: 'campas',
      label: 'Campas',
      iconData: Icons.emoji_nature_rounded,
      baseQuantity: 1,
      requiredAccommodations: ['camping'],
    ),
    PackingItem(
      id: 'portable_charger',
      label: 'Portable Charger',
      iconData: Icons.battery_charging_full_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'glasses',
      label: 'Glasses',
      iconData: Icons.remove_red_eye_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'earbuds',
      label: 'Earbuds',
      iconData: Icons.headset_rounded,
      baseQuantity: 1,
    ),
  ],
  'clothes': [
    PackingItem(
      id: 't_shirt',
      label: 'T-Shirt',
      iconData: Icons.checkroom_rounded,
      baseQuantity: 2,
    ),
    PackingItem(
      id: 'casual_pants',
      label: 'Casual Pants',
      iconData: Icons.checkroom_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'casual_shirt',
      label: 'Casual Shirt',
      iconData: Icons.checkroom_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'light_jacket',
      label: 'Light Jacket',
      iconData: Icons.checkroom_rounded,
      baseQuantity: 1,
      requiredWeathers: ['mild', 'cold'],
    ),
    PackingItem(
      id: 'heavy_jacket',
      label: 'Heavy Jacket',
      iconData: Icons.checkroom_rounded,
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
    PackingItem(
      id: 'pajamas',
      label: 'Pajamas',
      iconData: Icons.bedtime_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'scarf',
      label: 'Scarf',
      iconData: Icons.all_inbox_rounded,
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
    PackingItem(
      id: 'shoes',
      label: 'Shoes',
      iconData: Icons.directions_run_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'boots',
      label: 'Boots',
      iconData: Icons.directions_run_rounded,
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
    PackingItem(
      id: 'socks',
      label: 'Socks',
      iconData: Icons.accessibility_new_rounded,
      baseQuantity: 3,
    ),
    PackingItem(
      id: 'underwear',
      label: 'Underwear',
      iconData: Icons.emoji_people_rounded,
      baseQuantity: 3,
    ),
    PackingItem(
      id: 'sweater',
      label: 'Sweater',
      iconData: Icons.checkroom_rounded,
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
    PackingItem(
      id: 'swimsuit',
      label: 'Swimsuit',
      iconData: Icons.pool_rounded,
      baseQuantity: 1,
    ),
    // Female-specific items
    PackingItem(
      id: 'dress',
      label: 'Dress',
      iconData: Icons.dry_cleaning_rounded,
      baseQuantity: 1,
      applicableProfiles: ['female'],
    ),
    PackingItem(
      id: 'skirt',
      label: 'Skirt',
      iconData: Icons.checkroom_rounded,
      baseQuantity: 1,
      applicableProfiles: ['female'],
    ),
    PackingItem(
      id: 'blouse',
      label: 'Blouse',
      iconData: Icons.checkroom_rounded,
      baseQuantity: 1,
      applicableProfiles: ['female'],
    ),
    // Unisex addition
    PackingItem(
      id: 'shorts',
      label: 'Shorts',
      iconData: Icons.checkroom_rounded,
      baseQuantity: 1,
    ),
  ],
  'toiletries': [
    PackingItem(
      id: 'bandaids',
      label: 'Bandaids',
      iconData: Icons.healing_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'cologne',
      label: 'Cologne',
      iconData: Icons.local_florist_rounded,
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'perfume',
      label: 'Perfume',
      iconData: Icons.local_florist_rounded,
      baseQuantity: 1,
      applicableProfiles: ['female'],
    ),
    PackingItem(
      id: 'contacts',
      label: 'Contacts',
      iconData: Icons.remove_red_eye_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'contact_solution',
      label: 'Contact Solution',
      iconData: Icons.opacity_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'cotton_swabs',
      label: 'Cotton Swabs',
      iconData: Icons.grain_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'deodorant',
      label: 'Deodorant',
      iconData: Icons.ac_unit_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'razor',
      label: 'Razor',
      iconData: Icons.content_cut_rounded,
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'electric_shaver',
      label: 'Electric Shaver',
      iconData: Icons.electric_bolt_rounded,
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'hairbrush',
      label: 'Hairbrush',
      iconData: Icons.brush_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'nail_clippers',
      label: 'Nail Clippers',
      iconData: Icons.content_cut_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'shampoo',
      label: 'Shampoo',
      iconData: Icons.shower_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'conditioner',
      label: 'Conditioner',
      iconData: Icons.shower_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'shaving_cream',
      label: 'Shaving Cream/Gel',
      iconData: Icons.icecream_rounded,
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'toothbrush',
      label: 'Toothbrush',
      iconData: Icons.clean_hands_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'toothpaste',
      label: 'Toothpaste',
      iconData: Icons.medication_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'mouthwash',
      label: 'Mouthwash',
      iconData: Icons.clean_hands_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'tweezers',
      label: 'Tweezers',
      iconData: Icons.build_rounded,
      baseQuantity: 1,
    ),
    // Female-specific toiletries
    PackingItem(
      id: 'feminine_hygiene',
      label: 'Feminine Hygiene Products',
      iconData: Icons.local_florist_rounded,
      baseQuantity: 1,
      applicableProfiles: ['female'],
    ),
    PackingItem(
      id: 'makeup_remover',
      label: 'Makeup Remover',
      iconData: Icons.brush_rounded,
      baseQuantity: 1,
      applicableProfiles: ['female'],
    ),
    PackingItem(
      id: 'hair_ties',
      label: 'Hair Ties',
      iconData: Icons.link_rounded,
      baseQuantity: 1,
    ),
  ],
  'electronics': [
    PackingItem(
      id: 'e_reader',
      label: 'E-Reader',
      iconData: Icons.menu_book_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'laptop',
      label: 'Laptop',
      iconData: Icons.laptop_rounded,
      baseQuantity: 1,
      requiredPurposes: ['business'],
    ),
    PackingItem(
      id: 'laptop_case',
      label: 'Laptop Case',
      iconData: Icons.laptop_mac_rounded,
      baseQuantity: 1,
      requiredPurposes: ['business'],
    ),
    PackingItem(
      id: 'laptop_charger',
      label: 'Laptop Charger',
      iconData: Icons.battery_charging_full_rounded,
      baseQuantity: 1,
      requiredPurposes: ['business'],
    ),
    PackingItem(
      id: 'tablet',
      label: 'Tablet',
      iconData: Icons.tablet_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'tablet_charger',
      label: 'Tablet Charger',
      iconData: Icons.battery_charging_full_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'tablet_case',
      label: 'Tablet Case',
      iconData: Icons.tablet_rounded,
      baseQuantity: 1,
    ),
    // Show phone only in electronics.
    PackingItem(
      id: 'phone',
      label: 'Phone',
      iconData: Icons.phone_iphone_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'phone_charger',
      label: 'Phone Charger',
      iconData: Icons.battery_charging_full_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'headphones',
      label: 'Headphones',
      iconData: Icons.headset_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'headphones_charger',
      label: 'Headphones Charger',
      iconData: Icons.battery_charging_full_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'keyboard',
      label: 'Keyboard',
      iconData: Icons.keyboard_rounded,
      baseQuantity: 1,
      requiredPurposes: ['business'],
    ),
    PackingItem(
      id: 'mouse',
      label: 'Mouse',
      iconData: Icons.mouse_rounded,
      baseQuantity: 1,
      requiredPurposes: ['business'],
    ),
    PackingItem(
      id: 'camera',
      label: 'Camera',
      iconData: Icons.camera_alt_rounded,
      baseQuantity: 1,
      requiredPurposes: ['vacation'],
    ),
    PackingItem(
      id: 'camera_charger',
      label: 'Camera Charger',
      iconData: Icons.battery_charging_full_rounded,
      baseQuantity: 1,
      requiredPurposes: ['vacation'],
    ),
  ],
  'photography': [
    PackingItem(
      id: 'batteries',
      label: 'Batteries',
      iconData: Icons.battery_std_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'battery_charger',
      label: 'Battery Charger',
      iconData: Icons.battery_charging_full_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'camera_bag',
      label: 'Camera Bag',
      iconData: Icons.camera_alt_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'lenses',
      label: 'Lenses',
      iconData: Icons.camera_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'memory_cards',
      label: 'Memory Cards',
      iconData: Icons.sd_card_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'tripod',
      label: 'Tripod',
      iconData: Icons.trip_origin_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'remote_shutter',
      label: 'Remote Shutter',
      iconData: Icons.radio_button_checked_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'cleaning_kit',
      label: 'Cleaning Kit',
      iconData: Icons.cleaning_services_rounded,
      baseQuantity: 1,
    ),
  ],
  'beach': [
    PackingItem(
      id: 'after_sun_case',
      label: 'After Sun Case',
      iconData: Icons.wb_sunny_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'beach_bag',
      label: 'Beach Bag',
      iconData: Icons.beach_access_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'beach_towel',
      label: 'Beach Towel',
      iconData: Icons.beach_access_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'beach_umbrella',
      label: 'Beach Umbrella',
      iconData: Icons.beach_access_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'hat',
      label: 'Hat',
      iconData: Icons.emoji_people_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'sunglasses',
      label: 'Sunglasses',
      iconData: Icons.remove_red_eye_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'sunscreen',
      label: 'Sunscreen',
      iconData: Icons.wb_sunny_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'sandals',
      label: 'Sandals',
      iconData: Icons.directions_walk_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'flip_flops',
      label: 'Flip Flops',
      iconData: Icons.directions_walk_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'water_resistant_phone_pouch',
      label: 'Water Resistant Phone Pouch',
      iconData: Icons.phone_android_rounded,
      baseQuantity: 1,
    ),
  ],
  'gym': [
    PackingItem(
      id: 'gym_shoes',
      label: 'Gym Shoes',
      iconData: Icons.fitness_center_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'gym_shorts',
      label: 'Gym Shorts',
      iconData: Icons.fitness_center_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'gym_shirts',
      label: 'Gym Shirts',
      iconData: Icons.fitness_center_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'gym_towel',
      label: 'Gym Towel',
      iconData: Icons.spa_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'padlock',
      label: 'Padlock',
      iconData: Icons.lock_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'water_bottle',
      label: 'Water Bottle',
      iconData: Icons.local_drink_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'gym_supplements',
      label: 'Gym Supplements',
      iconData: Icons.food_bank_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'sweatband',
      label: 'Sweatband',
      iconData: Icons.sports_gymnastics_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'workout_gloves',
      label: 'Workout Gloves',
      iconData: Icons.sports_gymnastics_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'gym_bag',
      label: 'Gym Bag',
      iconData: Icons.fitness_center_rounded,
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'gym_key_card',
      label: 'Gym Key/Card',
      iconData: Icons.vpn_key_rounded,
      baseQuantity: 1,
    ),
  ],
  'formal': [
    // Male formal items
    PackingItem(
      id: 'dress_shirt',
      label: 'Dress Shirt',
      iconData: Icons.checkroom_rounded,
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'dress_shoes',
      label: 'Dress Shoes',
      iconData: Icons.directions_run_rounded,
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'suit_jacket',
      label: 'Suit Jacket',
      iconData: Icons.checkroom_rounded,
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'suit_pants',
      label: 'Suit Pants',
      iconData: Icons.checkroom_rounded,
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'tie',
      label: 'Tie',
      iconData: Icons.checkroom_rounded,
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'belt',
      label: 'Belt',
      iconData: Icons.checkroom_rounded,
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'dress_pants',
      label: 'Dress Pants',
      iconData: Icons.checkroom_rounded,
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'socks_formal',
      label: 'Socks',
      iconData: Icons.checkroom_rounded,
      baseQuantity: 1,
    ),
    // Female formal items
    PackingItem(
      id: 'formal_dress',
      label: 'Formal Dress',
      iconData: Icons.dry_cleaning_rounded,
      baseQuantity: 1,
      applicableProfiles: ['female'],
    ),
    PackingItem(
      id: 'heels',
      label: 'Heels',
      iconData: Icons.directions_run_rounded,
      baseQuantity: 1,
      applicableProfiles: ['female'],
    ),
    PackingItem(
      id: 'clutch',
      label: 'Clutch',
      iconData: Icons.checkroom_rounded,
      baseQuantity: 1,
      applicableProfiles: ['female'],
    ),
  ],

  // Uncomment when ready to fill these out
  /*
  'cycling': [],
  'hiking': [],
  'winterSports': [],
  'fishing': [],
  */
};

// Helper function that returns whether an item should be included based on the criteria
bool itemMatchesCriteria(
  PackingItem item, {
  required String gender,
  required String tripPurpose,
  required String weather,
  required String accommodation,
}) {
  final matchesWeather =
      item.requiredWeathers.isEmpty || item.requiredWeathers.contains(weather);
  final matchesPurpose = item.requiredPurposes.isEmpty ||
      item.requiredPurposes.contains(tripPurpose);
  final matchesAccommodation = item.requiredAccommodations.isEmpty ||
      item.requiredAccommodations.contains(accommodation);
  final matchesGender = item.applicableProfiles.contains('all') ||
      item.applicableProfiles.contains(gender);

  return matchesWeather &&
      matchesPurpose &&
      matchesAccommodation &&
      matchesGender;
}
