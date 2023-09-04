import 'package:flutter/material.dart';

class ThemeAggiungiPiatto {
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

  static BoxDecoration containerDecoration() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 0, 0, 0)
              .withOpacity(0.2), // Colore e opacità dell'ombra
          spreadRadius: 1, // Estensione dell'ombra
          blurRadius: 2, // Raggio di sfocatura
          offset: const Offset(0, 2),
        ),
      ],
      borderRadius: BorderRadius.circular(5),
      color: Color.fromARGB(200, 255, 255, 255),
    );
  }

  static InputDecoration TextFieldDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.black),
      ),
      hintText: 'Enter text...',
    );
  }
}