import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class VerticalBarChart extends StatefulWidget {
  Map<DateTime, double> data;

  VerticalBarChart({
    Key? key, // Aggiungi una chiave
    required this.data,
  }) : super(key: key);

  @override
  _VerticalBarChartState createState() => _VerticalBarChartState();
}

class _VerticalBarChartState extends State<VerticalBarChart> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = convertToList(widget.data);
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color.fromARGB(250, 255, 255, 255),
        elevation: 4.0,
        child: Column(children: [
          SizedBox(
            height: 16.0,
          ),
          Text(
            'INCASSO GIORNALIERO',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          SfCartesianChart(
              key: widget.key,
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(),
              tooltipBehavior: _tooltip,
              series: <ChartSeries<_ChartData, String>>[
                ColumnSeries<_ChartData, String>(
                    dataSource: data,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    name: 'Incasso giornaliero',
                    color: Color.fromRGBO(70, 172, 255, 1))
              ])
        ]));
  }

  List<_ChartData> convertToList(Map<DateTime, double> data) {
    List<_ChartData> returnValue = [];

    data.forEach((key, value) {
      returnValue.add(_ChartData(key.toString().split(' ')[0], value));
    });
    return returnValue;
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
