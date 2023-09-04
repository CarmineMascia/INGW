import 'package:flutter/material.dart';

class ThemeCreaAccount {
  static TextStyle textStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle textStyle2() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 15.0,
      letterSpacing: 1.0,
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
}
