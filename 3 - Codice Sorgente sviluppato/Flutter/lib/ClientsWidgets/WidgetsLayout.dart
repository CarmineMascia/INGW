import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/LogicUI/MessaggiAdmin.dart';
import 'package:prova1/AdminWidgets/BadgeWidget.dart';
import 'package:prova1/Connection/AdminConnessioneDB.dart';
import 'package:prova1/Model/Admin.dart';
import 'package:prova1/main.dart';

/*Widget WhiteLine() {
  return Container(
    height: 1.0,
    color: Colors.white, // Colore della linea bianca
  );
}*/

Widget WhiteLine() {
  return Container(
    height: 1.0, // Colore della linea bianca
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2), // Colore e opacità dell'ombra
          offset: Offset(0.0, 2.0), // Offset dell'ombra (dx, dy)
          blurRadius: 3.0, // Raggio di sfocatura dell'ombra
        ),
      ],
    ),
  );
}

Widget BlackLine() {
  return Container(
    height: 1.0,
    color: Colors.black, // Colore della linea bianca
  );
}
