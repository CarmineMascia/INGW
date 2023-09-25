import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:prova1/AdminUI/Themes/ThemeAggiungiPiatto.dart';

import 'package:prova1/ClientsWidgets/AllergeniWidget.dart';
import 'package:prova1/AdminWidgets/AppBarLayout.dart';
import 'package:prova1/ClientsWidgets/CustomDropdown.dart';
import 'package:prova1/ClientsWidgets/IngredientiWidget.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/Controller.dart';
import 'package:prova1/Controller/ControllerSupervisore/ControllerSupervisore.dart';
import 'package:prova1/Model/Allergeni.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/SupervisoreUI/Themes/ThemeAggiungiPiattoSupervisore.dart';
import 'package:prova1/SupervisoreWidget/AppBarLayoutSupervisore.dart';
import 'package:prova1/SupervisoreWidget/ControllerUISupervisore.dart';
import 'package:prova1/provaOpenFoodFact.dart';
import '../../ClientsWidgets/ThemeMain.dart';
import 'package:prova1/Model/Admin.dart';
import 'package:prova1/AdminWidgets/ControllerUI.dart';
import 'package:prova1/Controller/ControllerAdmin/ControllerAdmin.dart';

class AggiungiPiattoSupervisore extends StatefulWidget {
  final Supervisore supervisore;
  final String tipologia;
  const AggiungiPiattoSupervisore(
      {super.key, required this.supervisore, required this.tipologia});

  @override
  _HomeAggiungiPiattoSupervisore createState() =>
      _HomeAggiungiPiattoSupervisore();
}

class _HomeAggiungiPiattoSupervisore extends State<AggiungiPiattoSupervisore> {
  @override
  //Oggetti per la creazione della schermata
  //animazione flag
  bool isFunctionInProgress = false;
  //
  ControllerUISupervisore controllerUI = ControllerUISupervisore();
  ThemeMain theme = ThemeMain();
  AppBarLayoutSupervisore AppBar = AppBarLayoutSupervisore();
  ThemeAggiungiPiattoSupervisore themeAggiungiPiatto =
      ThemeAggiungiPiattoSupervisore();
  Controller controller = Controller();
  ControllerSupervisore controllerAdmin = ControllerSupervisore();

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descrizioneController = TextEditingController();
  late CustomDropdown customDropdown;
  final TextEditingController prezzoController = TextEditingController();
  final TextEditingController allergeniController = TextEditingController();

  void setIsFunctionInProgress(bool newValue) {
    setState(() {
      isFunctionInProgress = newValue;
    });
  }

