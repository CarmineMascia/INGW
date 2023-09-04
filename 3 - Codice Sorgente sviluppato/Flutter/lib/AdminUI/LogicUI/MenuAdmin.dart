import 'package:flutter/material.dart';
import 'package:prova1/AdminWidgets/MenuItemAdmin.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Model/Piatti.dart';
import '../Themes/ThemeMain.dart';
import 'package:prova1/Model/Admin.dart';
import 'package:prova1/AdminWidgets/ControllerUI.dart';
import 'package:prova1/ControllerAdmin/Controller.dart';
import '../Themes/ThemeMenuAdmin.dart';

class MenuAdmin extends StatelessWidget {
  @override
  final Admin admin;
  Controller controller = Controller();
  ControllerUI controllerUI = ControllerUI();
  ThemeMain theme = ThemeMain();
  AppBarLayout AppBar = AppBarLayout();
  ThemeMenuAdmin themeMenuAdmin = ThemeMenuAdmin();
  List<List<Piatti>> piatti = Controller().takeAllPiatti();
  List<String> menuTitles = ThemeMenuAdmin.menuTitles();

  MenuAdmin({super.key, required this.admin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar.buildAppBar(context, admin),
      body: theme.buildDecoratedBox(
        SafeArea(
          //SafeArea serve per garantire che non vengano sovrapposte cose doc:https://api.flutter.dev/flutter/widgets/SafeArea-class.html

          child: ListView(
            //ListView permette di fare quello che fa column solo già scrollabile
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
                        "MENU",
                        style: ThemeMenuAdmin.textStyle(),
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
                                MenuItemAdmin(
                                  nome: menuTitles[i],
                                  piatti: piatti.elementAt(i),
                                  admin: admin,
                                ),
                                if (i < 4) SizedBox(width: 300),
                                // Spazio tra i container
                                if (i < 4)
                                  MenuItemAdmin(
                                    nome: menuTitles[i + 1],
                                    piatti: piatti.elementAt(i + 1),
                                    admin: admin,
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
