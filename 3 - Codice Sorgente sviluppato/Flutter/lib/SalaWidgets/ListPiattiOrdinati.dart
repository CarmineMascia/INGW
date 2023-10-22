import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/Themes/ThemeDispensaAdmin.dart';
import 'package:prova1/AdminUI/Themes/ThemeMessaggiAdmin.dart';
import 'package:prova1/ClientsWidgets/AlertDialogCustom.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/Controller.dart';
import 'package:prova1/Controller/ControllerAdmin/ControllerAdmin.dart';
import 'package:prova1/Controller/ControllerSupervisore/ControllerSupervisore.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Messaggio.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/Model/PiattiScontrino.dart';
import 'package:prova1/Model/Tavolo.dart';
import 'package:prova1/SupervisoreUI/Themes/ThemeRicevuteSupervisore.dart';
import 'package:prova1/SupervisoreWidget/ControllerUISupervisore.dart';

class ListPiattiOrdinati extends StatelessWidget {
  final Map<Piatti, String> ordine;

  ListPiattiOrdinati({required this.ordine});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ordine.length,
      itemBuilder: (context, index) {
        return Column(children: [
          ItemListPiattiOrdinati(
            piatto: ordine.keys.elementAt(index),
            quantita: ordine.values.elementAt(index),
          ),
          const SizedBox(height: 20.0),
        ]);
      },
    );
  }
}

class ItemListPiattiOrdinati extends StatefulWidget {
  final Piatti piatto;
  String quantita;
  ThemeRicevuteSupervisore themeRicevuteSupervisore =
      ThemeRicevuteSupervisore();

  ItemListPiattiOrdinati({required this.quantita, required this.piatto});
  ControllerUISupervisore controllerUISupervisore = ControllerUISupervisore();

  @override
  _ItemListPiattiOrdinatiState createState() => _ItemListPiattiOrdinatiState();
}

class _ItemListPiattiOrdinatiState extends State<ItemListPiattiOrdinati> {
  ThemeRicevuteSupervisore themeRicevuteSupervisore =
      ThemeRicevuteSupervisore();

  ControllerSupervisore controller = ControllerSupervisore();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: themeRicevuteSupervisore.myBoxDecoration(),
      width: 800,
      height: 70.0,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Row(
              children: [
                const SizedBox(width: 30.0),
                Text(
                  widget.piatto.nome,
                  style: themeRicevuteSupervisore.textStyle2(),
                ),
                const Spacer(
                  flex: 2,
                ),
                Text(
                  "Prezzo: ${widget.piatto.prezzo}",
                  style: themeRicevuteSupervisore.textStyle2(),
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  "Quantità: ${widget.quantita}",
                  style: themeRicevuteSupervisore.textStyle2(),
                ),
                const SizedBox(
                  width: 20.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
