import 'package:flutter/material.dart';
//import 'package:prova1/DatiAccount.dart';

class ThemeMain {
  Widget buildDecoratedBox(Widget child) {
    return DecoratedBox(
      //position: DecorationPosition.background,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/sfondo.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }

  Widget buildLogoBox() {
    return Container(
      width: 350.0,
      height: 115.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/logo.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
