import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/Themes/ThemeDispensaAdmin.dart';
import 'package:prova1/AdminUI/Themes/ThemeMessaggiAdmin.dart';
import 'package:prova1/AdminWidgets/ListDispensa.dart';
import 'package:prova1/AdminWidgets/ListMessaggi.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Messaggio.dart';
import '../Themes/ThemeMain.dart';
import 'package:prova1/Model/Admin.dart';
import 'package:prova1/AdminWidgets/ControllerUI.dart';
import 'package:prova1/ControllerAdmin/Controller.dart';
import '../Themes/ThemeDatiAccount.dart';

class MessaggiAdmin extends StatefulWidget {
  @override
  final Admin admin;
  const MessaggiAdmin({super.key, required this.admin});
  _MessaggiAdminState createState() => _MessaggiAdminState();
}

class _MessaggiAdminState extends State<MessaggiAdmin> {
  List<Messaggio> messaggi = []; // Inizializza con i dati iniziali
  //List<Messaggio> initMessaggi = []; // Dispensa completa
  ControllerUI controllerUI = ControllerUI();
  Controller controller = Controller();
  ThemeMain theme = ThemeMain();
  AppBarLayout AppBar = AppBarLayout();
  ThemeMessaggiAdmin themeMessaggiAdmin = ThemeMessaggiAdmin();
  Admin admin = Controller().takeAdminInfoDB();

  @override
  void initState() {
    super.initState();
    // Carica i dati iniziali per la dispensa
    messaggi = Controller().TakeMessages();
    //initMessaggi = Controller().TakeMessages();
  }

  /*void updateMessaggi(List<Messaggio> newMessages) {
    setState(() {
      messaggi = newMessages;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    controller.setToZeroNotifications();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar.buildAppBar(context, admin),
      body: theme.buildDecoratedBox(
        SafeArea(
          child: ListView(
            children: [
              controllerUI.ButtonBarAdmin(context, admin),
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
                        style: ThemeMessaggiAdmin.textStyle(),
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