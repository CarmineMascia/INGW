import 'package:flutter/material.dart';
import 'package:prova1/ClientsWidgets/IngredientiWidget.dart';
import 'package:prova1/ClientsWidgets/IngredientiWidgetInfoPiatto.dart';

import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/Controller.dart';
import 'package:prova1/Controller/ControllerCucina/ControllerCucina.dart';
import 'package:prova1/CucinaUI/Themes/ThemeInfoPiattoCucina.dart';
import 'package:prova1/CucinaWidgets/AppBarLayoutCucina.dart';
import 'package:prova1/CucinaWidgets/ControllerUICucina.dart';
import 'package:prova1/Model/Allergeni.dart';
import 'package:prova1/Model/Cucina.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Piatti.dart';
import '../../ClientsWidgets/ThemeMain.dart';

class InfoPiattoCucina extends StatefulWidget {
  final Cucina cucina;
  final Piatti piatto;
  const InfoPiattoCucina(
      {super.key, required this.cucina, required this.piatto});

  @override
  _InfoPiattoCucinaState createState() => _InfoPiattoCucinaState();
}

class _InfoPiattoCucinaState extends State<InfoPiattoCucina> {
  @override
  //Oggetti per la creazione della schermata
  ControllerUICucina controllerUI = ControllerUICucina();
  late Piatti piatto;
  ThemeMain theme = ThemeMain();
  AppBarLayoutCucina AppBar = AppBarLayoutCucina();
  ThemeInfoPiattoCucina themeInfoPiattoCucina = ThemeInfoPiattoCucina();
  ControllerCucina controllerCucina = ControllerCucina();
  Controller controller = Controller();

  List<Ingrediente> ingredientiList = [];

  @override
  void initState() {
    //super.initState();
    piatto = widget.piatto;
    ingredientiList = piatto.ingredienti;
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
                        "INFO PIATTO",
                        style: themeInfoPiattoCucina.textStyle(),
                      ),
                      const SizedBox(height: 5.0),
                      WhiteLine(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: themeInfoPiattoCucina.containerDecoration(),
                        height: 400.0,
                        child: Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              Text(
                                "NOME: ",
                                style: themeInfoPiattoCucina.textStyle2(),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                height: 50,
                                width: 250,
                                decoration: themeInfoPiattoCucina
                                    .containerDecoration2(),
                                child: Text(
                                  piatto.nome,
                                  style: themeInfoPiattoCucina.textStyle3(),
                                ),
                                alignment: Alignment.center,
                              ),
                              /*const SizedBox(
                                width: 170.0,
                              ),*/
                              Spacer(
                                flex: 1,
                              ),
                              Text(
                                "TIPOLOGIA: ",
                                style: themeInfoPiattoCucina.textStyle2(),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                height: 50,
                                width: 250,
                                decoration: themeInfoPiattoCucina
                                    .containerDecoration2(),
                                child: Text(
                                  //piatto.codice,
                                  piatto.tipologia,
                                  style: themeInfoPiattoCucina.textStyle3(),
                                ),
                                alignment: Alignment.center,
                              ),
                              /* const SizedBox(
                                width: 170.0,
                              ),*/
                              Spacer(
                                flex: 1,
                              ),
                              Text(
                                "PREZZO: ",
                                style: themeInfoPiattoCucina.textStyle2(),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                height: 50,
                                width: 250,
                                decoration: themeInfoPiattoCucina
                                    .containerDecoration2(),
                                alignment: Alignment.center,
                                child: Text(
                                  piatto.prezzo,
                                  style: themeInfoPiattoCucina.textStyle3(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: themeInfoPiattoCucina.containerDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              WhiteLine(),
                              const SizedBox(height: 5.0),
                              Text(
                                "DESCRIZIONE",
                                style: themeInfoPiattoCucina.textStyle(),
                              ),
                              const SizedBox(height: 5.0),
                              WhiteLine(),
                              const SizedBox(
                                height: 30.0,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Container(
                                  height: 150.0,
                                  decoration: themeInfoPiattoCucina
                                      .containerDecoration2(),
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      piatto.descrizione,
                                      style: themeInfoPiattoCucina.textStyle3(),
                                    ),
                                  ),
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
                        optionsList: controller.takeAllergeni(),
                        onUpdateSelection: (updatedSelection) {
                          setState(() {
                            allergeniList = updatedSelection;
                          });
                        },
                        allergeniList: allergeniList,
                      ),*/
                      Container(
                        decoration: themeInfoPiattoCucina.containerDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              WhiteLine(),
                              const SizedBox(height: 5.0),
                              Text(
                                "ALLERGENI",
                                style: themeInfoPiattoCucina.textStyle(),
                              ),
                              const SizedBox(height: 5.0),
                              WhiteLine(),
                              const SizedBox(
                                height: 30.0,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Container(
                                  height: 150.0,
                                  decoration: themeInfoPiattoCucina
                                      .containerDecoration2(),
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      piatto.allergeni,
                                      style: themeInfoPiattoCucina.textStyle3(),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      FutureBuilder(
                      future: controller.takeIngredienti(), // Assuming getPiatti returns a Future
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          // Display a loading indicator while waiting for data
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          // Display an error message if there's an error
                          return Text('Error: ${snapshot.error}');
                        } else {
                          // Display the data when available
                          return IngredientiWidgetInfoPiatto(
                        //qui
                        optionsList: snapshot.data!,
                        onUpdateSelection: (updatedSelection) {
                          setState(() {
                            ingredientiList = updatedSelection;
                          });
                        },
                        ingredientiList: ingredientiList,
                      );
                        }}),
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
                              style: themeInfoPiattoCucina.textStyle4(),
                            ),
                            onPressed: () async {
                              // Ottieni i dati dagli IngredientiWidget
                              piatto.ingredienti = ingredientiList;

                              if (await controller.UpdatePiatto(piatto)) {
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

  String createStringAllergeni(List<Allergeni> allergeni) {
    String nomi = "";
    for (int i = 0; i < allergeni.length; i++) {
      nomi = nomi + allergeni.elementAt(i).nome + ", ";
    }
    return nomi;
  }
}
