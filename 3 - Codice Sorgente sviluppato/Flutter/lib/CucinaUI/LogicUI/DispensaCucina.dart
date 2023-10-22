import 'package:flutter/material.dart';
import 'package:prova1/AdminWidgets/ListDispensa.dart';
import 'package:prova1/ClientsWidgets/SearchBarWidget.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/Controller.dart';
import 'package:prova1/Controller/ControllerCucina/ControllerCucina.dart';
import 'package:prova1/CucinaUI/LogicUI/AggiungiIngredienteCucina.dart';
import 'package:prova1/CucinaUI/Themes/ThemeDispensaCucina.dart';
import 'package:prova1/CucinaWidgets/AppBarLayoutCucina.dart';
import 'package:prova1/CucinaWidgets/ControllerUICucina.dart';
import 'package:prova1/CucinaWidgets/ListDispensaCucina.dart';
import 'package:prova1/Model/Cucina.dart';
import 'package:prova1/Model/Ingrediente.dart';
import '../../ClientsWidgets/ThemeMain.dart';
import 'package:prova1/Model/Admin.dart';

class DispensaCucina extends StatefulWidget {
  final Cucina cucina;
  const DispensaCucina({super.key, required this.cucina});
  @override
  _DispensaCucinaState createState() => _DispensaCucinaState();
}

class _DispensaCucinaState extends State<DispensaCucina> {
  List<Ingrediente> dispensa = []; // Inizializza con i dati iniziali
  List<Ingrediente> initDispensa = []; // Dispensa completa
  ControllerCucina controllerCucina = ControllerCucina();
  ThemeMain theme = ThemeMain();
  AppBarLayoutCucina AppBar = AppBarLayoutCucina();
  ThemeDispensaCucina themeDispensaCucina = ThemeDispensaCucina();
  Controller controller = Controller();
  ControllerUICucina controllerUICucina = ControllerUICucina();

  @override
  void initState() {
    super.initState();
    // Carica i dati iniziali per la dispensa
    initDispensaz();
  }

  void initDispensaz() async {
    dispensa = await controller.TakeDispensa();
    initDispensa = dispensa;
    setState(() {
      dispensa = dispensa;
    });
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
      appBar: AppBar.buildAppBar(context),
      body: theme.buildDecoratedBox(
        SafeArea(
          child: ListView(
            children: [
              controllerUICucina.ButtonBarCucina(context, widget.cucina),
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
                            child: ListDispensaCucina(
                                dispensa: dispensa,
                                update: updateInitDispensa,
                                cucina: widget.cucina),
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
                                                AggiungiIngredienteCucina(
                                                  cucina: widget.cucina,
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
