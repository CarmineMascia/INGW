import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:prova1/AdminWidgets/AppBarLayout.dart';
import 'package:prova1/AdminWidgets/SelectDateWidget.dart';
import 'package:prova1/AdminWidgets/VerticalBarChart.dart';
import 'package:prova1/Model/Admin.dart';
import '../../ClientsWidgets/ThemeMain.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/AdminWidgets/ControllerUI.dart';
import '../Themes/ThemeStatisticheShop.dart';
import 'package:prova1/Controller/ControllerAdmin/ControllerAdmin.dart'; // Importa il pacchetto fl_chart

class StatisticheShop extends StatefulWidget {
  final Admin admin;
  ControllerAdmin controller = ControllerAdmin();
  ThemeMain theme = ThemeMain();
  ThemeStatisticheShop themeStatisticheShop = ThemeStatisticheShop();
  AppBarLayout appBar = AppBarLayout();
  ControllerUI controllerUI = ControllerUI();

  StatisticheShop({super.key, required this.admin});

  @override
  _StatisticheShopState createState() => _StatisticheShopState();
}

class _StatisticheShopState extends State<StatisticheShop> {
  // ... Il resto del codice rimane invariato ...
  late DateTime startDate;
  late DateTime endDate;
  double incassoMedio = 10.0;
  double valoreMedioConto = 30.0;
  double incassoComplessivo = 50.0;
  Map<DateTime, double> incassoGiornalieroStatistiche = {};

  @override
  void initState() {
    super.initState();
    startDate = DateTime.now().subtract(Duration(days: 7));
    endDate = DateTime.now();
    updateStatistics();
  }

  void updateStatistics() {
    setState(() {
      //aggiungere anche gli altri grafici
      incassoGiornalieroStatistiche =
          widget.controller.getIncassoGiornaliero(startDate, endDate);
      incassoMedio =
          widget.controller.getIncassoMedio(incassoGiornalieroStatistiche);
      valoreMedioConto =
          widget.controller.getValoreMedioConto(startDate, endDate);
      incassoComplessivo = widget.controller
          .getIncassoComplessivo(incassoGiornalieroStatistiche);
    });

    /*SnackBar snackBar = SnackBar(content: Text(startDate.toString()));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
  }

  void changeStartDate(DateTime newDate) {
    startDate = newDate;
    updateStatistics();

    /*SnackBar snackBar = SnackBar(content: Text(startDate.toString()));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
  }

  void changeEndDate(DateTime newDate) {
    endDate = newDate;
    updateStatistics();
    /*SnackBar snackBar = SnackBar(content: Text(endDate.toString()));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: widget.appBar.buildAppBar(context, widget.admin),
        body: widget.theme.buildDecoratedBox(SafeArea(
            //SafeArea serve per garantire che non vengano sovrapposte cose doc:https://api.flutter.dev/flutter/widgets/SafeArea-class.html

            child: ListView(
          //ListView permette di fare quello che fa column solo già scrollabile
          children: [
            widget.controllerUI.ButtonBarAdmin(context, widget.admin),
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                color: const Color.fromRGBO(255, 255, 255, 0.4),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    WhiteLine(),
                    const SizedBox(height: 5.0),
                    Text(
                      "STATISTICHE",
                      style: widget.themeStatisticheShop.textStyle(),
                    ),
                    const SizedBox(height: 5.0),
                    WhiteLine(),

                    //SOTTO STA IL CODICE PER IL GRAFICO*/
                    // ... Il resto del codice rimane invariato ...

                    const SizedBox(height: 20),

                    //selectDateWidget,

                    SelectDateWidget(
                        changeStartDate: changeStartDate,
                        changeEndDate: changeEndDate),
                    const SizedBox(
                      height: 60.0,
                    ),

                    Column(children: [
                      widget.controllerUI.ShowTextStatistiche(
                          "INCASSO MEDIO", incassoMedio.toString()),
                      const SizedBox(height: 50.0),
                      widget.controllerUI.ShowTextStatistiche(
                          "VALORE MEDIO CONTO", valoreMedioConto.toString()),
                      const SizedBox(height: 50.0),
                      widget.controllerUI.ShowTextStatistiche(
                          "INCASSO COMPLESSIVO", incassoComplessivo.toString()),
                      const SizedBox(height: 50.0),
                      VerticalBarChart(
                        key: UniqueKey(),
                        data: incassoGiornalieroStatistiche,
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ))));
  }
}
