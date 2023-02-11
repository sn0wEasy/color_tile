import 'package:flutter/material.dart';

// container property
double kMagnificationWidth = 1;
double kMagnificationHeight = 2;
double kContainerWidth = 299 * kMagnificationWidth * 2;
double kContainerHeight = 82 * kMagnificationHeight * 2;

// tile property
double kTileSize = 38.2;
double kBorderRadius = 8;
double kXConst = 1.2 + kContainerWidth / (4 * kMagnificationWidth);
double kYConst = 1.5 +
    kContainerHeight *
        (2 * kMagnificationHeight - 1) /
        (4 * kMagnificationHeight);

// tile color palette
Color kYellow = const Color.fromARGB(128, 252, 200, 0);
Color kTeal = const Color.fromARGB(128, 0, 160, 184);
Color kBlue = const Color.fromARGB(128, 12, 173, 231);
Color kRed = const Color.fromARGB(128, 230, 1, 19);
Color kPink = const Color.fromARGB(128, 233, 81, 137);
Color kGrey = const Color.fromARGB(255, 163, 168, 170);

// constant block configuration
List<Map<String, dynamic>> kConstantBlockProfile = <Map<String, dynamic>>[
  {'initialX': 41, 'initialY': 0, 'blockColor': kGrey},
  {'initialX': 130, 'initialY': 0, 'blockColor': kGrey},
  {'initialX': 175, 'initialY': 0, 'blockColor': kGrey},
  {'initialX': 232, 'initialY': 0, 'blockColor': kGrey},
  {'initialX': 20, 'initialY': 41, 'blockColor': kGrey},
  {'initialX': 89.1, 'initialY': 41, 'blockColor': kGrey},
  {'initialX': 185, 'initialY': 41, 'blockColor': kGrey},
  {'initialX': 258, 'initialY': 41, 'blockColor': kGrey},
];

// movable block configuration
List<Map<String, dynamic>> kMovableBlockProfile = <Map<String, dynamic>>[
  {'initialX': 0.2, 'initialY': 0, 'blockColor': kYellow},
  {'initialX': 48, 'initialY': 0, 'blockColor': kTeal},
  {'initialX': 89.2, 'initialY': 0, 'blockColor': kBlue},
  {'initialX': 144, 'initialY': 0, 'blockColor': kRed},
  {'initialX': 216, 'initialY': 0, 'blockColor': kBlue},
  {'initialX': 258, 'initialY': 0, 'blockColor': kTeal},
  {'initialX': 0, 'initialY': 41, 'blockColor': kBlue},
  {'initialX': 48, 'initialY': 41, 'blockColor': kPink},
  {'initialX': 130.8, 'initialY': 41, 'blockColor': kTeal},
  {'initialX': 172, 'initialY': 41, 'blockColor': kYellow},
  {'initialX': 217, 'initialY': 41, 'blockColor': kRed},
];
