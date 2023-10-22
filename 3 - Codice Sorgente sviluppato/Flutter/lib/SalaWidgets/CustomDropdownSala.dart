import 'package:flutter/material.dart';
import 'package:prova1/SalaUI/Themes/ThemeHomeSala.dart';

class CustomDropdownSala extends StatefulWidget {
  ThemeHomeSala themeHomeSala = ThemeHomeSala();
  final List<String> options;
  final String hint;

  CustomDropdownSala({required this.options, required this.hint});

  @override
  _CustomDropdownSalaState createState() => _CustomDropdownSalaState();

  String? getSelectedValue() => _CustomDropdownSalaState.dropdownValue;
}

class _CustomDropdownSalaState extends State<CustomDropdownSala> {
  static String? dropdownValue;
  @override
  void initState() {
    // TODO: implement initState
    dropdownValue = widget.hint;
  }
  //List<String> options = ['Admin', 'Cucina', 'Supervisore', 'Sala'];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(190, 255, 255, 255),
      elevation: 4, // Altezza dell'ombra (puoi personalizzare il valore).
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(15.0), // Personalizza il bordo arrotondato.
      ),
      child: Container(
          width: 200.0,
          height: 50.0,
          decoration: const BoxDecoration(
              //border: Border.all(color: borderColor()),
              //color: Color.fromARGB(190, 255, 255, 255),
              ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Text("codice tavolo:", style: widget.themeHomeSala.textStyle2()),
              const Spacer(
                flex: 1,
              ),
              DropdownButton<String>(
                value: dropdownValue,
                hint: Text(
                  widget.hint,
                  style: TextStyle(color: Colors.black),
                ),
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: SizedBox(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: widget.options
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: Colors.black)),
                  );
                }).toList(),
              ),
            ],
          )),
    );
  }

  static Color borderColor() {
    return Color.fromARGB(255, 0, 0, 0).withOpacity(0.6);
  }
}
