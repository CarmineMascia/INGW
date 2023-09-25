import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/Themes/ThemeAggiungiPiatto.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Model/Allergeni.dart';

class AllergeniWidget extends StatelessWidget {
  final Function(String) onUpdateSelection;
  ThemeAggiungiPiatto themeAggiungiPiatto = ThemeAggiungiPiatto();
  TextEditingController controllerAllergeni = TextEditingController();

  AllergeniWidget({required this.onUpdateSelection});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: themeAggiungiPiatto.containerDecoration(),
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
              style: themeAggiungiPiatto.textStyle(),
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
                    controller: controllerAllergeni,
                    minLines: 7,
                    maxLines: 7,
                    decoration: themeAggiungiPiatto.TextFieldDecoration(),
                    onEditingComplete: () {
                      onUpdateSelection(controllerAllergeni.text);
                    },
                  ),
                ),
              ),
            )
            /*Container(
              // Altezza specifica per evitare problemi di layout
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 8.0,
                  children: [
                    for (Allergeni item in selectedItems)
                      Chip(
                        label: Text(item.nome),
                        deleteIcon: Icon(Icons.cancel),
                        onDeleted: () {
                          setState(() {
                            selectedItems.remove(item);
                            optionsList.add(item);
                            widget.onUpdateSelection(selectedItems);
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
                              for (Allergeni option in optionsList)
                                ListTile(
                                  title: Text(option.nome),
                                  onTap: () {
                                    addItemToList(option.nome);
                                    Navigator.pop(context);
                                  },
                                ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  backgroundColor: Colors.black, // Colore di sfondo del bottone
                  foregroundColor:
                      Colors.white, // Colore dell'icona del bottone
                  child: Icon(Icons.add),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
