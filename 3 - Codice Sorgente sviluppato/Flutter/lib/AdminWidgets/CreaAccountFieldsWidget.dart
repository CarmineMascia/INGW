import 'package:flutter/material.dart';

class CreaAccountFieldsWidget extends StatefulWidget {
  final List<String> keys;

  CreaAccountFieldsWidget({required this.keys});

  @override
  _CreaAccountFieldsState createState() => _CreaAccountFieldsState();
  /*CreaAccountFieldsWidget({required this.keys});

  @override
  _CreaAccountFieldsState createState() => _CreaAccountFieldsState();
  */
  Map<String, String?> getData() => _CreaAccountFieldsState.formData;
}

class _CreaAccountFieldsState extends State<CreaAccountFieldsWidget> {
  static Map<String, String?> formData = {};

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];

    for (var element in widget.keys) {
      list.add(
        Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: element,
                labelStyle: const TextStyle(color: Colors.black),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  formData[element] = value;
                });
              },
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      );
    }

    return SizedBox(
      width: 500,
      child: Column(
        children: list,
      ),
    );
  }
}
