import 'package:flutter/material.dart';

class ThemeDatiAccount {
  static TextStyle textStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 25.0,
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
      'CREA ACCOUNT': 'CreaAccount', //
    };
  }
}
