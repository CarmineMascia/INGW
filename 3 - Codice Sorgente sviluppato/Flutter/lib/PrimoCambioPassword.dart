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

class PrimoCambioPassword extends StatelessWidget {
  TextEditingController passwordController = TextEditingController(text: '');
  Controller controller = Controller();
  String email;
  ThemeMain theme = ThemeMain();
  PrimoCambioPassword(this.email, {super.key});

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
                height: 500.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 15.0),
                    const Text(
                      'INSERISCI UNA NUOVA PASSWORD\n\n',
                      style: TextStyle(
                        letterSpacing: 2.0,
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //deve rispettare le seguenti proprietà:\n1) essere di almeno 8 caratteri \n2) contenere almeno una lettera maiuscola \n3) contenere almeno un numero \n4) contenere almeno un carattere speciale
                    const Text(
                      'deve rispettare le seguenti proprietà:\n1) essere di almeno 8 caratteri \n2) contenere almeno una lettera maiuscola \n3) contenere almeno un numero \n4) contenere almeno un carattere speciale',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'password',
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
                        onPressed: () async {
                          bool flagValiditaPass =
                              checkValiditaPass(passwordController.text);
                          if (flagValiditaPass) {
                            bool flag = await controller
                                .setNewPassword(email,passwordController.text);
                            if (flag == false) {
                              SnackBar snackBar = const SnackBar(
                                  content: Text(
                                      'ERRORE NELLA MODIFICA DELLA PASSWORD RIPROVARE!'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              Navigator.of(context).pop(HomePage());
                            }
                          } else {
                            SnackBar snackBar = const SnackBar(
                                content: Text(
                                    'INSERISCI UNA PASSWORD CHE RISPETTI TUTTI I VINCOLI IMPOSTI!'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
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

  bool checkValiditaPass(String newPass) {
    if (newPass.length < 8) {
      return false;
    }

    // Verifica se contiene almeno una lettera maiuscola
    if (!newPass.contains(RegExp(r'[A-Z]'))) {
      return false;
    }

    // Verifica se contiene almeno un numero
    if (!newPass.contains(RegExp(r'[0-9]'))) {
      return false;
    }

    // Verifica se contiene almeno un carattere speciale
    if (!newPass.contains(RegExp(r'[!@#\$%^&*()_+[\]{}|:;<>,.?/~]'))) {
      return false;
    }

    // Se tutti i criteri sono soddisfatti, la password è valida
    return true;
  }
}
