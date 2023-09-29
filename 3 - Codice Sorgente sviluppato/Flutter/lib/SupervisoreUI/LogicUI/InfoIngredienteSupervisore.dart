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

class InfoIngredienteSupervisore extends StatefulWidget {
  final Supervisore supervisore;
  final Ingrediente ingrediente;
  const InfoIngredienteSupervisore(
      {super.key, required this.supervisore, required this.ingrediente});

  @override
  _InfoIngredienteSupervisoreState createState() =>
      _InfoIngredienteSupervisoreState();
}

class _InfoIngredienteSupervisoreState
    extends State<InfoIngredienteSupervisore> {
  @override
  //Oggetti per la creazione della schermata
  ControllerUISupervisore controllerUI = ControllerUISupervisore();
  late Ingrediente ingrediente;
  ThemeMain theme = ThemeMain();
  AppBarLayoutSupervisore AppBar = AppBarLayoutSupervisore();
  ThemeInfoIngredienteSupervisore themeInfoIngredienteSupervisore =
      ThemeInfoIngredienteSupervisore();
  ControllerSupervisore controllerCucina = ControllerSupervisore();
  Controller controller = Controller();
  late MyButtonQuantita myButtonQuantita;

  TextEditingController nomeController = TextEditingController();
  TextEditingController descrizioneController = TextEditingController();
  TextEditingController costoController = TextEditingController();
  //TextEditingController quantitaController = TextEditingController();
  TextEditingController scadenzaController = TextEditingController();
  late DateTime newScadenza;
  String quantita = '';

  /*final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );*/

  @override
  void initState() {
    //super.initState();
    ingrediente = widget.ingrediente;
    nomeController.text = ingrediente.nome;
    descrizioneController.text = ingrediente.descrizione;
    costoController.text = ingrediente.costo;
    //quantitaController.text = ingrediente.quantita;
    newScadenza = ingrediente.scadenza;
    myButtonQuantita = MyButtonQuantita(quantita: ingrediente.quantita);
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
                          padding: EdgeInsets.symmetric(
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
                              Container(
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
                          padding: EdgeInsets.symmetric(
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
                                ),
                              ),*/
                              myButtonQuantita,
                              Spacer(
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
                              Container(
                                  height: 50,
                                  width: 250,
                                  child: ElevatedButton(
                                      style: themeInfoIngredienteSupervisore
                                          .myButtonStyle(),
                                      onPressed: () => selectDate(),
                                      child: Text(newScadenza.day.toString() +
                                          '/' +
                                          newScadenza.month.toString() +
                                          '/' +
                                          newScadenza.year.toString()))),
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
                              Container(
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
                            child: Text(
                              "SALVA",
                              style:
                                  themeInfoIngredienteSupervisore.textStyle4(),
                            ),
                            onPressed: () {
                              ingrediente.nome = nomeController.text;
                              ingrediente.codice = costoController.text;
                              //String quantita = quantitaController.text;
                              ingrediente.descrizione =
                                  descrizioneController.text;
                              ingrediente.scadenza = newScadenza;
                              ingrediente.quantita =
                                  myButtonQuantita.getQuantita();

                              if (controller.UpdateIngrediente(ingrediente)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Salvataggio avvenuto con successo!' +
                                            ingrediente.quantita),
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
      initialDate: ingrediente.scadenza,
      firstDate: DateTime(2023),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      newScadenza = picked;
    }
  }

  void changeQuantita(String newQuantita) {
    quantita = newQuantita;
  }
}
