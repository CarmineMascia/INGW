import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/Themes/ThemeStatisticheShop.dart';

class SelectDateWidget extends StatefulWidget {
  final Function(DateTime) changeStartDate;
  final Function(DateTime) changeEndDate;
  ThemeStatisticheShop themeStatisticheShop = ThemeStatisticheShop();

  SelectDateWidget({
    required this.changeStartDate,
    required this.changeEndDate,
  });

  @override
  _SelectDateWidgetState createState() => _SelectDateWidgetState();
}

class _SelectDateWidgetState extends State<SelectDateWidget> {
  DateTime _startDate = DateTime.now().subtract(const Duration(days: 7));
  DateTime _endDate = DateTime.now();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _startDate) {
      if (picked.isAfter(_endDate)) {
        SnackBar snackBar = const SnackBar(
            content: Text(
                'Non puoi inserire la data iniziale successiva a quella finale'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        setState(() {
          _startDate = picked;
          widget.changeStartDate(_startDate);
        });
      }
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _endDate) {
      if (picked.isBefore(_startDate)) {
        SnackBar snackBar = const SnackBar(
            content: Text(
                'Non puoi inserire una data finale antecedente a quella iniziale'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        setState(() {
          _endDate = picked;
          widget.changeEndDate(_endDate);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 120,
        width: 700,
        child: Card(
          color: Color.fromARGB(250, 255, 255, 255),
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text('SELEZIONA LE DATE:',
                      style: widget.themeStatisticheShop.textStyle4()),
                  const SizedBox(height: 20.0),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ElevatedButton(
                      onPressed: () => _selectStartDate(context),
                      child: Text('Inizio: ' +
                          _startDate.day.toString() +
                          '/' +
                          _startDate.month.toString() +
                          '/' +
                          _startDate.year.toString()),
                      style: widget.themeStatisticheShop.buttonStyle(),
                      /*ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),*/
                    ),
                    const SizedBox(width: 30.0),
                    ElevatedButton(
                      onPressed: () => _selectEndDate(context),
                      child: Text('Fine: ' +
                          _endDate.day.toString() +
                          '/' +
                          _endDate.month.toString() +
                          '/' +
                          _endDate.year.toString()),
                      style: widget.themeStatisticheShop.buttonStyle(),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
