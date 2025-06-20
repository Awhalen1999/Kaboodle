import 'package:flutter/material.dart';

// todo: make colors darker here
final Map<String, Map<String, dynamic>> activityDetails = {
  "commonItems": {
    "label": "Common items",
    "svgPath": "assets/svg/checklist.svg",
    "color": Colors.blueGrey,
  },
  "clothes": {
    "label": "Clothes",
    "svgPath": "assets/svg/hawaiian-shirt.svg",
    "color": Colors.redAccent,
  },
  "toiletries": {
    "label": "Toiletries",
    "svgPath": "assets/svg/toothbrush.svg",
    "color": Colors.blue,
  },
  "electronics": {
    "label": "Electronics",
    "svgPath": "assets/svg/laptop.svg",
    "color": Colors.green,
  },
  "photography": {
    "label": "Photography",
    "svgPath": "assets/svg/camera.svg",
    "color": Colors.orange,
  },
  "beach": {
    "label": "Beach",
    "svgPath": "assets/svg/umbrella.svg",
    "color": Colors.amber,
  },
  "gym": {
    "label": "Gym",
    "svgPath": "assets/svg/dumbbell.svg",
    "color": Colors.deepOrange,
  },
  "formal": {
    "label": "Formal Event",
    "svgPath": "assets/svg/bow-tie.svg",
    "color": Colors.purple,
  },
  "cycling": {
    "label": "Cycling",
    "svgPath": "assets/svg/bicycle.svg",
    "color": Colors.teal,
  },
  "hiking": {
    "label": "Hiking",
    "svgPath": "assets/svg/mountain-route.svg",
    "color": Colors.brown,
  },
  "winterActivities": {
    "label": "Winter Activities",
    "svgPath": "assets/svg/winter-hat.svg",
    "color": Colors.cyan,
  },
  "fishing": {
    "label": "Fishing",
    "svgPath": "assets/svg/rod.svg",
    "color": Colors.indigo,
  },
};

final Map<String, Map<String, String>> accommodationDetails = {
  'hotel': {'label': 'Hotel/Resort', 'svgPath': 'assets/svg/hotel.svg'},
  'rentalHome': {'label': 'Rental Home', 'svgPath': 'assets/svg/cabin.svg'},
  'friendsFamily': {
    'label': 'Friends/Family',
    'svgPath': 'assets/svg/home.svg'
  },
  'camping': {'label': 'Camping', 'svgPath': 'assets/svg/camping.svg'},
  'cruise': {'label': 'Cruise', 'svgPath': 'assets/svg/cruise.svg'},
  'roadTrip': {'label': 'Road Trip', 'svgPath': 'assets/svg/camper-van.svg'},
};

final Map<String, Map<String, String>> purposeOfTripDetails = {
  'business': {'label': 'Business', 'svgPath': 'assets/svg/business.svg'},
  'vacation': {'label': 'Vacation', 'svgPath': 'assets/svg/vacation.svg'},
};

final Map<String, Map<String, String>> weatherConditionDetails = {
  'hot': {'label': 'Hot', 'svgPath': 'assets/svg/warm.svg'},
  'cold': {'label': 'Cold', 'svgPath': 'assets/svg/cool.svg'},
  'mild': {'label': 'Mild', 'svgPath': 'assets/svg/mild.svg'},
};

final Map<String, Map<String, String>> genderDetails = {
  'male': {'label': 'Male', 'svgPath': 'assets/svg/male.svg'},
  'female': {'label': 'Female', 'svgPath': 'assets/svg/female.svg'},
  'other': {'label': 'Other', 'svgPath': 'assets/svg/other.svg'},
};
