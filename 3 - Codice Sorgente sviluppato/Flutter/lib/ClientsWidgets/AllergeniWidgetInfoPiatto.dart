import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/Themes/ThemeInfoPiatto.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Model/Allergeni.dart';

class AllergeniWidgetInfoPiatto extends StatefulWidget {
  List<Allergeni> optionsList;
  final Function(List<Allergeni>) onUpdateSelection;
  final List<Allergeni> allergeniList;
  ThemeInfoPiatto themeInfoPiatto = ThemeInfoPiatto();

  AllergeniWidgetInfoPiatto(
      {required this.optionsList,
      required this.onUpdateSelection,
      required this.allergeniList});

  @override
  _AllergeniWidgetInfoPiattoState createState() =>
      _AllergeniWidgetInfoPiattoState();
}

class _AllergeniWidgetInfoPiattoState extends State<AllergeniWidgetInfoPiatto> {
  List<Allergeni> optionsList = [];
  List<Allergeni> selectedItems = [];

  void addItemToList(String item) {
    setState(() {
      selectedItems.add(Allergeni(item));
      optionsList.removeWhere((elem) => elem.nome == item);
      widget.onUpdateSelection(selectedItems);
    });
  }

  @override
  void initState() {
    optionsList = widget.optionsList;
    widget.allergeniList.forEach((element) {
      optionsList.removeWhere((elem) => elem.nome == element.nome);
      selectedItems.add(element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: widget.themeInfoPiatto.containerDecoration(),
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
              style: widget.themeInfoPiatto.textStyle(),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5.0,
            ),
            WhiteLine(),
            Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
