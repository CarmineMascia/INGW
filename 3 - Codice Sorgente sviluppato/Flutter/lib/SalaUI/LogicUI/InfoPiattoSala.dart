import 'package:flutter/material.dart';
import 'package:prova1/ClientsWidgets/IngredientiWidget.dart';
import 'package:prova1/SalaWidgets/IngredientiWidgetInfoPiatto.dart';

import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/Controller.dart';
import 'package:prova1/SalaUI/Themes/ThemeInfoPiattoSala.dart';
import 'package:prova1/SalaWidgets/AppBarLayoutSala.dart';
import 'package:prova1/Model/Allergeni.dart';
import 'package:prova1/Model/Sala.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Piatti.dart';
import '../../ClientsWidgets/ThemeMain.dart';

class InfoPiattoSala extends StatefulWidget {
  final Sala sala;
  final Piatti piatto;
  const InfoPiattoSala(
      {super.key, required this.sala, required this.piatto});

  @override
  _InfoPiattoSalaState createState() => _InfoPiattoSalaState();
}

class _InfoPiattoSalaState extends State<InfoPiattoSala> {
  @override
  //Oggetti per la creazione della schermata
  late Piatti piatto;
  ThemeMain theme = ThemeMain();
  AppBarLayoutSala AppBar = AppBarLayoutSala();
  ThemeInfoPiattoSala themeInfoPiattoSala = ThemeInfoPiattoSala();
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
      appBar: AppBar.buildAppBar(context,widget.sala),
      body: theme.buildDecoratedBox(
        SafeArea(
          //SafeArea serve per garantire che non vengano sovrapposte cose doc:https://api.flutter.dev/flutter/widgets/SafeArea-class.html

          child: ListView(
            //ListView permette di fare quello che fa column solo già scrollabile
            children: [
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
                        style: themeInfoPiattoSala.textStyle(),
                      ),
                      const SizedBox(height: 5.0),
                      WhiteLine(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: themeInfoPiattoSala.containerDecoration(),
                        height: 400.0,
                        child: Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              Text(
                                "NOME: ",
                                style: themeInfoPiattoSala.textStyle2(),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                height: 50,
                                width: 250,
                                decoration: themeInfoPiattoSala
                                    .containerDecoration2(),
                                child: Text(
                                  piatto.nome,
                                  style: themeInfoPiattoSala.textStyle3(),
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
                                style: themeInfoPiattoSala.textStyle2(),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                height: 50,
                                width: 250,
                                decoration: themeInfoPiattoSala
                                    .containerDecoration2(),
                                child: Text(
                                  //piatto.codice,
                                  piatto.tipologia,
                                  style: themeInfoPiattoSala.textStyle3(),
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
                                style: themeInfoPiattoSala.textStyle2(),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                height: 50,
                                width: 250,
                                decoration: themeInfoPiattoSala
                                    .containerDecoration2(),
                                alignment: Alignment.center,
                                child: Text(
                                  piatto.prezzo,
                                  style: themeInfoPiattoSala.textStyle3(),
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
                        decoration: themeInfoPiattoSala.containerDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              WhiteLine(),
                              const SizedBox(height: 5.0),
                              Text(
                                "DESCRIZIONE",
                                style: themeInfoPiattoSala.textStyle(),
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
                                  decoration: themeInfoPiattoSala
                                      .containerDecoration2(),
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      piatto.descrizione,
                                      style: themeInfoPiattoSala.textStyle3(),
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
                        decoration: themeInfoPiattoSala.containerDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              WhiteLine(),
                              const SizedBox(height: 5.0),
                              Text(
                                "ALLERGENI",
                                style: themeInfoPiattoSala.textStyle(),
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
                                  decoration: themeInfoPiattoSala
                                      .containerDecoration2(),
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      piatto.allergeni,
                                      style: themeInfoPiattoSala.textStyle3(),
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
                      Row(children : [
                        const Spacer(flex: 1),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            child: Text(
                              "INDIETRO",
                              style: themeInfoPiattoSala.textStyle4(),
                            ),
                            onPressed: () async {
                                Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              minimumSize: const Size(200, 40),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            child: Text(
                              "SALVA",
                              style: themeInfoPiattoSala.textStyle4(),
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
                      )])
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

