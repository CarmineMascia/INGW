import 'package:flutter/material.dart';
import 'package:prova1/ClientsWidgets/SearchBarWidget.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/Controller.dart';
import 'package:prova1/Controller/ControllerCucina/ControllerCucina.dart';

import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/SupervisoreUI/LogicUI/AggiungiIngredienteCucina.dart';
import 'package:prova1/SupervisoreUI/LogicUI/ListDispensaSupervisore.dart';
import 'package:prova1/SupervisoreUI/Themes/ThemeDispensaSupervisore.dart';
import 'package:prova1/SupervisoreWidget/AppBarLayoutSupervisore.dart';
import 'package:prova1/SupervisoreWidget/ControllerUISupervisore.dart';
import '../../ClientsWidgets/ThemeMain.dart';

class DispensaSupervisore extends StatefulWidget {
  final Supervisore supervisore;
  const DispensaSupervisore({super.key, required this.supervisore});
  @override
  _DispensaSupervisoreState createState() => _DispensaSupervisoreState();
}

class _DispensaSupervisoreState extends State<DispensaSupervisore> {
  List<Ingrediente> dispensa = []; // Inizializza con i dati iniziali
  List<Ingrediente> initDispensa = []; // Dispensa completa
  ControllerCucina controllerCucina = ControllerCucina();
  ThemeMain theme = ThemeMain();
  AppBarLayoutSupervisore AppBar = AppBarLayoutSupervisore();
  ThemeDispensaSupervisore themeDispensaCucina = ThemeDispensaSupervisore();
  Controller controller = Controller();
  ControllerUISupervisore controllerUISupervisore = ControllerUISupervisore();

  @override
  void initState() {
    super.initState();
    // Carica i dati iniziali per la dispensa
    dispensa = controller.TakeDispensa();
    initDispensa = controller.TakeDispensa();
  }

  void updateDispensa(List<Ingrediente> newDispensa) {
    setState(() {
      dispensa = newDispensa;
    });
  }

  void updateInitDispensa(List<Ingrediente> newInitDispensa) {
    setState(() {
      initDispensa = newInitDispensa;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar.buildAppBar(context, widget.supervisore),
      body: theme.buildDecoratedBox(
        SafeArea(
          child: ListView(
            children: [
              controllerUISupervisore.buttonBarSupervisore(
                  context, widget.supervisore),
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
                        "DISPENSA",
                        style: themeDispensaCucina.textStyle(),
                      ),
                      const SizedBox(height: 5.0),
                      WhiteLine(),
                      const SizedBox(height: 20.0),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: SearchBarWidget(
                              update: updateDispensa,
                              dispensa: initDispensa,
                            ),
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          Container(
                            height: 350,
                            child: ListDispensaSupervisore(
                                dispensa: dispensa,
                                update: updateInitDispensa,
                                supervisore: widget.supervisore),
                            //deve essere modificata initDispensa alla modifica nel list , passare una funzione che modifica initDispensa
                          )
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      WhiteLine(),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: /*ElevatedButton(
                            child: Text(
                              "AGGIUNGI",
                              style: themeDispensaCucina.textStyle4(),
                            ),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              minimumSize: const Size(200, 40),
                            ),
                          ),*/
                              IconButton(
                                  iconSize: 40.0,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AggiungiIngredienteSupervisore(
                                                  supervisore:
                                                      widget.supervisore,
                                                )));
                                    // Funzione da eseguire quando il pulsante viene premuto
                                  },
                                  icon: themeDispensaCucina.plusIcon()),
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
