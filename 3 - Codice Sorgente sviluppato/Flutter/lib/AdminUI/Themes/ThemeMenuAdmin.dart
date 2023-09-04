import 'package:flutter/material.dart';

class ThemeMenuAdmin {
  static TextStyle textStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle textStyle2() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    );
  }

  static List<String> menuTitles() {
    return ['PRIMI', 'SECONDI', 'CONTORNI', 'DOLCI', 'BEVANDE'];
  }
}
