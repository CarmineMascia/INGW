import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/LogicUI/AggiungiPiatto.dart';
import 'package:prova1/AdminUI/LogicUI/InfoPiatto.dart';
import 'package:prova1/AdminUI/Themes/ThemeMenuAdmin.dart';
import 'package:prova1/ClientsWidgets/AlertDialogCustom.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/ControllerAdmin/ControllerAdmin.dart';
import 'package:prova1/SalaUI/LogicUI/InfoPiattoSala.dart';
import 'package:prova1/SalaUI/Themes/ThemeMenuSala.dart';
import 'package:prova1/Model/Admin.dart';
import 'package:prova1/Model/Sala.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/SalaUI/LogicUI/InfoPiattoSala.dart';

class MenuItemSala extends StatelessWidget {
  final String nome;
  final List<Piatti> piatti;
  ThemeMenuSala themeMenuSala = ThemeMenuSala();
  Sala sala;

  MenuItemSala(
      {required this.nome, required this.piatti, required this.sala});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 500,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0)
                .withOpacity(0.2), // Colore e opacità dell'ombra
            spreadRadius: 3, // Estensione dell'ombra
            blurRadius: 2, // Raggio di sfocatura
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(235, 255, 255, 255),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlackLine(),
            const SizedBox(height: 5),
            Text(nome, style: themeMenuSala.textStyle()),
            const SizedBox(height: 10),
            BlackLine(),
            const SizedBox(height: 20),
            Expanded(
              child: /*SingleChildScrollView(
                child: Column(*/
                  ListView(
                children: List.generate(
                  piatti.length,
                  (index) => Column(
                    //key: ValueKey(piatti[index]),
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 10.0,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => InfoPiattoSala(
                                          sala: sala,
                                          piatto: piatti.elementAt(index),
                                        )));
                              }, //mettere il Navigator
                              child: Text(
                                piatti.elementAt(index).nome,
                                style: themeMenuSala.textStyle2(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            piatti.elementAt(index).prezzo + '€',
                            style: themeMenuSala.textStyle2(),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: BlackLine(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
