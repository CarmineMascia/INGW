import 'package:flutter/material.dart';
import 'package:prova1/AdminWidgets/AppBarLayout.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import '../../ClientsWidgets/ThemeMain.dart';
import 'package:prova1/Model/Admin.dart';
import 'package:prova1/AdminWidgets/ControllerUI.dart';
import 'package:prova1/Controller/ControllerAdmin/ControllerAdmin.dart';
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
  ControllerAdmin controller = ControllerAdmin();

  DatiAccountAdmin({super.key, required this.admin});



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
                        "DATI ACCOUNT",
                        style: themeDatiAccount.textStyle(),
                      ),
                      FutureBuilder(
                      future: controller.takeAdminInfoDB(admin.email), // Assuming getPiatti returns a Future
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          // Display a loading indicator while waiting for data
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          // Display an error message if there's an error
                          return Text('Error: ${snapshot.error}');
                        } else {
                          admin = snapshot.data!;
                          return Column(
                    children: [
                      const SizedBox(height: 5.0),
                      WhiteLine(),
                      const SizedBox(height: 20.0),
                      controllerUI.ShowText("NOME", admin.nome),
                      const SizedBox(height: 50.0),
                      controllerUI.ShowText("COGNOME", admin.cognome),
                      const SizedBox(height: 50.0),
                      controllerUI.ShowText("EMAIL", admin.email),
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

