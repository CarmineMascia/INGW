import 'package:flutter/material.dart';

import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/ControllerSupervisore/ControllerSupervisore.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/SupervisoreUI/Themes/ThemeDatiAccount.dart';
import 'package:prova1/SupervisoreWidget/AppBarLayoutSupervisore.dart';
import 'package:prova1/SupervisoreWidget/ControllerUISupervisore.dart';
import '../../ClientsWidgets/ThemeMain.dart';

/*class DatiAccountAdmin extends StatelessWidget {
  final Admin admin;

  const DatiAccountAdmin({super.key, required this.admin});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return HomeDatiAccountAdmin();
  }
}*/

class DatiAccountSupervisore extends StatelessWidget {
  @override
  ControllerUISupervisore controllerUI = ControllerUISupervisore();
  ThemeMain theme = ThemeMain();
  AppBarLayoutSupervisore AppBar = AppBarLayoutSupervisore();
  ThemeDatiAccountSupervisore themeDatiAccount = ThemeDatiAccountSupervisore();
  Supervisore supervisore;
  ControllerSupervisore controller = ControllerSupervisore();

  DatiAccountSupervisore({super.key, required this.supervisore});

  @override
  Widget build(BuildContext context) {
    supervisore = controller.takeSupervisoreInfoDB();
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
                        "DATI ACCOUNT",
                        style: themeDatiAccount.textStyle(),
                      ),
                      const SizedBox(height: 5.0),
                      WhiteLine(),
                      const SizedBox(height: 20.0),
                      controllerUI.ShowText("NOME", supervisore.nome),
                      const SizedBox(height: 50.0),
                      controllerUI.ShowText("COGNOME", supervisore.cognome),
                      const SizedBox(height: 50.0),
                      controllerUI.ShowText("EMAIL", supervisore.email),
                      const SizedBox(height: 50.0),
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
