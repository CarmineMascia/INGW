import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/LogicUI/DatiAccountAdmin.dart';
import 'package:prova1/ClientsWidgets/ThemeMain.dart';
import 'package:prova1/Controller/Controller.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:prova1/CucinaUI/LogicUI/DatiAccountCucina.dart';
import 'package:prova1/Model/Admin.dart';
import 'package:prova1/Model/Cucina.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/Model/prova.dart';
import 'package:prova1/SupervisoreUI/LogicUI/DatiAccountSupervisore.dart';
import 'package:prova1/provaOpenFoodFact.dart';

//aggiungere che si passa tra tutte le schermate le cose dell'utente'

class RecuperaPassword extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text: '');
  Controller controller = Controller();

  ThemeMain theme = ThemeMain();

  RecuperaPassword({super.key});

  @override
  Widget build(BuildContext context) {
    /*OpenFoodAPIConfiguration.userAgent = const UserAgent(name: 'RATATOUILLE23');

    OpenFoodAPIConfiguration.globalLanguages = <OpenFoodFactsLanguage>[
      OpenFoodFactsLanguage.ITALIAN
    ];

    OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.ITALY;

    prova(context);*/

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
                      'INSERISCI L\'E-MAIL PER IL RECUPERO DELLA PASSWORD',
                      style: TextStyle(
                        letterSpacing: 2.0,
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const SizedBox(height: 32.0),
                    SizedBox(
                      width: 200.0,
                      height: 30.0,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(HomePage());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'AVANTI',
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
