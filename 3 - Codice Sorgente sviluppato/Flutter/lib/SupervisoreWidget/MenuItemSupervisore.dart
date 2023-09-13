import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/LogicUI/AggiungiPiatto.dart';
import 'package:prova1/AdminUI/LogicUI/InfoPiatto.dart';
import 'package:prova1/AdminUI/Themes/ThemeMenuAdmin.dart';
import 'package:prova1/ClientsWidgets/AlertDialogCustom.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/ControllerAdmin/ControllerAdmin.dart';
import 'package:prova1/Model/Admin.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/SupervisoreUI/LogicUI/AggiungiPiattoSupervisore.dart';
import 'package:prova1/SupervisoreUI/LogicUI/InfoPiattoSupervisore.dart';
import 'package:prova1/SupervisoreUI/Themes/ThemeMenuSupervisore.dart';

class MenuItemSupervisore extends StatefulWidget {
  final String nome;
  final List<Piatti> piatti;
  ControllerAdmin controller = ControllerAdmin();
  final Supervisore supervisore;
  ThemeMenuSupervisore themeMenuSupervisore = ThemeMenuSupervisore();

  MenuItemSupervisore(
      {required this.nome, required this.piatti, required this.supervisore});

  @override
  _MenuItemSupervisoreState createState() => _MenuItemSupervisoreState();
}

class _MenuItemSupervisoreState extends State<MenuItemSupervisore> {
  int counter = 0;
  List<Piatti> piatti = [];
  bool isEditMode = false; // Modalità di modifica
  List<Piatti> selectedPiatti = []; // Lista dei piatti selezionati

  @override
  void initState() {
    // TODO: implement initState
    piatti = widget.piatti;
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.secondary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.secondary.withOpacity(0.15);
    final Color draggableItemColor = colorScheme.secondary;
    Widget proxyDecorator(
        Widget child, int index, Animation<double> animation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final double animValue = Curves.easeInOut.transform(animation.value);
          final double elevation = lerpDouble(0, 6, animValue)!;
          return Material(
            elevation: elevation,
            color: draggableItemColor,
            shadowColor: draggableItemColor,
            child: child,
          );
        },
        child: child,
      );
    }

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
            Text(widget.nome, style: widget.themeMenuSupervisore.textStyle()),
            const SizedBox(height: 10),
            BlackLine(),
            const SizedBox(height: 20),
            Expanded(
              child: /*SingleChildScrollView(
                child: Column(*/
                  ReorderableListView(
                onReorder: (oldIndex, newIndex) {
                  counter = counter + 1;
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final Piatti item = piatti.removeAt(oldIndex);
                    piatti.insert(newIndex, item);
                  });
                },
                children: List.generate(
                  piatti.length,
                  (index) => Column(
                    key: ValueKey(piatti[index]),
                    children: [
                      Row(
                        children: [
                          if (isEditMode)
                            Checkbox(
                              value: selectedPiatti.contains(piatti[index]),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == true) {
                                    selectedPiatti.add(piatti[index]);
                                  } else {
                                    selectedPiatti.remove(piatti[index]);
                                  }
                                });
                              },
                            ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => InfoPiattoSupervisore(
                                          supervisore: widget.supervisore,
                                          piatto: piatti.elementAt(index),
                                        )));
                              }, //mettere il Navigator
                              child: Text(
                                piatti.elementAt(index).nome,
                                style: widget.themeMenuSupervisore.textStyle2(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            piatti.elementAt(index).prezzo + '€',
                            style: widget.themeMenuSupervisore.textStyle2(),
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
            if (!isEditMode)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () async {
                        if (counter > 0) {
                          bool userConfirmed = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialogCustom();
                            },
                          );

                          if (userConfirmed == true) {
                            if (widget.controller
                                    .salvaNuovoOrdineDelMenu(piatti) ==
                                true) {
                              SnackBar snackBar = const SnackBar(
                                  content: Text(
                                      'Salvataggio avvenuto correttamente'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              SnackBar snackBar = const SnackBar(
                                  content: Text('Errore nel salvataggio'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        } else {
                          SnackBar snackBar = const SnackBar(
                              content: Text('Non hai fatto nessuna modifica'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      icon: Icon(Icons.save_rounded)),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isEditMode = true;
                      });
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AggiungiPiattoSupervisore(
                                supervisore: widget.supervisore,
                              )));
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            if (isEditMode)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isEditMode = false;
                      });
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  IconButton(
                    onPressed: () {
                      // Aggiungi logica per il pulsante cestino
                      setState(() {
                        widget.controller.DeletePiatti(selectedPiatti);
                        for (var item in selectedPiatti) {
                          piatti.remove(item);
                        }
                      });
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
