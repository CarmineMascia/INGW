import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/Themes/ThemeAggiungiPiatto.dart';
import 'package:prova1/AdminUI/Themes/ThemeCreaAccount.dart';
import 'package:prova1/AdminWidgets/AllergeniWidget.dart';
import 'package:prova1/AdminWidgets/AppBarLayout.dart';
import 'package:prova1/ClientsWidgets/IngredientiWidget.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/Controller.dart';
import 'package:prova1/Model/Allergeni.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Piatti.dart';
import '../../ClientsWidgets/ThemeMain.dart';
import 'package:prova1/Model/Admin.dart';
import 'package:prova1/AdminWidgets/ControllerUI.dart';
import 'package:prova1/Controller/ControllerAdmin/ControllerAdmin.dart';
import '../Themes/ThemeDatiAccount.dart';
import 'package:prova1/ClientsWidgets/CustomDropdown.dart';

class AggiungiPiatto extends StatefulWidget {
  final Admin admin;
  const AggiungiPiatto({super.key, required this.admin});

  @override
  _HomeAggiungiPiatto createState() => _HomeAggiungiPiatto();
}

class _HomeAggiungiPiatto extends State<AggiungiPiatto> {
  @override
  //Oggetti per la creazione della schermata
  ControllerUI controllerUI = ControllerUI();
  ThemeMain theme = ThemeMain();
  AppBarLayout AppBar = AppBarLayout();
  ThemeAggiungiPiatto themeAggiungiPiatto = ThemeAggiungiPiatto();
  Controller controller = Controller();
  ControllerAdmin controllerAdmin = ControllerAdmin();

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descrizioneController = TextEditingController();
  final TextEditingController codiceController = TextEditingController();
  final TextEditingController prezzoController = TextEditingController();

  List<Ingrediente> ingredientiList = [];
  List<Allergeni> allergeniList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar.buildAppBar(context, widget.admin),
      body: theme.buildDecoratedBox(
        SafeArea(
          //SafeArea serve per garantire che non vengano sovrapposte cose doc:https://api.flutter.dev/flutter/widgets/SafeArea-class.html

          child: ListView(
            //ListView permette di fare quello che fa column solo già scrollabile
            children: [
              controllerUI.ButtonBarAdmin(context, widget.admin),
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
                                "CODICE: ",
                                style: themeAggiungiPiatto.textStyle2(),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                height: 50,
                                width: 250,
                                child: TextField(
                                  controller: codiceController,
                                  decoration:
                                      themeAggiungiPiatto.TextFieldDecoration(),
                                ),
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
                      AllergeniWidget(
                        optionsList: controller.takeAllergeni(),
                        onUpdateSelection: (updatedSelection) {
                          setState(() {
                            allergeniList = updatedSelection;
                          });
                        },
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
                              style: themeAggiungiPiatto.textStyle2(),
                            ),
                            onPressed: () {
                              String nome = nomeController.text;
                              String codice = codiceController.text;
                              String prezzo = prezzoController.text;
                              String descrizione = descrizioneController.text;

                              // Ottieni i dati dagli IngredientiWidget
                              List<Ingrediente> ingredienti = ingredientiList;

                              // Ottieni i dati dagli AllergeniWidget
                              List<Allergeni> allergeni = allergeniList;

                              if (controller.SavePiatto(Piatti(
                                  nome,
                                  prezzo,
                                  codice,
                                  descrizione,
                                  allergeni,
                                  ingredienti))) {
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
