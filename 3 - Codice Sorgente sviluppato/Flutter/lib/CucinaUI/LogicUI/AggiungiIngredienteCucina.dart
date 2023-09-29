import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:prova1/ClientsWidgets/IngredientiWidgetInfoPiatto.dart';
import 'package:prova1/ClientsWidgets/MyButtonQuantita.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/Controller.dart';
import 'package:prova1/Controller/ControllerCucina/ControllerCucina.dart';
import 'package:prova1/CucinaUI/Themes/ThemeInfoIngredienteCucina.dart';
import 'package:prova1/CucinaWidgets/AppBarLayoutCucina.dart';
import 'package:prova1/CucinaWidgets/ControllerUICucina.dart';
import 'package:prova1/Model/Allergeni.dart';
import 'package:prova1/Model/Cucina.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Piatti.dart';
import '../../ClientsWidgets/ThemeMain.dart';

class AggiungiIngredienteCucina extends StatefulWidget {
  final Cucina cucina;

  const AggiungiIngredienteCucina({super.key, required this.cucina});

  @override
  _AggiungiIngredienteCucinaState createState() =>
      _AggiungiIngredienteCucinaState();
}

class _AggiungiIngredienteCucinaState extends State<AggiungiIngredienteCucina> {
  @override
  //Oggetti per la creazione della schermata
  ControllerUICucina controllerUI = ControllerUICucina();
  ThemeMain theme = ThemeMain();
  AppBarLayoutCucina AppBar = AppBarLayoutCucina();
  ThemeInfoIngredienteCucina themeInfoIngredienteCucina =
      ThemeInfoIngredienteCucina();
  ControllerCucina controllerCucina = ControllerCucina();
  Controller controller = Controller();
  MyButtonQuantita myButtonQuantita = MyButtonQuantita(quantita: '0');

  TextEditingController nomeController = TextEditingController();
  TextEditingController descrizioneController = TextEditingController();
  TextEditingController costoController = TextEditingController();
  TextEditingController quantitaController = TextEditingController();
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
      appBar: AppBar.buildAppBar(context),
      body: theme.buildDecoratedBox(
        SafeArea(
          //SafeArea serve per garantire che non vengano sovrapposte cose doc:https://api.flutter.dev/flutter/widgets/SafeArea-class.html

          child: ListView(
            //ListView permette di fare quello che fa column solo già scrollabile
            children: [
              controllerUI.ButtonBarCucina(context, widget.cucina),
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
                        "AGGIUNGI INGREDIENTE",
                        style: themeInfoIngredienteCucina.textStyle(),
                      ),
                      const SizedBox(height: 5.0),
                      WhiteLine(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration:
                            themeInfoIngredienteCucina.containerDecoration(),
                        height: 100.0,
                        child: Row(
                          children: [
                            Spacer(
                              flex: 1,
                            ),
                            Text(
                              "NOME: ",
                              style: themeInfoIngredienteCucina.textStyle2(),
                            ),
                            Container(
                              height: 50,
                              width: 200,
                              child: TextField(
                                controller: nomeController,
                                decoration: themeInfoIngredienteCucina
                                    .TextFieldDecoration(),
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Text(
                              "COSTO: ",
                              style: themeInfoIngredienteCucina.textStyle2(),
                            ),
                            Container(
                              decoration:
                                  themeInfoIngredienteCucina.myContainerStyle(),
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
                            Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration:
                            themeInfoIngredienteCucina.containerDecoration(),
                        height: 100.0,
                        child: Row(
                          children: [
                            Spacer(
                              flex: 1,
                            ),
                            /*Text(
                              "QUANTITA: ",
                              style: themeInfoPiatto.textStyle2(),
                            ),
                            Container(
                              height: 50,
                              width: 200,
                              child: TextField(
                                controller: quantitaController,
                                decoration:
                                    themeInfoPiatto.TextFieldDecoration(),
                              ),
                            ),*/
                            myButtonQuantita,
                            Spacer(
                              flex: 1,
                            ),
                            Text(
                              "SCADENZA: ",
                              style: themeInfoIngredienteCucina.textStyle2(),
                            ),
                            Container(
                                height: 50,
                                width: 200,
                                child: ElevatedButton(
                                    style: themeInfoIngredienteCucina
                                        .myButtonStyle(),
                                    onPressed: () => selectDate(),
                                    child: Text(newScadenza.day.toString() +
                                        '/' +
                                        newScadenza.month.toString() +
                                        '/' +
                                        newScadenza.year.toString()))),
                            Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration:
                            themeInfoIngredienteCucina.containerDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              WhiteLine(),
                              const SizedBox(height: 5.0),
                              Text(
                                "DESCRIZIONE",
                                style: themeInfoIngredienteCucina.textStyle(),
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
                                  decoration: themeInfoIngredienteCucina
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
                            child: Text(
                              "SALVA",
                              style: themeInfoIngredienteCucina.textStyle4(),
                            ),
                            onPressed: () {
                              Ingrediente ingrediente =
                                  Ingrediente.noSogliaMinimaECodice(
                                      nomeController.text,
                                      costoController.text,
                                      myButtonQuantita.getQuantita(),
                                      newScadenza,
                                      descrizioneController.text);

                              if (controller.AggiungiIngrediente(ingrediente)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Salvataggio avvenuto con successo!'),
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

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: newScadenza,
      firstDate: DateTime(2023),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      newScadenza = picked;
    }
  }
}
