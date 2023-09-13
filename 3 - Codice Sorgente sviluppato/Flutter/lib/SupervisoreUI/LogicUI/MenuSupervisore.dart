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

class MenuSupervisore extends StatelessWidget {
  @override
  final Supervisore supervisore;
  ControllerSupervisore controllerAdmin = ControllerSupervisore();
  Controller controller = Controller();
  ControllerUISupervisore controllerUI = ControllerUISupervisore();
  ThemeMain theme = ThemeMain();
  AppBarLayoutSupervisore AppBar = AppBarLayoutSupervisore();
  ThemeMenuSupervisore themeMenuAdmin = ThemeMenuSupervisore();
  List<List<Piatti>> piatti = [[]];
  List<String> menuTitles = [];

  MenuSupervisore({super.key, required this.supervisore});

  @override
  Widget build(BuildContext context) {
    piatti = controller.takeAllPiatti();
    menuTitles = themeMenuAdmin.menuTitles();
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
                        "MENU",
                        style: themeMenuAdmin.textStyle(),
                      ),
                      const SizedBox(height: 5.0),
                      WhiteLine(),
                      const SizedBox(height: 20.0),
                      //qui

                      for (int i = 0; i < 5; i += 2)
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(60.0),
                            child: Row(
                              children: [
                                MenuItemSupervisore(
                                  nome: menuTitles[i],
                                  piatti: piatti.elementAt(i),
                                  supervisore: supervisore,
                                ),
                                if (i < 4) SizedBox(width: 300),
                                // Spazio tra i container
                                if (i < 4)
                                  MenuItemSupervisore(
                                    nome: menuTitles[i + 1],
                                    piatti: piatti.elementAt(i + 1),
                                    supervisore: supervisore,
                                  ),
                              ],
                            ),
                          ),
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
