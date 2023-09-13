import 'package:flutter/material.dart';

class ThemeRicevuteSupervisore {
  TextStyle textStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle textStyle3() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 20.0,
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

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 0, 0, 0)
              .withOpacity(0.2), // Colore e opacità dell'ombra
          spreadRadius: 3, // Estensione dell'ombra
          blurRadius: 2, // Raggio di sfocatura
          offset: const Offset(
              0, 2), // Posizione dell'ombra (spostata leggermente in basso)
        ),
      ],
      borderRadius: BorderRadius.circular(5),
      color: Color.fromARGB(200, 255, 255, 255),
    );
  }
}
