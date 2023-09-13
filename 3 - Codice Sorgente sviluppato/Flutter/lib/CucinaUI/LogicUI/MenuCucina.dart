import 'package:flutter/material.dart';
import 'package:prova1/Controller/Controller.dart';

import 'package:prova1/CucinaWidgets/AppBarLayoutCucina.dart';

import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/CucinaWidgets/MenuItemCucina.dart';
import 'package:prova1/Model/Cucina.dart';
import 'package:prova1/Model/Piatti.dart';
import '../../ClientsWidgets/ThemeMain.dart';

import 'package:prova1/CucinaWidgets/ControllerUICucina.dart';
import 'package:prova1/Controller/ControllerCucina/ControllerCucina.dart';
import '../Themes/ThemeMenuCucina.dart';

class MenuCucina extends StatelessWidget {
  @override
  final Cucina cucina;
  ControllerCucina controllerCucina = ControllerCucina();
  ControllerUICucina controllerUI = ControllerUICucina();
  ThemeMain theme = ThemeMain();
  AppBarLayoutCucina AppBar = AppBarLayoutCucina();
  ThemeMenuCucina themeMenuCucina = ThemeMenuCucina();
  List<List<Piatti>> piatti = [[]];
  List<String> menuTitles = [];
  Controller controller = Controller();

  MenuCucina({super.key, required this.cucina});

  @override
  Widget build(BuildContext context) {
    piatti = controller.takeAllPiatti(); //creare controller generico
    menuTitles = themeMenuCucina.menuTitles();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar.buildAppBar(context),
      body: theme.buildDecoratedBox(
        SafeArea(
          //SafeArea serve per garantire che non vengano sovrapposte cose doc:https://api.flutter.dev/flutter/widgets/SafeArea-class.html

          child: ListView(
            //ListView permette di fare quello che fa column solo già scrollabile
            children: [
              controllerUI.ButtonBarCucina(context, cucina),
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
                        style: themeMenuCucina.textStyle(),
                      ),
                      const SizedBox(height: 5.0),
                      WhiteLine(),
                      const SizedBox(height: 20.0),
                      //qui

                      for (int i = 0; i < 5; i += 1)
                        Column(children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: MenuItemCucina(
                              nome: menuTitles[i],
                              piatti: piatti.elementAt(i),
                              cucina: cucina,
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          )
                        ]),
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
