import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/Themes/ThemeDispensaAdmin.dart';
import 'package:prova1/AdminWidgets/ListDispensa.dart';
import 'package:prova1/AdminWidgets/SearchBarWidget.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Model/Ingrediente.dart';
import '../Themes/ThemeMain.dart';
import 'package:prova1/Model/Admin.dart';
import 'package:prova1/AdminWidgets/ControllerUI.dart';
import 'package:prova1/ControllerAdmin/Controller.dart';
import '../Themes/ThemeDatiAccount.dart';

class DispensaAdmin extends StatefulWidget {
  final Admin admin;
  const DispensaAdmin({super.key, required this.admin});
  @override
  _DispensaAdminState createState() => _DispensaAdminState();
}

class _DispensaAdminState extends State<DispensaAdmin> {
  List<Ingrediente> dispensa = []; // Inizializza con i dati iniziali
  List<Ingrediente> initDispensa = []; // Dispensa completa
  ControllerUI controllerUI = ControllerUI();
  Controller controller = Controller();
  ThemeMain theme = ThemeMain();
  AppBarLayout AppBar = AppBarLayout();
  ThemeDispensaAdmin themeDatiAccount = ThemeDispensaAdmin();

  @override
  void initState() {
    super.initState();
    // Carica i dati iniziali per la dispensa
    dispensa = Controller().TakeDispensa();
    initDispensa = Controller().TakeDispensa();
  }

  void updateDispensa(List<Ingrediente> newDispensa) {
    setState(() {
      dispensa = newDispensa;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar.buildAppBar(context, widget.admin),
      body: theme.buildDecoratedBox(
        SafeArea(
          child: ListView(
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
                        "DISPENSA",
                        style: ThemeDispensaAdmin.textStyle(),
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
                            child: ListDispensa(dispensa: dispensa),
                          )
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
