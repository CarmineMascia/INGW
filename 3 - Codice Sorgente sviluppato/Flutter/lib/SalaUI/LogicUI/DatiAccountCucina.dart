import 'package:flutter/material.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/CucinaWidgets/AppBarLayoutCucina.dart';
import 'package:prova1/CucinaWidgets/ControllerUICucina.dart';
import 'package:prova1/Model/Cucina.dart';
import '../../ClientsWidgets/ThemeMain.dart';
import '../Themes/ThemeDatiAccountCucina.dart';
import 'package:prova1/Controller/ControllerCucina/ControllerCucina.dart';

/*class DatiAccountAdmin extends StatelessWidget {
  final Admin admin;

  const DatiAccountAdmin({super.key, required this.admin});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return HomeDatiAccountAdmin();
  }
}*/

class DatiAccountCucina extends StatelessWidget {
  @override
  ControllerUICucina controllerUI = ControllerUICucina();
  ThemeMain theme = ThemeMain();
  AppBarLayoutCucina AppBar = AppBarLayoutCucina();
  ThemeDatiAccountCucina themeDatiAccount = ThemeDatiAccountCucina();
  Cucina cucina;
  ControllerCucina controllerCucina = ControllerCucina();

  DatiAccountCucina({super.key, required this.cucina});

  @override
  Widget build(BuildContext context) {
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
                        "DATI ACCOUNT",
                        style: themeDatiAccount.textStyle(),
                      ),
                      FutureBuilder(
                      future: controllerCucina.takeInfo(cucina), // Assuming getPiatti returns a Future
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          // Display a loading indicator while waiting for data
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          // Display an error message if there's an error
                          return Text('Error: ${snapshot.error}');
                        } else {
                          cucina = snapshot.data!;
                          return Column(
                    children: [
                      const SizedBox(height: 5.0),
                      WhiteLine(),
                      const SizedBox(height: 20.0),
                      controllerUI.ShowText("NOME", cucina.nome),
                      const SizedBox(height: 50.0),
                      controllerUI.ShowText("COGNOME", cucina.cognome),
                      const SizedBox(height: 50.0),
                      controllerUI.ShowText("EMAIL", cucina.email),
                      const SizedBox(height: 50.0),
                      WhiteLine(),]);
                        }}),
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
