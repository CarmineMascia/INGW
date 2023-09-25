import 'package:flutter/material.dart';

class ThemeDispensaAdmin {
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

  TextStyle textStyle3() {
    return const TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 15.0,
      fontWeight: FontWeight.normal,
    );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
    );
  }
}
