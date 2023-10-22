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

  ButtonStyle buttonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
    );
  }
}
