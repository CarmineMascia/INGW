import 'package:flutter/material.dart';

class ThemeDispensaSupervisore {
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

  BoxDecoration buttonsBoxDecoration() {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.black,
    );
  }

  TextStyle textStyle4() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 18.0,
    );
  }

  Widget plusIcon() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),

          width: 100.0, // Larghezza desiderata
          height: 100.0, // Altezza desiderata
        ),
        Center(
          child: Icon(
            Icons.add, // Icona "+"
            color: Colors.white, // Colore dell'icona
          ),
        ),
      ],
    );
  }
}
