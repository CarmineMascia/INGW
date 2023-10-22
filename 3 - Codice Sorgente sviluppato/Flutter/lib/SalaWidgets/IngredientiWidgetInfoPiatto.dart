import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/Themes/ThemeAggiungiPiatto.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Model/Ingrediente.dart';

class IngredientiWidgetInfoPiatto extends StatefulWidget {
  final List<Ingrediente> optionsList;
  final Function(List<Ingrediente>) onUpdateSelection;
  final List<Ingrediente> ingredientiList;
  ThemeAggiungiPiatto themeAggiungiPiatto = ThemeAggiungiPiatto();

  IngredientiWidgetInfoPiatto(
      {required this.optionsList,
      required this.onUpdateSelection,
      required this.ingredientiList});

  @override
  _IngredientiWidgetInfoPiattoState createState() =>
      _IngredientiWidgetInfoPiattoState();
}

class _IngredientiWidgetInfoPiattoState
    extends State<IngredientiWidgetInfoPiatto> {
  List<String> selectedItems = [];
  List<Ingrediente> selectedIngredients = [];
  List<Ingrediente> optionsList = [];

  void addItemToList(String item, String quantity) {
    setState(() {
      selectedItems.add(item);
      var selectedIngredient =
          optionsList.firstWhere((elem) => elem.nome == item);
      selectedIngredient.quantita = quantity;
      selectedIngredients.add(selectedIngredient);
      optionsList.removeWhere((elem) => elem.nome == item);
      widget.onUpdateSelection(selectedIngredients);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    optionsList = widget.optionsList;
    widget.ingredientiList.forEach((element) {
      optionsList.removeWhere((elem) => elem.codice == element.codice);
      selectedItems.add(element.nome);
      selectedIngredients.add(element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: widget.themeAggiungiPiatto.containerDecoration(),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            WhiteLine(),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              'INGREDIENTI',
              style: widget.themeAggiungiPiatto.textStyle(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5.0,
            ),
            WhiteLine(),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 8.0,
                  children: [
                    for (String item in selectedItems)
                      Chip(
                        label: Column(
                          children: [
                            Text('$item', style: TextStyle(fontSize: 14)),
                            Text(
                                '${selectedIngredients.firstWhere((elem) => elem.nome == item).quantita} g',
                                style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
