import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/SalaUI/Themes/ThemeHomeSala.dart';

class MenuWidgetSala extends StatelessWidget {
  final Map<Piatti, TextEditingController> ordine;
  Map<String, List<Piatti>> categoriePiatti;
  //ControllerSala controller = ControllerSala();
  ThemeHomeSala themeHomeSala = ThemeHomeSala();

  MenuWidgetSala({
    required this.categoriePiatti,
    required this.ordine,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1000,
        width: 800,
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
            color: Color.fromARGB(
                210, 255, 255, 255) //Color.fromARGB(235, 255, 255, 255),
            ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(
            children: [
              for (int i = 0; i < categoriePiatti.length; i++)
                createChild(categoriePiatti.keys.elementAt(i),
                    categoriePiatti.values.elementAt(i)),
            ],
          ),
        ));
  }

  Widget createChild(String key, List<Piatti> values) {
    return Column(
      children: [
        BlackLine(),
        Text(key, style: themeHomeSala.textStyle()),
        BlackLine(),
        const SizedBox(
          height: 30.0,
        ),
        for (int i = 0; i < values.length; i++)
          createPiattoRow(values.elementAt(i)),
        const SizedBox(
          height: 30.0,
        ),
      ],
    );
  }

  Widget createPiattoRow(Piatti piatto) {
    TextEditingController textEditingController =
        ordine[piatto] ?? TextEditingController();
    return Container(
      width: 500.0,
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                height: 5.0,
              ),
              Text(
                piatto.nome,
                style: themeHomeSala.textStyle2(),
              ),
              const Spacer(
                flex: 1,
              ),
              Text(
                "QNT.",
                style: themeHomeSala.textStyle2(),
              ),
              const SizedBox(
                width: 5.0,
              ),
              customTextField(textEditingController),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          BlackLine(),
          const SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }

  Widget customTextField(TextEditingController textEditingController) {
    return Container(
      height: 35,
      width: 60,
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d{0,2}$')),
        ],
      ),
    );
  }

  Map<Piatti, TextEditingController> getOrdine() {
    return ordine;
  }

  void setTextEditingController(Map<Piatti, String> currentValue) {
    for (int i = 0; i < currentValue.length; i++) {
      ordine[currentValue.keys.elementAt(i)]?.text =
          currentValue.values.elementAt(i);
    }
  }
}
