import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prova1/CucinaUI/Themes/ThemeInfoIngredienteCucina.dart';

class MyButtonQuantita extends StatefulWidget {
  @override
  MyButtonQuantitaState createState() => MyButtonQuantitaState();

  String quantita;
  String selectedOption = '';

  MyButtonQuantita({required this.quantita});

  /* @override
  _MyButtonQuantitaState createState() => _MyButtonQuantitaState();*/

  String getQuantita() {
    if (selectedOption.compareTo('Grammi') == 0) {
      double newQuantita;
      newQuantita = double.parse(quantita);
      newQuantita = newQuantita / 100;
      return newQuantita.toString();
    } else {
      return quantita;
    }
  }
}

class MyButtonQuantitaState extends State<MyButtonQuantita> {
  String selectedOption = "Kilogrammi"; // Opzione predefinita
  TextEditingController textEditingController = TextEditingController();

  Map<String, String> misura = {
    'Kilogrammi': 'Kg',
    'Grammi': 'g',
  };

  ThemeInfoIngredienteCucina themeInfoIngredienteCucina =
      ThemeInfoIngredienteCucina();

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    textEditingController.text = widget.quantita;
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setQuantita(textEditingController.text, selectedOption);
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 280.0,
      child: Row(
        children: [
          Text('QUANTITA: ', style: themeInfoIngredienteCucina.textStyle2()),
          Expanded(
              child: Container(
                  decoration: themeInfoIngredienteCucina.myContainerStyle(),
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              /*onEditingComplete: () => setQuantita(
                                  textEditingController.text, selectedOption),*/
                              focusNode: _focusNode,
                              controller: textEditingController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d+\.?\d{0,2}'))
                              ],
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter text...',
                              ),
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Text(misura[selectedOption]!),
                          IconButton(
                            onPressed: () {
                              _showDropdownMenu(context);
                            },
                            icon: const Icon(Icons.arrow_downward),
                            style: ButtonStyle(
                              iconSize: MaterialStateProperty.all(5),
                            ),
                          ),
                        ],
                      )))),
        ],
      ),
    );
  }

  void _showDropdownMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Seleziona un\'opzione'),
          content: DropdownButton<String>(
            value: selectedOption,
            onChanged: (String? newValue) {
              setState(() {
                if (newValue != null) {
                  selectedOption = newValue;
                  Navigator.of(context).pop(); // Chiudi il menu a discesa
                }
              });
            },
            items: <String>['Kilogrammi', 'Grammi']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  setQuantita(String newQuantita, String selectedOption) {
    widget.quantita = newQuantita;
    widget.selectedOption = selectedOption;
  }
}
