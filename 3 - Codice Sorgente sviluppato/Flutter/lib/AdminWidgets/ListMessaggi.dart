import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/Themes/ThemeDispensaAdmin.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/ControllerAdmin/Controller.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Messaggio.dart';

class ListMessaggi extends StatelessWidget {
  final List<Messaggio> messaggi;

  ListMessaggi({required this.messaggi});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messaggi.length,
      itemBuilder: (context, index) {
        return Column(children: [
          ItemListMessaggi(messaggio: messaggi[index]),
          const SizedBox(height: 20.0),
        ]);
      },
    );
  }
}

class ItemListMessaggi extends StatelessWidget {
  final Messaggio messaggio;
  ItemListMessaggi({required this.messaggio});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0)
                .withOpacity(0.2), // Colore e opacità dell'ombra
            spreadRadius: 3, // Estensione dell'ombra
            blurRadius: 2, // Raggio di sfocatura
            offset: const Offset(
                0, 2), // Posizione dell'ombra (spostata leggermente in basso)
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromARGB(160, 255, 255, 255),
      ),
      height: 150.0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                const SizedBox(width: 20.0),
                Column(
                  children: [
                    Text(
                      "Messaggio: ",
                      style: ThemeDispensaAdmin.textStyle2(),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      messaggio.data.day.toString() +
                          '/' +
                          messaggio.data.month.toString() +
                          '/' +
                          messaggio.data.year.toString(),
                      style: ThemeDispensaAdmin.textStyle2(),
                    ),
                  ],
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 80.0,
                      padding: const EdgeInsets.all(20.0),
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Text(messaggio.messaggio),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
