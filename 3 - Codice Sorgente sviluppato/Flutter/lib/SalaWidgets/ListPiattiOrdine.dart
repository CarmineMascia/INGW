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

class ListPiatti extends StatelessWidget {
  final List<PiattiScontrino> piatti;

  ListPiatti({required this.piatti});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: piatti.length,
      itemBuilder: (context, index) {
        return Column(children: [
          ItemListPiatti(piatto: piatti[index]),
          const SizedBox(height: 20.0),
        ]);
      },
    );
  }
}

class ItemListPiatti extends StatefulWidget {
  final PiattiScontrino piatto;
  ThemeRicevuteSupervisore themeRicevuteSupervisore =
      ThemeRicevuteSupervisore();

  ItemListPiatti({super.key, required this.piatto});
  ControllerUISupervisore controllerUISupervisore = ControllerUISupervisore();

  @override
  _ItemListPiattiState createState() => _ItemListPiattiState();
}

class _ItemListPiattiState extends State<ItemListPiatti> {
  ThemeRicevuteSupervisore themeRicevuteSupervisore =
      ThemeRicevuteSupervisore();

  ControllerSupervisore controller = ControllerSupervisore();

  @override
  Widget build(BuildContext context) {
    var prezzo = widget.piatto.prezzoPerUnita * widget.piatto.quantita;
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
                  style: themeRicevuteSupervisore.textStyle3(),
                ),
                const Spacer(
                  flex: 2,
                ),
                  Text(
                  'Quantitá: ${widget.piatto.quantita}',
                  style: themeRicevuteSupervisore.textStyle3(),
                ),
                    const Spacer(
                  flex: 1,
                ),
                  Text(
                  'Prezzo: $prezzo',
                  style: themeRicevuteSupervisore.textStyle3(),
                ),

                const SizedBox(
                  width: 20.0,
                ),
              ]
          ),)
        ],
      ),
    );
  }

}



