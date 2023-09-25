import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/Themes/ThemeDispensaAdmin.dart';
import 'package:prova1/AdminUI/Themes/ThemeMessaggiAdmin.dart';
import 'package:prova1/ClientsWidgets/AlertDialogCustom.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/Controller.dart';
import 'package:prova1/Controller/ControllerAdmin/ControllerAdmin.dart';
import 'package:prova1/Controller/ControllerSupervisore/ControllerSupervisore.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Messaggio.dart';
import 'package:prova1/Model/PiattiScontrino.dart';
import 'package:prova1/Model/Tavolo.dart';
import 'package:prova1/SupervisoreUI/Themes/ThemeRicevuteSupervisore.dart';
import 'package:prova1/SupervisoreWidget/ControllerUISupervisore.dart';

class ListTavoli extends StatelessWidget {
  final List<Tavolo> tavoli;

  ListTavoli({required this.tavoli});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tavoli.length,
      itemBuilder: (context, index) {
        return Column(children: [
          ItemListTavoli(tavolo: tavoli[index]),
          const SizedBox(height: 20.0),
        ]);
      },
    );
  }
}

class ItemListTavoli extends StatefulWidget {
  final Tavolo tavolo;

  ItemListTavoli({required this.tavolo});
  ControllerUISupervisore controllerUISupervisore = ControllerUISupervisore();

  @override
  _ItemListTavoliState createState() => _ItemListTavoliState();
}

class _ItemListTavoliState extends State<ItemListTavoli> {
  ThemeRicevuteSupervisore themeRicevuteSupervisore =
      ThemeRicevuteSupervisore();

  ControllerSupervisore controller = ControllerSupervisore();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: themeRicevuteSupervisore.myBoxDecoration(),
      width: 800,
      height: 70.0,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Row(
              children: [
                const SizedBox(width: 30.0),
                Text(
                  'Tavolo ' + widget.tavolo.nome,
                  style: themeRicevuteSupervisore.textStyle3(),
                ),
                const Spacer(
                  flex: 1,
                ),
                Row(
                  children: [
                    if (widget.tavolo.attivo)
                      ElevatedButton(
                        child: const Text('CHIUDI IL TAVOLO'),
                        onPressed: () async {
                          bool userConfirmed = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialogCustom();
                            },
                          );
                          if (userConfirmed == true &&
                              controller.chiudiTavolo(widget.tavolo)) {
                            setState(() {
                              widget.tavolo.attivo = false;
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Errore nella chiusura del tavolo'),
                              ),
                            );
                          } // Inserisci qui la logica per chiudere il tavolo
                        },
                      ),
                    if (!widget.tavolo.attivo)
                      ElevatedButton(
                        onPressed: () async {
                          bool userConfirmed = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialogCustom();
                            },
                          );
                          if (userConfirmed == true &&
                              controller.apriTavolo(widget.tavolo)) {
                            setState(() {
                              widget.tavolo.attivo = true;
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Errore nella apertura del tavolo'),
                              ),
                            );
                          }
                          // Inserisci qui la logica per aprire il tavolo
                        },
                        child: const Text('APRI IL TAVOLO'),
                      ),
                    const SizedBox(width: 50.0),
                    ElevatedButton(
                      onPressed: () {
                        stampaContoTavolo(widget.tavolo);
                        // Inserisci qui la logica per stampare il conto
                      },
                      child: const Text('STAMPA CONTO'),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void stampaContoTavolo(Tavolo tavolo) {
    List<PiattiScontrino> piattiTavolo = controller.takePiattiPresi(tavolo);
    widget.controllerUISupervisore.createPDF(piattiTavolo, tavolo);
  }
}
