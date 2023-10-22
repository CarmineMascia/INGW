import 'package:flutter/material.dart';
import 'package:prova1/ClientsWidgets/ListMessaggi.dart';

import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/Controller.dart';
import 'package:prova1/Controller/ControllerSala/ControllerSala.dart';

import 'package:prova1/Model/Messaggio.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/Model/Sala.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/Model/Tavolo.dart';
import 'package:prova1/SalaUI/Themes/ThemeResoconto.dart';
import 'package:prova1/SalaWidgets/AppBarLayoutSala.dart';
import 'package:prova1/SalaWidgets/ListPiattiOrdinati.dart';
import 'package:prova1/SupervisoreUI/Themes/ThemeMessaggiSupervisore.dart';
import 'package:prova1/SupervisoreUI/Themes/ThemeRicevuteSupervisore.dart';

import 'package:prova1/SupervisoreWidget/AppBarLayoutSupervisore.dart';
import 'package:prova1/SupervisoreWidget/ControllerUISupervisore.dart';
import 'package:prova1/SupervisoreWidget/ListTavoli.dart';
import 'package:prova1/SupervisoreWidget/SearchBarWidgetSupervisore.dart';
import '../../ClientsWidgets/ThemeMain.dart';

class Resoconto extends StatefulWidget {
  @override
  final Sala sala;
  final Tavolo tavolo;
  final Map<Piatti, String> ordine;
  const Resoconto(
      {super.key,
      required this.sala,
      required this.ordine,
      required this.tavolo});
  _ResocontoState createState() => _ResocontoState();
}

class _ResocontoState extends State<Resoconto> {
  Controller controller = Controller();
  ControllerSala controllerSala = ControllerSala();
  ThemeMain theme = ThemeMain();
  AppBarLayoutSala AppBar = AppBarLayoutSala();
  ThemeResocoto themeResocoto = ThemeResocoto();
  //Admin admin = Controller().takeAdminInfoDB();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //controller.setToZeroNotifications();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar.buildAppBar(context,widget.sala),
      body: theme.buildDecoratedBox(
        SafeArea(
          child: ListView(
            children: [
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
                        "RESOCONTO TAVOLO ${widget.tavolo.nome}",
                        style: themeResocoto.textStyle(),
                      ),
                      const SizedBox(height: 5.0),
                      WhiteLine(),
                      const SizedBox(height: 50.0),
                      Column(
                        children: [
                          Container(
                            height: 450.0,
                            child: ListPiattiOrdinati(
                              ordine: widget.ordine,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      WhiteLine(),
                      const SizedBox(height: 15.0),
                      Row(children: [
                        const Spacer(
                          flex: 1,
                        ),
                        ElevatedButton(
                            style: themeResocoto.buttonStyle(),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("INDIETRO")),
                        const SizedBox(
                          width: 50.0,
                        ),
                        ElevatedButton(
                            style: themeResocoto.buttonStyle(),
                            onPressed: () async {
                              if (await controllerSala
                                  .salvaNuovoOrdineSala(widget.ordine,widget.tavolo)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('ORDINE SALVATO'),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('ERRORE'),
                                  ),
                                );
                              }
                            },
                            child: const Text("SALVA")),
                      ])
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
