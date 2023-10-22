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
    initDispensaz();
  }

void initDispensaz() async {
    map = await controller.takeAllPiattiETipologie();
    setState(() {
      map = map;
    });
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
          //SafeArea serve per garantire che non vengano sovrapposte cose doc:https://api.flutter.dev/flutter/widgets/SafeArea-class.html

          child: ListView(
            //ListView permette di fare quello che fa column solo già scrollabile
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
                      //qui

                      FutureBuilder(
                      future: controller.takeAllPiattiETipologie(), // Assuming getPiatti returns a Future
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          // Display a loading indicator while waiting for data
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          // Display an error message if there's an error
                          return Text('Error: ${snapshot.error}');
                        } else {
                          // Display the data when available
                          map = snapshot.data!; // Assuming the data type is List<Piatto>
                          return Column(
                            children: [
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
                              const SizedBox(height: 20.0),
                              WhiteLine(),
                            ],
                          );
                        }
                      },
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
