/*import 'package:flutter/material.dart';

import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/Controller.dart';
import 'package:prova1/Controller/ControllerSupervisore/ControllerSupervisore.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/SupervisoreUI/Themes/ThemeMenuSupervisore.dart';
import 'package:prova1/SupervisoreWidget/AppBarLayoutSupervisore.dart';
import 'package:prova1/SupervisoreWidget/ControllerUISupervisore.dart';
import 'package:prova1/SupervisoreWidget/MenuItemSupervisore.dart';
import '../../ClientsWidgets/ThemeMain.dart';

class MenuSupervisore extends StatelessWidget {
  @override
  final Supervisore supervisore;
  ControllerSupervisore controllerAdmin = ControllerSupervisore();
  Controller controller = Controller();
  ControllerUISupervisore controllerUI = ControllerUISupervisore();
  ThemeMain theme = ThemeMain();
  AppBarLayoutSupervisore AppBar = AppBarLayoutSupervisore();
  ThemeMenuSupervisore themeMenuAdmin = ThemeMenuSupervisore();
  Map<String, List<Piatti>> map = {};

  MenuSupervisore({super.key, required this.supervisore});

  @override
  Widget build(BuildContext context) {
    map = controller.takeAllPiattiETipologie();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar.buildAppBar(context, supervisore),
      body: theme.buildDecoratedBox(
        SafeArea(
          //SafeArea serve per garantire che non vengano sovrapposte cose doc:https://api.flutter.dev/flutter/widgets/SafeArea-class.html

          child: ListView(
            //ListView permette di fare quello che fa column solo già scrollabile
            children: [
              controllerUI.buttonBarSupervisore(context, supervisore),
              const SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  color: const Color.fromRGBO(255, 255, 255, 0.4),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      WhiteLine(),
                      const SizedBox(height: 5.0),
                      Text(
                        "MENU",
                        style: themeMenuAdmin.textStyle(),
                      ),
                      const SizedBox(height: 5.0),
                      WhiteLine(),
                      const SizedBox(height: 20.0),
                      //qui

                      for (int i = 0; i < 5; i += 2)
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(60.0),
                            child: Row(
                              children: [
                                MenuItemSupervisore(
                                  nome: map.keys.elementAt(i),
                                  piatti: map.values.elementAt(i),
                                  supervisore: supervisore,
                                ),
                                if (i < 4) SizedBox(width: 300),
                                // Spazio tra i container
                                if (i < 4)
                                  MenuItemSupervisore(
                                    nome: map.keys.elementAt(i + 1),
                                    piatti: map.values.elementAt(i + 1),
                                    supervisore: supervisore,
                                  ),
                              ],
                            ),
                          ),
                        ),

                      const SizedBox(height: 20.0),
                      WhiteLine(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';

import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/Controller.dart';
import 'package:prova1/Controller/ControllerSupervisore/ControllerSupervisore.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/SupervisoreUI/Themes/ThemeMenuSupervisore.dart';
import 'package:prova1/SupervisoreWidget/AppBarLayoutSupervisore.dart';
import 'package:prova1/SupervisoreWidget/ControllerUISupervisore.dart';
import 'package:prova1/SupervisoreWidget/MenuItemSupervisore.dart';
import '../../ClientsWidgets/ThemeMain.dart';

class MenuSupervisore extends StatefulWidget {
  final Supervisore supervisore;
  Controller controller = Controller();
  //Map<String, List<Piatti>> map = {};

  MenuSupervisore({Key? key, required this.supervisore}) : super(key: key);

  @override
  _MenuSupervisoreState createState() => _MenuSupervisoreState();
}

class _MenuSupervisoreState extends State<MenuSupervisore> {
  ControllerSupervisore controllerAdmin = ControllerSupervisore();
  Controller controller = Controller();
  ControllerUISupervisore controllerUI = ControllerUISupervisore();
  ThemeMain theme = ThemeMain();
  AppBarLayoutSupervisore AppBar = AppBarLayoutSupervisore();
  ThemeMenuSupervisore themeMenuAdmin = ThemeMenuSupervisore();
  Map<String, List<Piatti>> map = {};

  @override
  void initState() {
    map = controller.takeAllPiattiETipologie();
  }

  void eliminaCategoria(String categoria) {
    setState(() {
      map.remove(categoria);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar.buildAppBar(context, widget.supervisore),
      body: theme.buildDecoratedBox(
        SafeArea(
          // Resto del codice rimane invariato
          child: ListView(
            // ListView permette di fare quello che fa Column solo già scrollabile
            children: [
              controllerUI.buttonBarSupervisore(context, widget.supervisore),
              const SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  color: const Color.fromRGBO(255, 255, 255, 0.4),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      WhiteLine(),
                      const SizedBox(height: 5.0),
                      Text(
                        "MENU",
                        style: themeMenuAdmin.textStyle(),
                      ),
                      const SizedBox(height: 5.0),
                      WhiteLine(),
                      const SizedBox(height: 20.0),
                      // Qui il resto del tuo codice rimane invariato
                      // ...

                      for (int i = 0; i < map.keys.length; i += 2)
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(60.0),
                            child: Row(
                              children: [
                                MenuItemSupervisore(
                                  nome: map.keys.elementAt(i),
                                  piatti: map.values.elementAt(i),
                                  supervisore: widget.supervisore,
                                  tipologie: map.keys.toList(),
                                  eliminaCategoria: eliminaCategoria,
                                ),
                                if (i + 1 < map.keys.length)
                                  SizedBox(width: 300),
                                // Spazio tra i container
                                if (i + 1 < map.keys.length)
                                  MenuItemSupervisore(
                                    nome: map.keys.elementAt(i + 1),
                                    piatti: map.values.elementAt(i + 1),
                                    supervisore: widget.supervisore,
                                    tipologie: map.keys.toList(),
                                    eliminaCategoria: eliminaCategoria,
                                  ),
                              ],
                            ),
                          ),
                        ),

                      const SizedBox(height: 50.0),
                      WhiteLine(),
                      const SizedBox(height: 30.0),

                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: FloatingActionButton(
                            onPressed: () {
                              TextEditingController text =
                                  TextEditingController();
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                        'Inserisci il nome della nuova categoria'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          controller: text,
                                        ),
                                        const SizedBox(
                                          height: 20.0,
                                        ),
                                        ElevatedButton(
                                            style: themeMenuAdmin.buttonStyle(),
                                            onPressed: () {
                                              String newCategoria = text.text;
                                              if (newCategoria.isEmpty) {
                                                return; // Gestisci il caso in cui la stringa sia vuota
                                              }
                                              newCategoria = newCategoria
                                                      .substring(0, 1)
                                                      .toUpperCase() +
                                                  newCategoria
                                                      .substring(1)
                                                      .toLowerCase();
                                              if (map.keys
                                                      .contains(newCategoria) ==
                                                  false) {
                                                bool result = controller
                                                    .inserisciCategoria(
                                                        newCategoria);
                                                if (!result) {
                                                  SnackBar snackBar =
                                                      const SnackBar(
                                                          content: Text(
                                                              'ERRORE NELL\'AGGIUNTA DELLA CATEGORIA'));
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                } else {
                                                  setState(() {
                                                    map[newCategoria] = [];
                                                  });
                                                }
                                              }
                                            },
                                            child: const Text('CREA')),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            child: Icon(Icons.add),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