  List<Ingrediente> ingredientiList = [];
  @override
  void initState() {
    // TODO: implement initState
    customDropdown = CustomDropdown(
      options: themeAggiungiPiatto.takeTipologie(),
      hint: widget.tipologia,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar.buildAppBar(context, widget.supervisore),
      body: theme.buildDecoratedBox(
        SafeArea(
          //SafeArea serve per garantire che non vengano sovrapposte cose doc:https://api.flutter.dev/flutter/widgets/SafeArea-class.html

          child: ListView(
            //ListView permette di fare quello che fa column solo già scrollabile
            children: [
              controllerUI.buttonBarSupervisore(context, widget.supervisore),
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
                        "AGGIUNGI PIATTO AL MENU",
                        style: themeAggiungiPiatto.textStyle(),
                      ),
                      const SizedBox(height: 5.0),
                      WhiteLine(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: themeAggiungiPiatto.containerDecoration(),
                        height: 100.0,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 50.0,
                              ),
                              Text(
                                "NOME: ",
                                style: themeAggiungiPiatto.textStyle2(),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                height: 50,
                                width: 250,
                                child: TextField(
                                  controller: nomeController,
                                  decoration:
                                      themeAggiungiPiatto.TextFieldDecoration(),
                                ),
                              ),
                              const SizedBox(
                                width: 170.0,
                              ),
                              Text(
                                "TIPOLOGIA: ",
                                style: themeAggiungiPiatto.textStyle2(),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                height: 50,
                                width: 250,
                                child: customDropdown,
                              ),
                              const SizedBox(
                                width: 170.0,
                              ),
                              Text(
                                "PREZZO: ",
                                style: themeAggiungiPiatto.textStyle2(),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                height: 50,
                                width: 250,
                                child: TextField(
                                  controller: prezzoController,
                                  decoration:
                                      themeAggiungiPiatto.TextFieldDecoration(),
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+(\.\d*)?$')),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: themeAggiungiPiatto.containerDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              WhiteLine(),
                              const SizedBox(height: 5.0),
                              Text(
                                "DESCRIZIONE",
                                style: themeAggiungiPiatto.textStyle(),
                              ),
                              const SizedBox(height: 5.0),
                              WhiteLine(),
                              const SizedBox(
                                height: 30.0,
                              ),
                              Container(
                                height: 200.0,
                                child: TextField(
                                  controller: descrizioneController,
                                  minLines: 7,
                                  maxLines: 7,
                                  decoration:
                                      themeAggiungiPiatto.TextFieldDecoration(),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      /*AllergeniWidget(
                        onUpdateSelection: (updatedSelection) {
                          allergeni = updatedSelection;
                        },
                      ),*/
                      Container(
                        height: 220,
                        decoration: themeAggiungiPiatto.containerDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              WhiteLine(),
                              SizedBox(
                                height: 5.0,
                              ),
                              //
                              Row(
                                children: [
                                  const Spacer(
                                    flex: 3,
                                  ),
                                  Text(
                                    'ALLERGENI',
                                    style: themeAggiungiPiatto.textStyle(),
                                    textAlign: TextAlign.center,
                                  ),
                                  const Spacer(
                                    flex: 3,
                                  ),
                                  Stack(children: [
                                    if (isFunctionInProgress)
                                      const CircularProgressIndicator(),
                                    IconButton(
                                        onPressed: () async {
                                          if (nomeController.text.isEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content:
                                                    Text('INSERISCI IL NOME'),
                                              ),
                                            );
                                          } else {
                                            try {
                                              String data =
                                                  await takeDataForPlatesOnline(
                                                      setIsFunctionInProgress,
                                                      nomeController.text,
                                                      context);
                                              allergeniController.text = data;
                                            } catch (e) {
                                              setState(() {
                                                isFunctionInProgress = false;
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'ERRORE NELL\'ACQUISIZIONE DEI DATI!'),
                                                ),
                                              );
                                            }
                                          }
                                        },
                                        icon:
                                            const Icon(Icons.settings_suggest)),
                                  ]),
                                ],
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              WhiteLine(),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 30.0),
                                  child: Container(
                                    child: TextField(
                                      controller: allergeniController,
                                      minLines: 7,
                                      maxLines: 7,
                                      decoration: themeAggiungiPiatto
                                          .TextFieldDecoration(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      IngredientiWidget(
                        optionsList: controller.takeIngredienti(),
                        onUpdateSelection: (updatedSelection) {
                          setState(() {
                            ingredientiList = updatedSelection;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      WhiteLine(),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            child: Text(
                              "SALVA",
                              style: themeAggiungiPiatto.textStyle3(),
                            ),
                            onPressed: () {
                              String nome = nomeController.text;

                              String prezzo = prezzoController.text;
                              String descrizione = descrizioneController.text;
                              String allergeni = allergeniController.text;

                              // Ottieni i dati dagli IngredientiWidget
                              List<Ingrediente> ingredienti = ingredientiList;

                              // Ottieni i dati dagli AllergeniWidget

                              if (controller.SavePiatto(Piatti(
                                  nome,
                                  prezzo,
                                  customDropdown.getSelectedValue()!,
                                  descrizione,
                                  allergeni,
                                  ingredienti))) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Salvataggio avvenuto con successo!' +
                                            customDropdown.getSelectedValue()!),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Salvataggio fallito!'),
                                  ),
                                );
                              }
                              //fare appena arriva il model su git*/
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              minimumSize: const Size(200, 40),
                            ),
                          ),
                        ),
                      ),
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
