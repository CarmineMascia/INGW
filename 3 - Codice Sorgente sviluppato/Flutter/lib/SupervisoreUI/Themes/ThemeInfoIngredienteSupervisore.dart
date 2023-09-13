import 'package:flutter/material.dart';

class ThemeInfoIngredienteSupervisore {
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

  BoxDecoration containerDecoration() {
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

  InputDecoration TextFieldDecoration() {
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

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      elevation: MaterialStateProperty.all<double>(0), //qui
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              10.0), // Imposta il bordo arrotondato desiderato
          side: const BorderSide(
              width: 0.5,
              color: Color.fromARGB(255, 0, 0, 0)), // Imposta il bordo nero
        ),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
          Colors.white), // Imposta lo sfondo bianco
      foregroundColor: MaterialStateProperty.all<Color>(
          Colors.black), // Imposta il testo nero
    );
  }

  TextStyle textStyle4() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 18.0,
    );
  }

  BoxDecoration myContainerStyle() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 0.5));
  }
}
