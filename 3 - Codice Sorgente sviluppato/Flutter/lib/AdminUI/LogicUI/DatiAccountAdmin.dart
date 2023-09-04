import 'package:flutter/material.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import '../Themes/ThemeMain.dart';
import 'package:prova1/Model/Admin.dart';
import 'package:prova1/AdminWidgets/ControllerUI.dart';
import 'package:prova1/ControllerAdmin/Controller.dart';
import '../Themes/ThemeDatiAccount.dart';

/*class DatiAccountAdmin extends StatelessWidget {
  final Admin admin;

  const DatiAccountAdmin({super.key, required this.admin});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return HomeDatiAccountAdmin();
  }
}*/

class DatiAccountAdmin extends StatelessWidget {
  @override
  ControllerUI controllerUI = ControllerUI();
  ThemeMain theme = ThemeMain();
  AppBarLayout AppBar = AppBarLayout();
  ThemeDatiAccount themeDatiAccount = ThemeDatiAccount();
  Admin admin;

  DatiAccountAdmin({super.key, required this.admin});

  @override
  Widget build(BuildContext context) {
    admin = Controller().takeAdminInfoDB();
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
                        "DATI ACCOUNT",
                        style: ThemeDatiAccount.textStyle(),
                      ),
                      const SizedBox(height: 5.0),
                      WhiteLine(),
                      const SizedBox(height: 20.0),
                      controllerUI.ShowText("NOME", admin.nome),
                      const SizedBox(height: 50.0),
                      controllerUI.ShowText("COGNOME", admin.cognome),
                      const SizedBox(height: 50.0),
                      controllerUI.ShowText("EMAIL", admin.email),
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
