import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/Themes/ThemeAggiungiPiatto.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Model/Ingrediente.dart';

class IngredientiWidget extends StatefulWidget {
  final List<Ingrediente> optionsList;
  final Function(List<Ingrediente>) onUpdateSelection;
  ThemeAggiungiPiatto themeAggiungiPiatto = ThemeAggiungiPiatto();

  IngredientiWidget(
      {required this.optionsList, required this.onUpdateSelection});

  @override
  _IngredientiWidgetState createState() => _IngredientiWidgetState();
}

class _IngredientiWidgetState extends State<IngredientiWidget> {
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
                        deleteIcon: Icon(Icons.cancel),
                        onDeleted: () {
                          setState(() {
                            selectedItems.remove(item);
                            optionsList.add(selectedIngredients
                                .firstWhere((elem) => elem.nome == item));
                            selectedIngredients
                                .removeWhere((elem) => elem.nome == item);
                            widget.onUpdateSelection(selectedIngredients);
                          });
                        },
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.center,
                child: FloatingActionButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Seleziona un elemento'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Inserisci la quantità in grammi',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              for (Ingrediente option in optionsList)
                                Builder(
                                  builder: (BuildContext context) {
                                    TextEditingController quantityController =
                                        TextEditingController();

                                    return ListTile(
                                      title: Row(
                                        children: [
                                          Expanded(child: Text(option.nome)),
                                          const SizedBox(width: 10),
                                          SizedBox(
                                            width: 60,
                                            child: TextField(
                                              controller: quantityController,
                                              keyboardType: TextInputType
                                                  .numberWithOptions(
                                                      decimal: true),
                                              decoration: InputDecoration(
                                                labelText: 'Quantità',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        String quantity =
                                            quantityController.text;
                                        addItemToList(option.nome, quantity);

                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
