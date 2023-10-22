import 'package:flutter/material.dart';
import 'package:prova1/ClientsWidgets/ListMessaggi.dart';

import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/Controller.dart';

import 'package:prova1/Model/Messaggio.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/Model/Tavolo.dart';
import 'package:prova1/SupervisoreUI/Themes/ThemeMessaggiSupervisore.dart';
import 'package:prova1/SupervisoreUI/Themes/ThemeRicevuteSupervisore.dart';

import 'package:prova1/SupervisoreWidget/AppBarLayoutSupervisore.dart';
import 'package:prova1/SupervisoreWidget/ControllerUISupervisore.dart';
import 'package:prova1/SupervisoreWidget/ListTavoli.dart';
import 'package:prova1/SupervisoreWidget/SearchBarWidgetSupervisore.dart';
import '../../ClientsWidgets/ThemeMain.dart';

class RicevuteSupervisore extends StatefulWidget {
  @override
  final Supervisore supervisore;
  const RicevuteSupervisore({super.key, required this.supervisore});
  _RicevuteSupervisoreState createState() => _RicevuteSupervisoreState();
}

class _RicevuteSupervisoreState extends State<RicevuteSupervisore> {
  List<Tavolo> tavoli = [];
  List<Tavolo> initTavoli = [];
  ControllerUISupervisore controllerUI = ControllerUISupervisore();
  Controller controller = Controller();
  ThemeMain theme = ThemeMain();
  AppBarLayoutSupervisore AppBar = AppBarLayoutSupervisore();
  ThemeRicevuteSupervisore themeMessaggiSupervisore =
      ThemeRicevuteSupervisore();
  //Admin admin = Controller().takeAdminInfoDB();

  @override
  void initState() {
    super.initState();
    // Carica i dati iniziali per la dispensa
    initTavolis();
    //initMessaggi = Controller().TakeMessages();
  }

  void initTavolis() async {
    tavoli = await controller.TakeTavoli();
    initTavoli = tavoli;
    setState(() {
      tavoli = tavoli;
    });
  }

  /*void updateMessaggi(List<Messaggio> newMessages) {
    setState(() {
      messaggi = newMessages;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    //controller.setToZeroNotifications();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar.buildAppBar(context, widget.supervisore),
      body: theme.buildDecoratedBox(
        SafeArea(
          child: ListView(
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
                        "RICEVUTE",
                        style: themeMessaggiSupervisore.textStyle(),
                      ),
                      const SizedBox(height: 5.0),
                      WhiteLine(),
                      const SizedBox(height: 20.0),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SearchBarWidgetSupervisore(
                                update: update, tavoli: initTavoli),
                          ),
                          SizedBox(
                            height: 70.0,
                          ),
                          Container(
                            height: 450.0,
                            child: ListTavoli(
                              tavoli: tavoli,
                            ),
                          ),
                        ],
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

  void update(List<Tavolo> newTavoli) {
    setState(() {
      tavoli = newTavoli;
    });
  }
}
