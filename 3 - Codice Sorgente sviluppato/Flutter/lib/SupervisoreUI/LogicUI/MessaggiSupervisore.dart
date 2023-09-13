import 'package:flutter/material.dart';
import 'package:prova1/ClientsWidgets/ListMessaggi.dart';

import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/Controller.dart';
import 'package:prova1/Controller/ControllerSupervisore/ControllerSupervisore.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Messaggio.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/SupervisoreUI/Themes/ThemeMessaggiSupervisore.dart';

import 'package:prova1/SupervisoreWidget/AppBarLayoutSupervisore.dart';
import 'package:prova1/SupervisoreWidget/ControllerUISupervisore.dart';
import '../../ClientsWidgets/ThemeMain.dart';

class MessaggiSupervisore extends StatefulWidget {
  @override
  final Supervisore supervisore;
  const MessaggiSupervisore({super.key, required this.supervisore});
  _MessaggiSupervisoreState createState() => _MessaggiSupervisoreState();
}

class _MessaggiSupervisoreState extends State<MessaggiSupervisore> {
  List<Messaggio> messaggi = []; // Inizializza con i dati iniziali
  //List<Messaggio> initMessaggi = []; // Dispensa completa
  ControllerUISupervisore controllerUI = ControllerUISupervisore();
  Controller controller = Controller();
  ThemeMain theme = ThemeMain();
  AppBarLayoutSupervisore AppBar = AppBarLayoutSupervisore();
  ThemeMessaggiSupervisore themeMessaggiSupervisore =
      ThemeMessaggiSupervisore();
  //Admin admin = Controller().takeAdminInfoDB();

  @override
  void initState() {
    super.initState();
    // Carica i dati iniziali per la dispensa
    messaggi = controller.TakeMessages();
    //initMessaggi = Controller().TakeMessages();
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
                        "MESSAGGI",
                        style: themeMessaggiSupervisore.textStyle(),
                      ),
                      const SizedBox(height: 5.0),
                      WhiteLine(),
                      const SizedBox(height: 20.0),
                      Column(
                        children: [
                          Container(
                            height: 450.0,
                            child: ListMessaggi(messaggi: messaggi),
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
}
