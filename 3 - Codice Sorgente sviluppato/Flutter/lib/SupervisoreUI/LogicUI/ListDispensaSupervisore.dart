import 'package:flutter/material.dart';
import 'package:prova1/ClientsWidgets/AlertDialogCustom.dart';

import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';

import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/SupervisoreUI/LogicUI/InfoIngredienteSupervisore.dart';
import 'package:prova1/SupervisoreUI/Themes/ThemeDispensaSupervisore.dart';

class ListDispensaSupervisore extends StatefulWidget {
  Supervisore supervisore;
  final List<Ingrediente> dispensa;
  void Function(List<Ingrediente>) update;

  ListDispensaSupervisore(
      {required this.dispensa,
      required this.update,
      required this.supervisore});

  @override
  _ListDispensaSupervisoreState createState() =>
      _ListDispensaSupervisoreState();
}

class _ListDispensaSupervisoreState extends State<ListDispensaSupervisore> {
  List<Ingrediente> dispensa = [];

  @override
  void initState() {
    // TODO: implement initState
    dispensa = widget.dispensa;
  }

  void eliminaIngrediente(Ingrediente ingrediente) {
    setState(() {
      dispensa.removeWhere((element) => ingrediente.codice == element.codice);
      widget.update(dispensa);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.dispensa.length,
      itemBuilder: (context, index) {
        return Column(children: [
          ItemListDispensaSupervisore(
              ingrediente: widget.dispensa[index],
              eliminaIngrediente: eliminaIngrediente,
              supervisore: widget.supervisore),
          const SizedBox(height: 20.0),
        ]);
      },
    );
  }
}

class ItemListDispensaSupervisore extends StatelessWidget {
  Supervisore supervisore;
  final Ingrediente ingrediente;
  ThemeDispensaSupervisore themeDispensaAdmin = ThemeDispensaSupervisore();
  void Function(Ingrediente) eliminaIngrediente;

  ItemListDispensaSupervisore(
      {required this.ingrediente,
      required this.eliminaIngrediente,
      required this.supervisore});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0)
                .withOpacity(0.2), // Colore e opacità dell'ombra
            spreadRadius: 3, // Estensione dell'ombra
            blurRadius: 2, // Raggio di sfocatura
            offset: Offset(
                0, 2), // Posizione dell'ombra (spostata leggermente in basso)
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        color: Color.fromARGB(160, 255, 255, 255),
      ),
      height: 150.0,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 20.0,
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 15.0,
                ),
                Text(
                  ingrediente.nome,
                  style: themeDispensaAdmin.textStyle2(),
                ),
                const SizedBox(
                  width: 50.0,
                ),
                Text(
                  ingrediente.codice,
                  style: themeDispensaAdmin.textStyle2(),
                ),
                const SizedBox(
                  width: 300.0,
                ),
                Text(
                  ingrediente.quantita + ' Kg',
                  style: themeDispensaAdmin.textStyle2(),
                ),
                const SizedBox(
                  width: 300.0,
                ),
                Text(
                  ingrediente.scadenza.day.toString() +
                      "/" +
                      ingrediente.scadenza.month.toString() +
                      "/" +
                      ingrediente.scadenza.year.toString(),
                  style: themeDispensaAdmin.textStyle2(),
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                  height: 30.0,
                  width: 30.0,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => /*DispensaAdmin()*/
                                InfoIngredienteSupervisore(
                                  supervisore: supervisore,
                                  ingrediente: ingrediente,
                                )));
                      },
                      icon: Icon(
                        Icons.edit,
                      )),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30.0,
                  width: 30.0,
                  child: IconButton(
                      onPressed: () async {
                        //aggiungere l'alertDialog
                        bool userConfirmed = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialogCustom();
                          },
                        );
                        if (userConfirmed == true) {
                          eliminaIngrediente(ingrediente);
                        }
                      },
                      icon: Icon(
                        Icons.remove,
                      )),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          WhiteLine(),
          Row(
            children: [
              const SizedBox(width: 20.0),
              Text(
                "Descrizione: ",
                style: themeDispensaAdmin.textStyle2(),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 70.0,
                    padding: const EdgeInsets.all(5.0),
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Text(ingrediente.descrizione),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
