import 'package:flutter/material.dart';
import 'package:prova1/ClientsWidgets/AlertDialogCustom.dart';

import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/CucinaUI/LogicUI/InfoIngredienteCucina.dart';
import 'package:prova1/CucinaUI/Themes/ThemeDispensaCucina.dart';
import 'package:prova1/Model/Cucina.dart';
import 'package:prova1/Model/Ingrediente.dart';

class ListDispensaCucina extends StatefulWidget {
  Cucina cucina;
  final List<Ingrediente> dispensa;
  void Function(List<Ingrediente>) update;

  ListDispensaCucina(
      {required this.dispensa, required this.update, required this.cucina});

  @override
  _ListDispensaCucinaState createState() => _ListDispensaCucinaState();
}

class _ListDispensaCucinaState extends State<ListDispensaCucina> {
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
          ItemListDispensaCucina(
              ingrediente: widget.dispensa[index],
              eliminaIngrediente: eliminaIngrediente,
              cucina: widget.cucina),
          const SizedBox(height: 20.0),
        ]);
      },
    );
  }
}

class ItemListDispensaCucina extends StatelessWidget {
  Cucina cucina;
  final Ingrediente ingrediente;
  ThemeDispensaCucina themeDispensaAdmin = ThemeDispensaCucina();
  void Function(Ingrediente) eliminaIngrediente;

  ItemListDispensaCucina(
      {required this.ingrediente,
      required this.eliminaIngrediente,
      required this.cucina});

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
                  width: 10.0,
                ),
                Text(
                  ingrediente.nome.toUpperCase(),
                  style: themeDispensaAdmin.textStyle2(),
                ),
                const SizedBox(
                  width: 50.0,
                ),
                Text(
                  'COSTO: ${ingrediente.costo}€',
                  style: themeDispensaAdmin.textStyle2(),
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  'QNT: ${ingrediente.quantita} Kg',
                  style: themeDispensaAdmin.textStyle2(),
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  "SCADENZA :${ingrediente.scadenza.day}/${ingrediente.scadenza.month}/${ingrediente.scadenza.year}",
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
                                InfoIngredienteCucina(
                                  cucina: cucina,
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
                "DESCRIZIONE: ",
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