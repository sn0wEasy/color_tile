import 'package:flutter/material.dart';

// firebase realtime database URL
String databaseURL =
    'https://artile-24962-default-rtdb.asia-southeast1.firebasedatabase.app/';

// container property
double kContainerWidth = 400;
double kContainerHeight = 400;

// tile container property
double kTileContainerWidth = 299;
double kTileContainerHeight = 82;

// tile property
double kTileSize = 38.2;
double kBorderRadius = 8;
double kXConst = 1.2 + (kContainerWidth - kTileContainerWidth) / 2;
double kYConst = 1.5 + (kContainerHeight - kTileContainerHeight) / 2;

// tile color palette
Color kYellow = const Color.fromARGB(128, 252, 200, 0);
Color kTeal = const Color.fromARGB(128, 0, 160, 184);
Color kBlue = const Color.fromARGB(128, 12, 173, 231);
Color kRed = const Color.fromARGB(128, 230, 1, 19);
Color kPink = const Color.fromARGB(128, 233, 81, 137);
Color kGrey = const Color.fromARGB(255, 163, 168, 170);
List<Color> kMovableColorList = <Color>[kYellow, kTeal, kBlue, kRed, kPink];

// constant block configuration
List<Map<String, dynamic>> kConstantBlockProfile = <Map<String, dynamic>>[
  {'initialX': 41.0, 'initialY': 0.0, 'blockColor': kGrey},
  {'initialX': 130.0, 'initialY': 0.0, 'blockColor': kGrey},
  {'initialX': 175.0, 'initialY': 0.0, 'blockColor': kGrey},
  {'initialX': 232.0, 'initialY': 0.0, 'blockColor': kGrey},
  {'initialX': 20.0, 'initialY': 41.0, 'blockColor': kGrey},
  {'initialX': 89.1, 'initialY': 41.0, 'blockColor': kGrey},
  {'initialX': 185.0, 'initialY': 41.0, 'blockColor': kGrey},
  {'initialX': 258.0, 'initialY': 41.0, 'blockColor': kGrey},
];

// movable block configuration
List<Map<String, dynamic>> kMovableBlockProfile = <Map<String, dynamic>>[
  {'initialX': 0.2, 'initialY': 0.0, 'blockColor': kYellow},
  {'initialX': 48.0, 'initialY': 0.0, 'blockColor': kTeal},
  {'initialX': 89.2, 'initialY': 0.0, 'blockColor': kBlue},
  {'initialX': 144.0, 'initialY': 0.0, 'blockColor': kRed},
  {'initialX': 216.0, 'initialY': 0.0, 'blockColor': kBlue},
  {'initialX': 258.0, 'initialY': 0.0, 'blockColor': kTeal},
  {'initialX': 0.0, 'initialY': 41.0, 'blockColor': kBlue},
  {'initialX': 48.0, 'initialY': 41.0, 'blockColor': kPink},
  {'initialX': 130.8, 'initialY': 41.0, 'blockColor': kTeal},
  {'initialX': 172.0, 'initialY': 41.0, 'blockColor': kYellow},
  {'initialX': 217.0, 'initialY': 41.0, 'blockColor': kRed},
];
