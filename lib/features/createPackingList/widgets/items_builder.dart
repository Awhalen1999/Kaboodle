class PackingItem {
  final String id;
  final String label;
  final int baseQuantity;
  final List<String> requiredWeathers; // e.g. ['hot', 'cold', 'mild']
  final List<String>
      requiredPurposes; // e.g. ['business', 'vacation', 'leisure']
  final List<String>
      requiredAccommodations; // e.g. ['hotel', 'camping', 'roadTrip']
  final List<String> applicableProfiles; // e.g. ['male'], ['female'], ['all']
  final String iconName;

  const PackingItem({
    required this.id,
    required this.label,
    required this.iconName,
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
      iconName: 'menu_book_rounded',
      baseQuantity: 1,
      requiredPurposes: ['business', 'leisure'],
    ),
    PackingItem(
      id: 'medication',
      label: 'Medication',
      iconName: 'medication_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'wallet',
      label: 'Wallet',
      iconName: 'account_balance_wallet_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'watch',
      label: 'Watch',
      iconName: 'watch_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'map',
      label: 'Map',
      iconName: 'map_rounded',
      baseQuantity: 1,
      requiredAccommodations: ['roadTrip', 'camping'],
    ),
    PackingItem(
      id: 'campas',
      label: 'Campas',
      iconName: 'emoji_nature_rounded',
      baseQuantity: 1,
      requiredAccommodations: ['camping'],
    ),
    PackingItem(
      id: 'portable_charger',
      label: 'Portable Charger',
      iconName: 'battery_charging_full_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'glasses',
      label: 'Glasses',
      iconName: 'remove_red_eye_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'earbuds',
      label: 'Earbuds',
      iconName: 'headset_rounded',
      baseQuantity: 1,
    ),
  ],
  'clothes': [
    PackingItem(
      id: 't_shirt',
      label: 'T-Shirt',
      iconName: 'checkroom_rounded',
      baseQuantity: 2,
    ),
    PackingItem(
      id: 'casual_pants',
      label: 'Casual Pants',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'casual_shirt',
      label: 'Casual Shirt',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'light_jacket',
      label: 'Light Jacket',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      requiredWeathers: ['mild', 'cold'],
    ),
    PackingItem(
      id: 'heavy_jacket',
      label: 'Heavy Jacket',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
    PackingItem(
      id: 'pajamas',
      label: 'Pajamas',
      iconName: 'bedtime_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'scarf',
      label: 'Scarf',
      iconName: 'all_inbox_rounded',
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
    PackingItem(
      id: 'shoes',
      label: 'Shoes',
      iconName: 'directions_run_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'boots',
      label: 'Boots',
      iconName: 'directions_run_rounded',
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
    PackingItem(
      id: 'socks',
      label: 'Socks',
      iconName: 'accessibility_new_rounded',
      baseQuantity: 3,
    ),
    PackingItem(
      id: 'underwear',
      label: 'Underwear',
      iconName: 'emoji_people_rounded',
      baseQuantity: 3,
    ),
    PackingItem(
      id: 'sweater',
      label: 'Sweater',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
    PackingItem(
      id: 'swimsuit',
      label: 'Swimsuit',
      iconName: 'pool_rounded',
      baseQuantity: 1,
    ),
    // Female-specific items
    PackingItem(
      id: 'dress',
      label: 'Dress',
      iconName: 'dry_cleaning_rounded',
      baseQuantity: 1,
      applicableProfiles: ['female'],
    ),
    PackingItem(
      id: 'skirt',
      label: 'Skirt',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      applicableProfiles: ['female'],
    ),
    PackingItem(
      id: 'blouse',
      label: 'Blouse',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      applicableProfiles: ['female'],
    ),
    // Unisex addition
    PackingItem(
      id: 'shorts',
      label: 'Shorts',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
    ),
  ],
  'toiletries': [
    PackingItem(
      id: 'bandaids',
      label: 'Bandaids',
      iconName: 'healing_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'cologne',
      label: 'Cologne',
      iconName: 'local_florist_rounded',
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'perfume',
      label: 'Perfume',
      iconName: 'local_florist_rounded',
      baseQuantity: 1,
      applicableProfiles: ['female'],
    ),
    PackingItem(
      id: 'contacts',
      label: 'Contacts',
      iconName: 'remove_red_eye_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'contact_solution',
      label: 'Contact Solution',
      iconName: 'opacity_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'cotton_swabs',
      label: 'Cotton Swabs',
      iconName: 'grain_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'deodorant',
      label: 'Deodorant',
      iconName: 'ac_unit_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'razor',
      label: 'Razor',
      iconName: 'content_cut_rounded',
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'electric_shaver',
      label: 'Electric Shaver',
      iconName: 'electric_bolt_rounded',
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'hairbrush',
      label: 'Hairbrush',
      iconName: 'brush_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'nail_clippers',
      label: 'Nail Clippers',
      iconName: 'content_cut_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'shampoo',
      label: 'Shampoo',
      iconName: 'shower_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'conditioner',
      label: 'Conditioner',
      iconName: 'shower_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'shaving_cream',
      label: 'Shaving Cream/Gel',
      iconName: 'icecream_rounded',
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'toothbrush',
      label: 'Toothbrush',
      iconName: 'clean_hands_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'toothpaste',
      label: 'Toothpaste',
      iconName: 'medication_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'mouthwash',
      label: 'Mouthwash',
      iconName: 'clean_hands_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'tweezers',
      label: 'Tweezers',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
    ),
    // Female-specific toiletries
    PackingItem(
      id: 'feminine_hygiene',
      label: 'Feminine Hygiene Products',
      iconName: 'local_florist_rounded',
      baseQuantity: 1,
      applicableProfiles: ['female'],
    ),
    PackingItem(
      id: 'makeup_remover',
      label: 'Makeup Remover',
      iconName: 'brush_rounded',
      baseQuantity: 1,
      applicableProfiles: ['female'],
    ),
    PackingItem(
      id: 'hair_ties',
      label: 'Hair Ties',
      iconName: 'link_rounded',
      baseQuantity: 1,
    ),
  ],
  'electronics': [
    PackingItem(
      id: 'e_reader',
      label: 'E-Reader',
      iconName: 'menu_book_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'laptop',
      label: 'Laptop',
      iconName: 'laptop_rounded',
      baseQuantity: 1,
      requiredPurposes: ['business'],
    ),
    PackingItem(
      id: 'laptop_case',
      label: 'Laptop Case',
      iconName: 'laptop_mac_rounded',
      baseQuantity: 1,
      requiredPurposes: ['business'],
    ),
    PackingItem(
      id: 'laptop_charger',
      label: 'Laptop Charger',
      iconName: 'battery_charging_full_rounded',
      baseQuantity: 1,
      requiredPurposes: ['business'],
    ),
    PackingItem(
      id: 'tablet',
      label: 'Tablet',
      iconName: 'tablet_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'tablet_charger',
      label: 'Tablet Charger',
      iconName: 'battery_charging_full_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'tablet_case',
      label: 'Tablet Case',
      iconName: 'tablet_rounded',
      baseQuantity: 1,
    ),
    // Show phone only in electronics.
    PackingItem(
      id: 'phone',
      label: 'Phone',
      iconName: 'phone_iphone_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'phone_charger',
      label: 'Phone Charger',
      iconName: 'battery_charging_full_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'headphones',
      label: 'Headphones',
      iconName: 'headset_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'headphones_charger',
      label: 'Headphones Charger',
      iconName: 'battery_charging_full_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'keyboard',
      label: 'Keyboard',
      iconName: 'keyboard_rounded',
      baseQuantity: 1,
      requiredPurposes: ['business'],
    ),
    PackingItem(
      id: 'mouse',
      label: 'Mouse',
      iconName: 'mouse_rounded',
      baseQuantity: 1,
      requiredPurposes: ['business'],
    ),
    PackingItem(
      id: 'camera',
      label: 'Camera',
      iconName: 'camera_alt_rounded',
      baseQuantity: 1,
      requiredPurposes: ['vacation'],
    ),
    PackingItem(
      id: 'camera_charger',
      label: 'Camera Charger',
      iconName: 'battery_charging_full_rounded',
      baseQuantity: 1,
      requiredPurposes: ['vacation'],
    ),
  ],
  'photography': [
    PackingItem(
      id: 'batteries',
      label: 'Batteries',
      iconName: 'battery_std_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'battery_charger',
      label: 'Battery Charger',
      iconName: 'battery_charging_full_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'camera_bag',
      label: 'Camera Bag',
      iconName: 'camera_alt_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'lenses',
      label: 'Lenses',
      iconName: 'camera_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'memory_cards',
      label: 'Memory Cards',
      iconName: 'sd_card_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'tripod',
      label: 'Tripod',
      iconName: 'trip_origin_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'remote_shutter',
      label: 'Remote Shutter',
      iconName: 'radio_button_checked_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'cleaning_kit',
      label: 'Cleaning Kit',
      iconName: 'cleaning_services_rounded',
      baseQuantity: 1,
    ),
  ],
  'beach': [
    PackingItem(
      id: 'after_sun_care',
      label: 'After Sun Care',
      iconName: 'wb_sunny_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'beach_bag',
      label: 'Beach Bag',
      iconName: 'beach_access_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'beach_towel',
      label: 'Beach Towel',
      iconName: 'beach_access_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'beach_umbrella',
      label: 'Beach Umbrella',
      iconName: 'beach_access_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'hat',
      label: 'Hat',
      iconName: 'emoji_people_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'sunglasses',
      label: 'Sunglasses',
      iconName: 'remove_red_eye_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'sunscreen',
      label: 'Sunscreen',
      iconName: 'wb_sunny_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'sandals',
      label: 'Sandals',
      iconName: 'directions_walk_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'flip_flops',
      label: 'Flip Flops',
      iconName: 'directions_walk_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'water_resistant_phone_pouch',
      label: 'Water Resistant Phone Pouch',
      iconName: 'phone_android_rounded',
      baseQuantity: 1,
    ),
  ],
  'gym': [
    PackingItem(
      id: 'gym_shoes',
      label: 'Gym Shoes',
      iconName: 'fitness_center_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'gym_shorts',
      label: 'Gym Shorts',
      iconName: 'fitness_center_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'gym_shirts',
      label: 'Gym Shirts',
      iconName: 'fitness_center_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'gym_towel',
      label: 'Gym Towel',
      iconName: 'spa_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'padlock',
      label: 'Padlock',
      iconName: 'lock_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'water_bottle',
      label: 'Water Bottle',
      iconName: 'water_drop_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'gym_supplements',
      label: 'Gym Supplements',
      iconName: 'food_bank_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'sweatband',
      label: 'Sweatband',
      iconName: 'sports_gymnastics_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'workout_gloves',
      label: 'Workout Gloves',
      iconName: 'sports_gymnastics_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'gym_bag',
      label: 'Gym Bag',
      iconName: 'fitness_center_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'gym_key_card',
      label: 'Gym Key/Card',
      iconName: 'vpn_key_rounded',
      baseQuantity: 1,
    ),
  ],
  'formal': [
    // Male formal items
    PackingItem(
      id: 'dress_shirt',
      label: 'Dress Shirt',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'dress_shoes',
      label: 'Dress Shoes',
      iconName: 'directions_run_rounded',
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'suit_jacket',
      label: 'Suit Jacket',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'suit_pants',
      label: 'Suit Pants',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'tie',
      label: 'Tie',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'belt',
      label: 'Belt',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'dress_pants',
      label: 'Dress Pants',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      applicableProfiles: ['male'],
    ),
    PackingItem(
      id: 'socks_formal',
      label: 'Socks',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
    ),
    // Female formal items
    PackingItem(
      id: 'formal_dress',
      label: 'Formal Dress',
      iconName: 'dry_cleaning_rounded',
      baseQuantity: 1,
      applicableProfiles: ['female'],
    ),
    PackingItem(
      id: 'heels',
      label: 'Heels',
      iconName: 'directions_run_rounded',
      baseQuantity: 1,
      applicableProfiles: ['female'],
    ),
    PackingItem(
      id: 'clutch',
      label: 'Clutch',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      applicableProfiles: ['female'],
    ),
  ],
  //* Done
  'cycling': [
    PackingItem(
      id: 'water_bottle',
      label: 'Water Bottle',
      iconName: 'water_drop_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'cycling_helmet',
      label: 'Cycling Helmet',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'cycling_jersey',
      label: 'Cycling Jersey',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'cycling_shorts',
      label: 'Cycling Shorts',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'bike_gloves',
      label: 'Bike Gloves',
      iconName: 'pan_tool_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'bike_lock',
      label: 'Bike Lock',
      iconName: 'lock_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'tire_pump',
      label: 'tire Pump',
      iconName: 'tire_repair_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'bike_multi_tool',
      label: 'Bike multi-tool',
      iconName: 'build_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'energy_bars',
      label: 'Energy Bars',
      iconName: 'bolt_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'spare_tubes',
      label: 'Spare Tubes',
      iconName: 'build_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'water_proof_gear',
      label: 'Water Proof Gear',
      iconName: 'cloudy_snowing',
      baseQuantity: 1,
    ),
  ],
  //* Done
  'hiking': [
    PackingItem(
      id: 'hiking_boots',
      label: 'Hiking Boots',
      iconName: 'directions_walk_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'backpack',
      label: 'Backpack',
      iconName: 'backpack_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'rain_jacket',
      label: 'Rain Jacket',
      iconName: 'cloudy_snowing',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'hiking_poles',
      label: 'Hiking Poles',
      iconName: 'accessibility_new_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'compass',
      label: 'Compass',
      iconName: 'explore_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'binoculars',
      label: 'Binoculars',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'first_aid_kit',
      label: 'First Aid Kit',
      iconName: 'healing_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'insect_repellent',
      label: 'Insect Repellent',
      iconName: 'bug_report_rounded',
      baseQuantity: 1,
    ),
  ],
  // Todo: fix label to be "Winter Activities"
  //* Done
  'winterActivities': [
    PackingItem(
      id: 'snow_jacket',
      label: 'Snow Jacket',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
    PackingItem(
      id: 'snow_pants',
      label: 'Snow Pants',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
    PackingItem(
      id: 'winter_gloves',
      label: 'Winter Gloves',
      iconName: 'pan_tool_rounded',
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
    PackingItem(
      id: 'winter_boots',
      label: 'Winter Boots',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
    PackingItem(
      id: 'beanie',
      label: 'Beanie',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
    PackingItem(
      id: 'ski_goggles',
      label: 'Ski Goggles',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
    PackingItem(
      id: 'ski_helmet',
      label: 'Ski Helmet',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
    PackingItem(
      id: 'face_mask',
      label: 'Face Mask',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
    PackingItem(
      id: 'base_layers',
      label: 'Base Layers',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
    PackingItem(
      id: 'ski_gear',
      label: 'Ski Gear',
      iconName: 'downhill_skiing_rounded',
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
    PackingItem(
      id: 'snowboard_gear',
      label: 'Snowboard Gear',
      iconName: 'snowboarding_rounded',
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
    PackingItem(
      id: 'lip_balm',
      label: 'Lip Balm',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
    PackingItem(
      id: 'hand_warmers',
      label: 'Hand Warmers',
      iconName: 'pan_tool_rounded',
      baseQuantity: 1,
      requiredWeathers: ['cold'],
    ),
  ],
  //* Done
  'fishing': [
    PackingItem(
      id: 'fishing_rod',
      label: 'Fishing Rod',
      iconName: 'anchor_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'tackle_box',
      label: 'Tackle Box',
      iconName: 'business_center_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'fishing_hat',
      label: 'Fishing Hat',
      iconName: 'emoji_people_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'waders',
      label: 'Waders',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'fishing_vest',
      label: 'Fishing Vest',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
    ),
    PackingItem(
      id: 'fishing_net',
      label: 'Fishing Net',
      iconName: 'checkroom_rounded',
      baseQuantity: 1,
    ),
  ],
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
