import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prova1/ClientsWidgets/MyButtonQuantita.dart';

import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/Controller.dart';
import 'package:prova1/Controller/ControllerSupervisore/ControllerSupervisore.dart';

import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/SupervisoreUI/Themes/ThemeInfoIngredienteSupervisore.dart';
import 'package:prova1/SupervisoreWidget/AppBarLayoutSupervisore.dart';
import 'package:prova1/SupervisoreWidget/ControllerUISupervisore.dart';

import '../../ClientsWidgets/ThemeMain.dart';

class AggiungiIngredienteSupervisore extends StatefulWidget {
  final Supervisore supervisore;

  const AggiungiIngredienteSupervisore({super.key, required this.supervisore});

  @override
  _AggiungiIngredienteSupervisoreState createState() =>
      _AggiungiIngredienteSupervisoreState();
}

class _AggiungiIngredienteSupervisoreState
    extends State<AggiungiIngredienteSupervisore> {
  @override
  //Oggetti per la creazione della schermata
  ControllerUISupervisore controllerUI = ControllerUISupervisore();
  ThemeMain theme = ThemeMain();
  AppBarLayoutSupervisore AppBar = AppBarLayoutSupervisore();
  ThemeInfoIngredienteSupervisore themeInfoIngredienteSupervisore =
      ThemeInfoIngredienteSupervisore();
  ControllerSupervisore controllerCucina = ControllerSupervisore();
  Controller controller = Controller();
  MyButtonQuantita myButtonQuantita = MyButtonQuantita(quantita: '0');

  TextEditingController nomeController = TextEditingController();
  TextEditingController descrizioneController = TextEditingController();
  TextEditingController costoController = TextEditingController();
  //TextEditingController quantitaController = TextEditingController();
  TextEditingController scadenzaController = TextEditingController();
  DateTime newScadenza = DateTime.now();

  /*final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );*/

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
                        "INFO INGREDIENTE",
                        style: themeInfoIngredienteSupervisore.textStyle(),
                      ),
                      const SizedBox(height: 5.0),
                      WhiteLine(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: themeInfoIngredienteSupervisore
                            .containerDecoration(),
                        height: 100.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 250.0,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "NOME: ",
                                style: themeInfoIngredienteSupervisore
                                    .textStyle2(),
                              ),
                              SizedBox(
                                height: 50,
                                width: 250,
                                child: TextField(
                                  controller: nomeController,
                                  decoration: themeInfoIngredienteSupervisore
                                      .TextFieldDecoration(),
                                ),
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              Text(
                                "COSTO: ",
                                style: themeInfoIngredienteSupervisore
                                    .textStyle2(),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                decoration: themeInfoIngredienteSupervisore
                                    .myContainerStyle(),
                                height: 50,
                                width: 200,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'^\d+\.?\d{0,2}'))
                                          ],
                                          controller: costoController,
                                          /*decoration:
                                    themeInfoPiatto.TextFieldDecoration(),*/
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Enter text...',
                                          ),
                                        ),
                                      ),
                                      const Text('€'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: themeInfoIngredienteSupervisore
                            .containerDecoration(),
                        height: 100.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 250.0,
                          ),
                          child: Row(
                            children: [
                              /*Text(
                                "QUANTITA: ",
                                style: themeInfoPiatto.textStyle2(),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                height: 50,
                                width: 250,
                                child: TextField(
                                  controller: quantitaController,
                                  decoration:
                                      themeInfoPiatto.TextFieldDecoration(),
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+\.?\d{0,2}'))
                                  ],
                                ),
                              ),*/
                              myButtonQuantita,
                              const Spacer(
                                flex: 1,
                              ),
                              Text(
                                "SCADENZA: ",
                                style: themeInfoIngredienteSupervisore
                                    .textStyle2(),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              SizedBox(
                                  height: 50,
                                  width: 250,
                                  child: ElevatedButton(
                                      style: themeInfoIngredienteSupervisore
                                          .myButtonStyle(),
                                      onPressed: () => selectDate(),
                                      child: Text(
                                          '${newScadenza.day}/${newScadenza.month}/${newScadenza.year}'))),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: themeInfoIngredienteSupervisore
                            .containerDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              WhiteLine(),
                              const SizedBox(height: 5.0),
                              Text(
                                "DESCRIZIONE",
                                style:
                                    themeInfoIngredienteSupervisore.textStyle(),
                              ),
                              const SizedBox(height: 5.0),
                              WhiteLine(),
                              const SizedBox(
                                height: 30.0,
                              ),
                              SizedBox(
                                height: 200.0,
                                child: TextField(
                                  controller: descrizioneController,
                                  minLines: 7,
                                  maxLines: 7,
                                  decoration: themeInfoIngredienteSupervisore
                                      .TextFieldDecoration(),
                                ),
                              )
                            ],
                          ),
                        ),
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
                            onPressed: () async {
                              Ingrediente ingrediente =
                                  Ingrediente.noSogliaMinimaECodice(
                                      nomeController.text,
                                      costoController.text,
                                      myButtonQuantita.getQuantita(),
                                      newScadenza,
                                      descrizioneController.text);

                              if (await controller.AggiungiIngrediente(ingrediente)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Salvataggio avvenuto con successo!'),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
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
                            child: Text(
                              "SALVA",
                              style:
                                  themeInfoIngredienteSupervisore.textStyle4(),
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

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: newScadenza,
      firstDate: DateTime(2023),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      setState(() {
        newScadenza = picked;
      });
      
    }
  }
}