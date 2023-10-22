import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/LogicUI/DatiAccountAdmin.dart';
import 'package:prova1/ClientsWidgets/ThemeMain.dart';
import 'package:prova1/Controller/Controller.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:prova1/CucinaUI/LogicUI/DatiAccountCucina.dart';
import 'package:prova1/Model/Admin.dart';
import 'package:prova1/Model/Cucina.dart';
import 'package:prova1/Model/Sala.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/PrimoCambioPassword.dart';
import 'package:prova1/SalaUI/LogicUI/MenuSala.dart';
import 'package:prova1/SupervisoreUI/LogicUI/DatiAccountSupervisore.dart';
import 'package:prova1/provaOpenFoodFact.dart';
import 'package:prova1/recuperaPassword.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ProvaHome',
      home: HomePage(),
    );
  }
}

//aggiungere che si passa tra tutte le schermate le cose dell'utente'

class HomePage extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  Controller controller = Controller();

  ThemeMain theme = ThemeMain();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    OpenFoodAPIConfiguration.userAgent = const UserAgent(name: 'RATATOUILLE23');
    OpenFoodAPIConfiguration.globalLanguages = <OpenFoodFactsLanguage>[
      OpenFoodFactsLanguage.ITALIAN
    ];

    OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.ITALY;

    return Scaffold(
      body: theme.buildDecoratedBox(
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              theme.buildLogoBox(),
              const SizedBox(height: 20.0),
              //theme.buildLoginBox(context),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                width: 500.0,
                height: 400.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Login',
                      style: TextStyle(
                        letterSpacing: 2.0,
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                    
                    const SizedBox(height: 32.0),
                    SizedBox(
                      width: 200.0,
                      height: 30.0,
                      child: ElevatedButton(
                        onPressed: () async {
                          String email = emailController.text;
                          String password = passwordController.text;
                          int flag = await controller.checkUser(email, password);
                          switch (flag) {
                            case 0:
                              SnackBar snackBar = const SnackBar(
                                  content: Text('Inserisci tutti i campi'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              break;
                            case 1:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => DatiAccountAdmin(
                                          admin: Admin.emailAndPassword(
                                              email, password),
                                        )),
                              );

                              break;
                            case 2:
                              if (await controller.checkFirstTime(email)) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PrimoCambioPassword(email)),
                                );
                              } else {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => DatiAccountCucina(
                                            cucina: Cucina.emailAndPassword(
                                                email, password),
                                          )),
                                );
                              }
                              break;
                            case 3:
                              if (await controller.checkFirstTime(email)) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PrimoCambioPassword(email)),
                                );
                              } else {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DatiAccountSupervisore(
                                            supervisore:
                                                Supervisore.emailAndPassword(
                                                    email, password),
                                          )),
                                );
                              }
                              break;
                            case 4:
                              if (await controller.checkFirstTime(email)) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PrimoCambioPassword(email)),
                                );
                              } else {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeSala(
                                            sala:
                                                Sala.emailAndPassword(
                                                    email, password),
                                          )),
                                );
                              }
                              break;
                            case 5:
                              SnackBar snackBar = const SnackBar(
                                  content: Text(
                                      'Nome o password errati'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              break;
                            default:
                              SnackBar snackBar = const SnackBar(
                                  content: Text(
                                      'Errore nel controllo, inserisci nuovamente i campi'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              break;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
