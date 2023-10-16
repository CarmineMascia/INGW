import 'package:flutter/material.dart';
import 'package:prova1/AdminWidgets/AppBarLayout.dart';
import 'package:prova1/AdminWidgets/MenuItemAdmin.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/Controller.dart';
import 'package:prova1/Model/Piatti.dart';
import '../../ClientsWidgets/ThemeMain.dart';
import 'package:prova1/Model/Admin.dart';
import 'package:prova1/AdminWidgets/ControllerUI.dart';
import 'package:prova1/Controller/ControllerAdmin/ControllerAdmin.dart';
import '../Themes/ThemeMenuAdmin.dart';

class MenuAdmin extends StatefulWidget {
  final Admin admin;
  Controller controller = Controller();
  //Map<String, List<Piatti>> map = {};

  MenuAdmin({Key? key, required this.admin}) : super(key: key);

  @override
  _MenuAdminState createState() => _MenuAdminState();
}

class _MenuAdminState extends State<MenuAdmin> {
  ControllerAdmin controllerAdmin = ControllerAdmin();
  Controller controller = Controller();
  ControllerUI controllerUI = ControllerUI();
  ThemeMain theme = ThemeMain();
  AppBarLayout AppBar = AppBarLayout();
  ThemeMenuAdmin themeMenuAdmin = ThemeMenuAdmin();
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
      appBar: AppBar.buildAppBar(context, widget.admin),
      body: theme.buildDecoratedBox(
        SafeArea(
          // Resto del codice rimane invariato
          child: ListView(
            // ListView permette di fare quello che fa Column solo già scrollabile
            children: [
              controllerUI.ButtonBarAdmin(context, widget.admin),
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
                                MenuItemAdmin(
                                  nome: map.keys.elementAt(i),
                                  piatti: map.values.elementAt(i),
                                  admin: widget.admin,
                                  tipologie: map.keys.toList(),
                                  eliminaCategoria: eliminaCategoria,
                                ),
                                if (i + 1 < map.keys.length)
                                  SizedBox(width: 300),
                                // Spazio tra i container
                                if (i + 1 < map.keys.length)
                                  MenuItemAdmin(
                                    nome: map.keys.elementAt(i + 1),
                                    piatti: map.values.elementAt(i + 1),
                                    admin: widget.admin,
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
