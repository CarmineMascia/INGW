import 'package:flutter/material.dart';
import 'package:prova1/AdminUI/LogicUI/CreaAccount.dart';
import 'package:prova1/AdminUI/LogicUI/DispensaAdmin.dart';
import 'package:prova1/AdminUI/LogicUI/MenuAdmin.dart';
import 'package:prova1/AdminUI/LogicUI/MessaggiAdmin.dart';
import 'package:prova1/AdminUI/LogicUI/StatisticheShop.dart';
import 'package:prova1/AdminUI/Themes/ThemeCreaAccount.dart';
import 'package:prova1/AdminUI/Themes/ThemeDatiAccount.dart';
import 'package:prova1/AdminUI/LogicUI/DatiAccountAdmin.dart';
import 'package:prova1/Model/Admin.dart';

class ControllerUI {
  ThemeDatiAccount datiAccount = ThemeDatiAccount();

  /*questo Map contiene le routes per tutte le varie classi
  Map<String, WidgetBuilder> routes = {
    'CreaAccount': (context) => CreaAccount(),
    'DatiAccount': (context) => DatiAccount(),
  };*/

  Widget ButtonBarAdmin(BuildContext context, Admin admin) {
    return Container(
      color: const Color.fromRGBO(255, 255, 255, 0.4),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(4.0),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  fixedSize:
                      MaterialStateProperty.all(const Size(180.0, 10.0))),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StatisticheShop(
                          admin: admin,
                        )));
              },
              child: const Text('STATISTICHE')),
          const Spacer(flex: 2),
          ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(4.0),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  fixedSize:
                      MaterialStateProperty.all(const Size(180.0, 10.0))),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DatiAccountAdmin(
                          admin: admin,
                        )));
              },
              child: const Text('DATI ACCOUNT')),
          const Spacer(flex: 2),
          ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(4.0),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  fixedSize:
                      MaterialStateProperty.all(const Size(180.0, 10.0))),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MessaggiAdmin(
                          admin: admin,
                        )));
              },
              child: const Text('MESSAGGI')),
          const Spacer(flex: 2),
          ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(4.0),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  fixedSize:
                      MaterialStateProperty.all(const Size(180.0, 10.0))),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => /*DispensaAdmin()*/
                        DispensaAdmin(admin: admin)));
              },
              child: const Text('DISPENSA')),
          const Spacer(flex: 2),
          ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(4.0),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  fixedSize:
                      MaterialStateProperty.all(const Size(180.0, 10.0))),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => /*DispensaAdmin()*/
                        MenuAdmin(admin: admin)));
              },
              child: const Text('MENU')),
          const Spacer(flex: 2),
          ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(4.0),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  fixedSize:
                      MaterialStateProperty.all(const Size(180.0, 10.0))),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => CreaAccount(admin: admin)),
                );
              },
              child: const Text('CREA ACCOUNT')),
        ],
      ),
    );
  }

  /* Widget ButtonBarAdmin(BuildContext context, Map<String, String> functions) {
    List<Widget> buttons = [];
    functions.forEach((key, value) {
      //alla fine del progetto levare il ? e mettere routes[values]!
      WidgetBuilder? builder = routes[value];
      buttons.add(ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(4.0),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              foregroundColor: MaterialStateProperty.all(Colors.black),
              fixedSize: MaterialStateProperty.all(Size(180.0, 10.0))),
          onPressed: () {
            if (builder != null) {
              Navigator.of(context).push(MaterialPageRoute(builder: builder));
            }
          },
          child: Text(key)));
      buttons.add(const Spacer(
        flex: 2,
      ));
    });
    return Container(
      color: const Color.fromRGBO(255, 255, 255, 0.4),
      padding: EdgeInsets.all(10.0),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: buttons),
    );
  }*/

  Widget ShowTextStatistiche(String key, String value) {
    return Container(
        width: 700,
        child: Card(
          color: Color.fromARGB(250, 255, 255, 255),
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  key,
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
        ));
  }

  Widget ShowText(String key, String value) {
    return SizedBox(
      width: 500.0,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft, // Allinea il Text in alto a sinistra
            child: Text(
              key,
              style: ThemeDatiAccount.textStyle(),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              border: Border.all(
                color: Colors.black, // Colore del bordo
                width: 0.5, // Spessore del bordo
              ),
            ),
            width: 500.0,
            height: 30.0,
            padding: const EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    value,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget CreaAccountFields(List<String> keys) {
    List<Widget> list = [];
    for (var element in keys) {
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

  /*
  class CreaAccountFieldsWidget extends StatefulWidget {
  final List<String> keys;

  CreaAccountFieldsWidget({required this.keys});

  @override
  _CreaAccountFieldsState createState() => _CreaAccountFieldsState();
}

class _CreaAccountFieldsState extends State<CreaAccountFieldsWidget> {
  Map<String, String?> formData = {};

  // Restituisci i dati immessi
  Map<String, String?> getFormData() {
    return formData;
  }

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

    list.add(
      ElevatedButton(
        onPressed: () {
          // Fai qualcosa con i dati
          print('Dati immessi: $formData');
        },
        child: Text('Invia'),
      ),
    );

    return SizedBox(
      width: 500,
      child: Column(
        children: list,
      ),
    );
  }
}
  */
}
