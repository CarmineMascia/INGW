import 'package:flutter/material.dart';

class ThemeDatiAccountCucina {
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
      fontSize: 20.0,
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
