import 'package:flutter/material.dart';

import '../resources/res_colors.dart';

class CustomMaterialColor {
  CustomMaterialColor._();

  static final blue = MaterialColor(
    _blueValue,
    <int, Color>{
      50: const Color(0xFFE0EEF7),
      100: const Color(0xFFB3D4EC),
      200: const Color(0xFF80B8E0),
      300: const Color(0xFF4D9BD3),
      400: const Color(0xFF2685C9),
      500: Color(_blueValue),
      600: const Color(0xFF0068BA),
      700: const Color(0xFF005DB2),
      800: const Color(0xFF0053AA),
      900: const Color(0xFF00419C),
    },
  );

  static final int _blueValue = ResColors.primary.value;
}
