import 'package:flutter/material.dart';

class ThemeMenuSupervisore {
  TextStyle textStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle textStyle2() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    );
  }

  List<String> menuTitles() {
    return ['PRIMI', 'SECONDI', 'CONTORNI', 'DOLCI', 'BEVANDE'];
  }
}
