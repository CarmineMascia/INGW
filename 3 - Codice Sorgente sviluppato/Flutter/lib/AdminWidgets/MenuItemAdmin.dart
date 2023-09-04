import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/LogicUI/AggiungiPiatto.dart';
import 'package:prova1/AdminUI/LogicUI/InfoPiatto.dart';
import 'package:prova1/AdminUI/Themes/ThemeMenuAdmin.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/ControllerAdmin/Controller.dart';
import 'package:prova1/Model/Admin.dart';
import 'package:prova1/Model/Piatti.dart';

class MenuItemAdmin extends StatefulWidget {
  final String nome;
  List<Piatti> piatti;
  Controller controller = Controller();
  final Admin admin;

  MenuItemAdmin(
      {required this.nome, required this.piatti, required this.admin});

  @override
  _MenuItemAdminState createState() => _MenuItemAdminState();
}

class _MenuItemAdminState extends State<MenuItemAdmin> {
  bool isEditMode = false; // Modalità di modifica
  List<Piatti> selectedPiatti = []; // Lista dei piatti selezionati

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 500,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0)
                .withOpacity(0.2), // Colore e opacità dell'ombra
            spreadRadius: 3, // Estensione dell'ombra
            blurRadius: 2, // Raggio di sfocatura
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(235, 255, 255, 255),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlackLine(),
            const SizedBox(height: 5),
            Text(widget.nome, style: ThemeMenuAdmin.textStyle()),
            const SizedBox(height: 10),
            BlackLine(),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    widget.piatti.length,
                    (index) => Column(
                      children: [
                        Row(
                          children: [
                            if (isEditMode)
                              Checkbox(
                                value: selectedPiatti
                                    .contains(widget.piatti[index]),
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value == true) {
                                      selectedPiatti.add(widget.piatti[index]);
                                    } else {
                                      selectedPiatti
                                          .remove(widget.piatti[index]);
                                    }
                                  });
                                },
                              ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => InfoPiatto(
                                          admin: widget.admin,
                                          piatto:
                                              widget.piatti.elementAt(index),
                                        )));
                              }, //mettere il Navigator
                              child: Text(
                                widget.piatti.elementAt(index).nome,
                                style: ThemeMenuAdmin.textStyle2(),
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              widget.piatti.elementAt(index).prezzo + '€',
                              style: ThemeMenuAdmin.textStyle2(),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: BlackLine(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (!isEditMode)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isEditMode = true;
                      });
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AggiungiPiatto(
                                admin: widget.admin,
                              )));
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            if (isEditMode)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isEditMode = false;
                      });
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  IconButton(
                    onPressed: () {
                      // Aggiungi logica per il pulsante cestino
                      setState(() {
                        widget.controller.DeletePiatti(selectedPiatti);
                        for (var item in selectedPiatti) {
                          widget.piatti.remove(item);
                        }
                      });
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
