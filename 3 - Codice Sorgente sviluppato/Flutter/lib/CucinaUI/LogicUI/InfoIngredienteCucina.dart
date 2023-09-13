import 'package:flutter/material.dart';

import 'package:prova1/ClientsWidgets/IngredientiWidgetInfoPiatto.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/Controller.dart';
import 'package:prova1/Controller/ControllerCucina/ControllerCucina.dart';
import 'package:prova1/CucinaUI/Themes/ThemeInfoIngredienteCucina.dart';
import 'package:prova1/CucinaWidgets/AppBarLayoutCucina.dart';
import 'package:prova1/CucinaWidgets/ControllerUICucina.dart';
import 'package:prova1/ClientsWidgets/MyButtonQuantita.dart';
import 'package:prova1/Model/Allergeni.dart';
import 'package:prova1/Model/Cucina.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Piatti.dart';
import '../../ClientsWidgets/ThemeMain.dart';

class InfoIngredienteCucina extends StatefulWidget {
  final Cucina cucina;
  final Ingrediente ingrediente;
  const InfoIngredienteCucina(
      {super.key, required this.cucina, required this.ingrediente});

  @override
  _InfoIngredienteCucinaState createState() => _InfoIngredienteCucinaState();
}

class _InfoIngredienteCucinaState extends State<InfoIngredienteCucina> {
  @override
  //Oggetti per la creazione della schermata
  ControllerUICucina controllerUI = ControllerUICucina();
  late Ingrediente ingrediente;
  ThemeMain theme = ThemeMain();
  AppBarLayoutCucina AppBar = AppBarLayoutCucina();
  ThemeInfoIngredienteCucina themeInfoPiatto = ThemeInfoIngredienteCucina();
  ControllerCucina controllerCucina = ControllerCucina();
  Controller controller = Controller();
  late MyButtonQuantita myButtonQuantita;

  TextEditingController nomeController = TextEditingController();
  TextEditingController descrizioneController = TextEditingController();
  TextEditingController codiceController = TextEditingController();
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
    codiceController.text = ingrediente.codice;
    //quantitaController.text = ingrediente.quantita;
    newScadenza = ingrediente.scadenza;
    myButtonQuantita = MyButtonQuantita(quantita: ingrediente.quantita);
  }

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
                        "INFO INGREDIENTE",
                        style: themeInfoPiatto.textStyle(),
                      ),
                      const SizedBox(height: 5.0),
                      WhiteLine(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: themeInfoPiatto.containerDecoration(),
                        height: 100.0,
                        child: /*Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 250.0,
                          ),*/
                            Row(
                          children: [
                            Spacer(
                              flex: 1,
                            ),
                            Text(
                              "NOME: ",
                              style: themeInfoPiatto.textStyle2(),
                            ),
                            Container(
                              height: 50,
                              width: 200,
                              child: TextField(
                                controller: nomeController,
                                decoration:
                                    themeInfoPiatto.TextFieldDecoration(),
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Text(
                              "CODICE: ",
                              style: themeInfoPiatto.textStyle2(),
                            ),
                            Container(
                              height: 50,
                              width: 200,
                              child: TextField(
                                controller: codiceController,
                                decoration:
                                    themeInfoPiatto.TextFieldDecoration(),
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: themeInfoPiatto.containerDecoration(),
                        height: 100.0,
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
                            Spacer(
                              flex: 1,
                            ),
                            myButtonQuantita,
                            Spacer(
                              flex: 1,
                            ),
                            Text(
                              "SCADENZA: ",
                              style: themeInfoPiatto.textStyle2(),
                            ),
                            Container(
                                height: 50,
                                width: 200,
                                child: ElevatedButton(
                                    style: themeInfoPiatto.myButtonStyle(),
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
                        decoration: themeInfoPiatto.containerDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              WhiteLine(),
                              const SizedBox(height: 5.0),
                              Text(
                                "DESCRIZIONE",
                                style: themeInfoPiatto.textStyle(),
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
                                      themeInfoPiatto.TextFieldDecoration(),
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
                              style: themeInfoPiatto.textStyle4(),
                            ),
                            onPressed: () {
                              ingrediente.nome = nomeController.text;
                              ingrediente.codice = codiceController.text;
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
