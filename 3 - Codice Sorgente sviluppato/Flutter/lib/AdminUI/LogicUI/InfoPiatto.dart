import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/Themes/ThemeAggiungiPiatto.dart';
import 'package:prova1/AdminUI/Themes/ThemeCreaAccount.dart';
import 'package:prova1/AdminUI/Themes/ThemeInfoPiatto.dart';
import 'package:prova1/ClientsWidgets/AllergeniWidget.dart';
import 'package:prova1/ClientsWidgets/AllergeniWidgetInfoPiatto.dart';
import 'package:prova1/AdminWidgets/AppBarLayout.dart';
import 'package:prova1/ClientsWidgets/IngredientiWidget.dart';
import 'package:prova1/ClientsWidgets/IngredientiWidgetInfoPiatto.dart';
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

class InfoPiatto extends StatefulWidget {
  final Admin admin;
  final Piatti piatto;
  final List<String> tipologie;
  const InfoPiatto(
      {super.key,
      required this.admin,
      required this.piatto,
      required this.tipologie});

  @override
  _InfoPiattoState createState() => _InfoPiattoState();
}

class _InfoPiattoState extends State<InfoPiatto> {
  @override
  //Oggetti per la creazione della schermata
  ControllerUI controllerUI = ControllerUI();
  late Piatti piatto;
  ThemeMain theme = ThemeMain();
  AppBarLayout AppBar = AppBarLayout();
  ThemeInfoPiatto themeInfoPiatto = ThemeInfoPiatto();
  ControllerAdmin controllerAdmin = ControllerAdmin();
  Controller controller = Controller();

  TextEditingController nomeController = TextEditingController();
  TextEditingController descrizioneController = TextEditingController();
  TextEditingController prezzoController = TextEditingController();
  TextEditingController allergeniController = TextEditingController();
  late CustomDropdown customDropdown;

  List<Ingrediente> ingredientiList = [];
  //String allergeni = "";
  late String newTipologia;

  @override
  void initState() {
    //super.initState();
    piatto = widget.piatto;
    ingredientiList = piatto.ingredienti;
    //allergeni = piatto.allergeni;
    allergeniController.text = piatto.allergeni;
    nomeController.text = piatto.nome;
    descrizioneController.text = piatto.descrizione;

    prezzoController.text = piatto.prezzo;
    newTipologia = piatto.tipologia;
    customDropdown =
        CustomDropdown(options: widget.tipologie, hint: piatto.tipologia);
  }

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
                              const SizedBox(
                                width: 50.0,
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
                              const SizedBox(
                                width: 170.0,
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
                                child: /*TextField(
                                  controller: codiceController,
                                  decoration:
                                      themeInfoPiatto.TextFieldDecoration(),
                                ),*/
                                    customDropdown,
                              ),
                              const SizedBox(
                                width: 170.0,
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
                      /*AllergeniWidgetInfoPiatto(
                        onUpdateSelection: (updatedSelection) {
                          setState(() {
                            allergeni = updatedSelection;
                          });
                        },
                        allergeniIniziali: allergeni,
                      ),*/
                      Container(
                        height: 220,
                        decoration: themeInfoPiatto.containerDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              WhiteLine(),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'ALLERGENI',
                                style: themeInfoPiatto.textStyle(),
                                textAlign: TextAlign.center,
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
                                      decoration:
                                          themeInfoPiatto.TextFieldDecoration(),
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
                              piatto.nome = nomeController.text;
                              piatto.allergeni = allergeniController.text;

                              piatto.prezzo = prezzoController.text;
                              piatto.descrizione = descrizioneController.text;

                              piatto.tipologia =
                                  customDropdown.getSelectedValue()!;
                              // Ottieni i dati dagli IngredientiWidget
                              piatto.ingredienti = ingredientiList;

                              // Ottieni i dati dagli AllergeniWidget

                              if (controller.UpdatePiatto(piatto)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Salvataggio avvenuto con successo!' +
                                            piatto.allergeni),
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
