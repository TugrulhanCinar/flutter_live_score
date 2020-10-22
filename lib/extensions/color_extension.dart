import 'package:flutter/material.dart';

extension CustomColorScheme on ColorScheme {
  Color get appBarColor => const Color.fromARGB(255, 76, 175, 80);
  Color get  ligTitleBackGroundColor => const Color.fromARGB(255, 124, 179, 66);
  Color get info => const Color(0xFF17a2b8);
  Color get warning => const Color(0xFFffc107);
  Color get danger => const Color(0xFFdc3545);
}