import 'package:flutter/material.dart';

class ThemeStatisticheShop {
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
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle textStyle2() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 15.0,
      letterSpacing: 1.0,
    );
  }

  TextStyle textStyle4() {
    return const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );
  }

  Map<String, String> functions() {
    return {
      'STATISTICHE': 'StatisticheShop', //
      'DATI ACCOUNT': 'DatiAccount', //
      'MESSAGGI': 'MessaggiAdmin', //
      'DISPENSA': 'DispensaAdmin', //
      'MENU': 'MenuAdmin', //
      'CREA ACCOUNT': 'DatiAccount', //
    };
  }

  ButtonStyle buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
    );
  }
}
