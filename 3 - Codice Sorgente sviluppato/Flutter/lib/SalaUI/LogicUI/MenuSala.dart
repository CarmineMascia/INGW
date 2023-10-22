import 'package:flutter/material.dart';
import 'package:prova1/ClientsWidgets/CustomDropdown.dart';
import 'package:prova1/ClientsWidgets/ListMessaggi.dart';

import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/Controller.dart';

import 'package:prova1/Model/Messaggio.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/Model/Sala.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/Model/Tavolo.dart';
import 'package:prova1/SalaUI/LogicUI/Resoconto.dart';
import 'package:prova1/SalaUI/Themes/ThemeHomeSala.dart';
import 'package:prova1/SalaWidgets/AppBarLayoutSala.dart';
import 'package:prova1/SalaWidgets/CustomDropdownSala.dart';
import 'package:prova1/SalaWidgets/MenuWidgetSala.dart';
import 'package:prova1/SalaWidgets/SearchBarWidgetSala.dart';
import 'package:prova1/SupervisoreUI/Themes/ThemeMessaggiSupervisore.dart';
import 'package:prova1/SupervisoreUI/Themes/ThemeRicevuteSupervisore.dart';

import 'package:prova1/SupervisoreWidget/AppBarLayoutSupervisore.dart';
import 'package:prova1/SupervisoreWidget/ControllerUISupervisore.dart';
import 'package:prova1/SupervisoreWidget/ListTavoli.dart';
import 'package:prova1/SupervisoreWidget/SearchBarWidgetSupervisore.dart';
import '../../ClientsWidgets/ThemeMain.dart';



class HomeSala extends StatefulWidget {
  final Sala sala;
  const HomeSala({super.key, required this.sala});
  _HomeSalaState createState() => _HomeSalaState();
}

class _HomeSalaState extends State<HomeSala> {
  List<Tavolo> tavoli = [];
  Map<String, List<Piatti>> categoriePiatti = {};
  Map<String, List<Piatti>> initCategoriePiatti = {};
  Map<Piatti, TextEditingController> ordine = {};
  Controller controller = Controller();
  ThemeMain theme = ThemeMain();
  AppBarLayoutSala AppBar = AppBarLayoutSala();
  ThemeHomeSala themeHomeSala = ThemeHomeSala();
  late MenuWidgetSala menuWidgetSala;
  late CustomDropdownSala customDropdown;
  //Admin admin = Controller().takeAdminInfoDB();

  @override
  void initState() {
    super.initState();
    // Carica i dati iniziali per la dispensa
    initSala();
    
    
    
    //initMessaggi = Controller().TakeMessages();
  }

  void initSala() async{
    tavoli = await controller.TakeTavoli();
    setState(() {
      tavoli = tavoli;
    });
    initCategoriePiatti = await controller.takeAllPiattiETipologie();

    setState(() {
      categoriePiatti = initCategoriePiatti;
      initCategoriePiatti = initCategoriePiatti;
      ordine = makeOrdine(categoriePiatti);
    });
  }

  @override
  Widget build(BuildContext context) {
    //controller.setToZeroNotifications();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar.buildAppBar(context,widget.sala),
      body: theme.buildDecoratedBox(
        SafeArea(
          child: ListView(
            children: [
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
                        "ORDINAZIONI",
                        style: themeHomeSala.textStyle(),
                      ),
                      const SizedBox(height: 5.0),
                      WhiteLine(),
                      const SizedBox(height: 20.0),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SearchBarWidgetSala(
                                update: update,
                                categoriePiatti: initCategoriePiatti),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: createCustomDropdown(tavoli),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: menuWidgetSala = MenuWidgetSala(
                              categoriePiatti: categoriePiatti,
                              ordine: ordine,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      WhiteLine(),
                      const SizedBox(height: 10.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                            style: themeHomeSala.buttonStyle(),
                            onPressed: () {
                              //takeInfoOrdine();
                              String? tavolo =
                                  customDropdown.getSelectedValue();
                              Map<Piatti, String> effectedOrdine =
                                  getEffectiveOrdine();
                              if (effectedOrdine.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('ERRORE'),
                                  ),
                                );
                              } else {
                                if (tavolo != null) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Resoconto(
                                            sala: widget.sala,
                                            ordine: effectedOrdine,
                                            tavolo: Tavolo(tavolo, true),
                                          )));
                                }
                              }
                            },
                            child: const Text("RESOCONTO")),
                      )
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

  void update(Map<String, List<Piatti>> newCategoriePiatti) {
    /*Map<Piatti, TextEditingController> ordineParziale =
        menuWidgetSala.getOrdine();
    Map<Piatti, String> currentValue = setCurrentValue(ordineParziale);*/
    setState(() {
      categoriePiatti = newCategoriePiatti;
    });
    //menuWidgetSala.setTextEditingController(currentValue);
  }

  createCustomDropdown(List<Tavolo> tavoli) {
    List<String> tavoliAttivi = [];
    for (int i = 0; i < tavoli.length; i++) {
      if (tavoli.elementAt(i).attivo == true) {
        tavoliAttivi.add(tavoli.elementAt(i).nome);
      }
    }
    
    customDropdown =
        CustomDropdownSala(options: tavoliAttivi, hint: tavoliAttivi.first);
    return customDropdown;
  }

  /*Map<Piatti, TextEditingController> takeInfoOrdine() {
    Map<Piatti, TextEditingController> ordine = menuWidgetSala.getOrdine();
    return ordine;
  }*/

  Map<Piatti, String> getEffectiveOrdine() {
    Map<Piatti, String> currentValue = {};
    for (int i = 0; i < ordine.length; i++) {
      if (int.parse(ordine.values.elementAt(i).text) > 0) {
        currentValue[ordine.keys.elementAt(i)] =
            ordine.values.elementAt(i).text;
      }
    }
    return currentValue;
  }

  Map<Piatti, TextEditingController> makeOrdine(
      Map<String, List<Piatti>> categoriePiatti) {
    Map<Piatti, TextEditingController> currentOrdine = {};
    for (var i = 0; i < categoriePiatti.length; i++) {
      List<Piatti> currentPiatti = categoriePiatti.values.elementAt(i);
      for (var j = 0; j < currentPiatti.length; j++) {
        currentOrdine[currentPiatti.elementAt(j)] =
            TextEditingController(text: "0");
      }
    }
    return currentOrdine;
  }
}
