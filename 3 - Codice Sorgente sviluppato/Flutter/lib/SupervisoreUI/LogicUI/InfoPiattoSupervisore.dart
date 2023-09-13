import 'package:flutter/material.dart';
import 'package:prova1/ClientsWidgets/AllergeniWidgetInfoPiatto.dart';
import 'package:prova1/ClientsWidgets/CustomDropdown.dart';

import 'package:prova1/ClientsWidgets/IngredientiWidgetInfoPiatto.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/Controller.dart';
import 'package:prova1/Controller/ControllerSupervisore/ControllerSupervisore.dart';
import 'package:prova1/Model/Allergeni.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/SupervisoreUI/Themes/ThemeInfoPiattoSupervisore.dart';
import 'package:prova1/SupervisoreWidget/AppBarLayoutSupervisore.dart';
import 'package:prova1/SupervisoreWidget/ControllerUISupervisore.dart';
import '../../ClientsWidgets/ThemeMain.dart';

class InfoPiattoSupervisore extends StatefulWidget {
  final Supervisore supervisore;
  final Piatti piatto;
  const InfoPiattoSupervisore(
      {super.key, required this.supervisore, required this.piatto});

  @override
  _InfoPiattoSupervisoreState createState() => _InfoPiattoSupervisoreState();
}

class _InfoPiattoSupervisoreState extends State<InfoPiattoSupervisore> {
  @override
  //Oggetti per la creazione della schermata
  ControllerUISupervisore controllerUI = ControllerUISupervisore();
  late Piatti piatto;
  ThemeMain theme = ThemeMain();
  AppBarLayoutSupervisore AppBar = AppBarLayoutSupervisore();
  ThemeInfoPiattoSupervisore themeInfoPiatto = ThemeInfoPiattoSupervisore();
  ControllerSupervisore controllerAdmin = ControllerSupervisore();
  Controller controller = Controller();
  late String newScadenza;
  late CustomDropdown customDropdown;

  TextEditingController nomeController = TextEditingController();
  TextEditingController descrizioneController = TextEditingController();
  //TextEditingController codiceController = TextEditingController();
  TextEditingController prezzoController = TextEditingController();

  List<Ingrediente> ingredientiList = [];
  List<Allergeni> allergeniList = [];

  @override
  void initState() {
    //super.initState();
    piatto = widget.piatto;
    ingredientiList = piatto.ingredienti;
    allergeniList = piatto.allergeni;
    nomeController.text = piatto.nome;
    descrizioneController.text = piatto.descrizione;
    //codiceController.text = piatto.codice;
    prezzoController.text = piatto.prezzo;
    customDropdown = CustomDropdown(
        options: themeInfoPiatto.takeTipologie(), hint: piatto.tipologia);
    newScadenza = piatto.tipologia;
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
                        "INFO PIATTO",
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
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Spacer(
                                flex: 1,
                              ),
                              Text(
                                "NOME: ",
                                style: themeInfoPiatto.textStyle2(),
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
                                      themeInfoPiatto.TextFieldDecoration(),
                                ),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              Text(
                                "TIPOLOGIA: ",
                                style: themeInfoPiatto.textStyle2(),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                height: 50,
                                width: 250,
                                child: customDropdown,
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              Text(
                                "PREZZO: ",
                                style: themeInfoPiatto.textStyle2(),
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
                                      themeInfoPiatto.TextFieldDecoration(),
                                ),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                            ],
                          ),
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
                      AllergeniWidgetInfoPiatto(
                        optionsList: controller.takeAllergeni(),
                        onUpdateSelection: (updatedSelection) {
                          setState(() {
                            allergeniList = updatedSelection;
                          });
                        },
                        allergeniList: allergeniList,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      IngredientiWidgetInfoPiatto(
                        //qui
                        optionsList: controller.takeIngredienti(),
                        onUpdateSelection: (updatedSelection) {
                          setState(() {
                            ingredientiList = updatedSelection;
                          });
                        },
                        ingredientiList: ingredientiList,
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
                              style: themeInfoPiatto.textStyle3(),
                            ),
                            onPressed: () {
                              String nome = nomeController.text;

                              String prezzo = prezzoController.text;
                              String descrizione = descrizioneController.text;

                              newScadenza = customDropdown.getSelectedValue()!;
                              // Ottieni i dati dagli IngredientiWidget
                              List<Ingrediente> ingredienti = ingredientiList;

                              // Ottieni i dati dagli AllergeniWidget
                              List<Allergeni> allergeni = allergeniList;

                              if (controller.UpdatePiatto(piatto)) {
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
}
