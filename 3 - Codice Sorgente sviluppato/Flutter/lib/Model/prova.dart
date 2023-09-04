/*import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart'
    as charts; // Per il grafico a barre

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistiche Incasso'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            Text(
              'Seleziona la data:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            DateSelector(), // Selettore di date
            SizedBox(height: 16.0),
            Text(
              'Statistiche:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            StatCard(
              title: 'Incasso Medio',
              value: '\$100.00', // Valore ipotetico
            ),
            SizedBox(height: 8.0),
            StatCard(
              title: 'Valore Medio Conto',
              value: '\$50.00', // Valore ipotetico
            ),
            SizedBox(height: 8.0),
            StatCard(
              title: 'Incasso Totale',
              value: '\$500.00', // Valore ipotetico
            ),
            SizedBox(height: 16.0),
            Text(
              'Grafico Incasso Giornaliero:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: BarChart(
                _createSampleData(), // Dati del grafico ipotetici
                animate: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<charts.Series<DaySales, String>> _createSampleData() {
    final data = [
      DaySales('Day 1', 100),
      DaySales('Day 2', 200),
      DaySales('Day 3', 150),
      DaySales('Day 4', 300),
      DaySales('Day 5', 400),
    ];

    return [
      charts.Series<DaySales, String>(
        id: 'Sales',
        domainFn: (DaySales sales, _) => sales.day,
        measureFn: (DaySales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class DateSelector extends StatefulWidget {
  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            "${selectedDate.toLocal()}".split(' ')[0],
            style: TextStyle(
              fontSize: 55,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(
          onPressed: () => _selectDate(context),
          icon: Icon(
            Icons.calendar_today,
            size: 50.0,
          ),
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              value,
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DaySales {
  final String day;
  final int sales;

  DaySales(this.day, this.sales);
}

class BarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  BarChart(this.seriesList, {required this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
      behaviors: [
        charts.SeriesLegend(
          position: charts.BehaviorPosition.bottom,
          horizontalFirst: false,
          cellPadding: EdgeInsets.all(4.0),
        ),
      ],
    );
  }
}
*/
/*import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // Simula dati di vendita giornalieri
  final List<DaySales> dailySales = [
    DaySales('Day 1', 100),
    DaySales('Day 2', 200),
    DaySales('Day 3', 150),
    DaySales('Day 4', 300),
    DaySales('Day 5', 400),
    DaySales('Day 6', 100),
    DaySales('Day 7', 200),
    DaySales('Day 8', 150),
    DaySales('Day 9', 300),
    DaySales('Day 10', 400),
    DaySales('Day 11', 100),
    DaySales('Day 12', 200),
    DaySales('Day 13', 150),
    DaySales('Day 14', 300),
    DaySales('Day 15', 400),
    // Aggiungi qui più dati giornalieri
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistiche Incasso'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16.0),
          // Aggiungi il selettore di date qui

          SizedBox(height: 16.0),
          Text(
            'Grafico Incasso Giornaliero:',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 8.0),
          // Utilizza ListView.builder per creare un elenco scorrevole di grafici
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dailySales.length,
              itemBuilder: (context, index) {
                final daySales = dailySales[index];
                return Container(
                  width: 300.0, // Larghezza del grafico
                  child: Card(
                    elevation: 4.0,
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: LineChart(
                        LineChartData(
                            // Configura i dati del grafico qui
                            ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DaySales {
  final String day;
  final int sales;

  DaySales(this.day, this.sales);
}*/
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // Simula dati di incasso giornaliero
  final List<DaySales> dailySales = [
    DaySales('Day 1', 100),
    DaySales('Day 2', 200),
    DaySales('Day 3', 150),
    DaySales('Day 4', 300),
    DaySales('Day 5', 400),
    DaySales('Day 6', 100),
    DaySales('Day 7', 200),
    DaySales('Day 8', 150),
    DaySales('Day 9', 300),
    DaySales('Day 10', 400),
    DaySales('Day 11', 100),
    DaySales('Day 12', 200),
    DaySales('Day 13', 150),
    DaySales('Day 14', 300),
    DaySales('Day 15', 400),
    // Aggiungi qui più dati giornalieri
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistiche Incasso'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16.0),
          Text(
            'Grafico Incasso Giornaliero:',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 8.0),
          // Utilizza ListView per rendere il grafico a barre scrollabile
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 300.0, // Larghezza del grafico
                  child: Card(
                    elevation: 4.0,
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: BarChart(
                        BarChartData(
                          // Configura i dati del grafico

                          titlesData: FlTitlesData(
                              show: false), // Nasconde le etichette
                        ),
                      ),
                    ),
                  ),
                ),
                // Aggiungi più container per visualizzare più date
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DaySales {
  final String day;
  final int sales;

  DaySales(this.day, this.sales);
}
