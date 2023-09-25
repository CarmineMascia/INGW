import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> options;
  final String hint;

  CustomDropdown({required this.options, required this.hint});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();

  String? getSelectedValue() => _CustomDropdownState.dropdownValue;
}

class _CustomDropdownState extends State<CustomDropdown> {
  static String? dropdownValue;
  @override
  void initState() {
    // TODO: implement initState
    dropdownValue = widget.hint;
  }
  //List<String> options = ['Admin', 'Cucina', 'Supervisore', 'Sala'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: borderColor()),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: DropdownButton<String>(
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
        items: widget.options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: TextStyle(color: Colors.black)),
          );
        }).toList(),
      ),
    );
  }

  static Color borderColor() {
    return Color.fromARGB(255, 0, 0, 0).withOpacity(0.6);
  }
}
