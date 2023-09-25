import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prova1/AdminUI/Themes/ThemeDispensaAdmin.dart';
import 'package:prova1/ClientsWidgets/WidgetsLayout.dart';
import 'package:prova1/Controller/Controller.dart';
import 'package:prova1/Controller/ControllerAdmin/ControllerAdmin.dart';
import 'package:prova1/Model/Ingrediente.dart';

class ListDispensa extends StatelessWidget {
  final List<Ingrediente> dispensa;

  ListDispensa({required this.dispensa});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dispensa.length,
      itemBuilder: (context, index) {
        return Column(children: [
          ItemListDispensa(ingrediente: dispensa[index]),
          const SizedBox(height: 20.0),
        ]);
      },
    );
  }
}

class ItemListDispensa extends StatefulWidget {
  final Ingrediente ingrediente;

  ItemListDispensa({required this.ingrediente});

  @override
  _ItemListDispensaState createState() => _ItemListDispensaState();
}

class _ItemListDispensaState extends State<ItemListDispensa> {
  Controller controller = Controller();
  TextEditingController quantitaMinimaController = TextEditingController();
  ThemeDispensaAdmin themeDispensaAdmin = ThemeDispensaAdmin();

  @override
  void initState() {
    super.initState();
    quantitaMinimaController.text = widget.ingrediente.sogliaMinima;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0)
                .withOpacity(0.2), // Colore e opacità dell'ombra
            spreadRadius: 3, // Estensione dell'ombra
            blurRadius: 2, // Raggio di sfocatura
            offset: Offset(
                0, 2), // Posizione dell'ombra (spostata leggermente in basso)
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        color: Color.fromARGB(160, 255, 255, 255),
      ),
      height: 150.0,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: [
                const SizedBox(
                  width: 15.0,
                ),
                Text(
                  widget.ingrediente.nome,
                  style: themeDispensaAdmin.textStyle2(),
                ),
                const SizedBox(
                  width: 50.0,
                ),
                Text(
                  widget.ingrediente.codice,
                  style: themeDispensaAdmin.textStyle2(),
                ),
                const Spacer(
                  flex: 1,
                ),
                TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Seleziona un elemento'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Inserisci la quantità in KG'),
                                TextField(
                                  controller: quantitaMinimaController,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+\.?\d{0,2}'))
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                ElevatedButton(
                                    style: themeDispensaAdmin.buttonStyle(),
                                    onPressed: () {
                                      bool flag = controller.setSogliaMinima(
                                          widget.ingrediente,
                                          quantitaMinimaController.text);
                                      if (flag) {
                                        SnackBar snackBar = const SnackBar(
                                            content:
                                                Text('SOGLIA MINIMA SALVATA!'));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                        setState(() {
                                          widget.ingrediente.sogliaMinima =
                                              quantitaMinimaController.text;
                                        });
                                      } else {
                                        SnackBar snackBar = const SnackBar(
                                            content: Text(
                                                'ERRORE NEL SALVATAGGIO DELLA SOGLIA MINIMA, RIPROVARE!'));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                    child: const Text("CONFERMA")),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      "SOGLIA MINIMA : ${widget.ingrediente.sogliaMinima}Kg",
                      style: themeDispensaAdmin.textStyle2(),
                    )),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  widget.ingrediente.quantita + ' Kg',
                  style: themeDispensaAdmin.textStyle2(),
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  widget.ingrediente.scadenza.day.toString() +
                      "/" +
                      widget.ingrediente.scadenza.month.toString() +
                      "/" +
                      widget.ingrediente.scadenza.year.toString(),
                  style: themeDispensaAdmin.textStyle2(),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          WhiteLine(),
          Row(
            children: [
              const SizedBox(width: 20.0),
              Text(
                "Descrizione: ",
                style: themeDispensaAdmin.textStyle2(),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 70.0,
                    padding: const EdgeInsets.all(5.0),
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Text(widget.ingrediente.descrizione),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
