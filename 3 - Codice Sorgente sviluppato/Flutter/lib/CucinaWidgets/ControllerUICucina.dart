import 'package:flutter/material.dart';
import 'package:prova1/CucinaUI/LogicUI/DatiAccountCucina.dart';
import 'package:prova1/CucinaUI/LogicUI/DispensaCucina.dart';
import 'package:prova1/CucinaUI/LogicUI/MenuCucina.dart';
import 'package:prova1/CucinaUI/Themes/ThemeDatiAccountCucina.dart';
import 'package:prova1/Model/Cucina.dart';
import 'package:prova1/main.dart';

class ControllerUICucina {
  ThemeDatiAccountCucina themeDatiAccountCucina = ThemeDatiAccountCucina();

  Widget ButtonBarCucina(BuildContext context, Cucina cucina) {
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
                    builder: (context) => DatiAccountCucina(
                          cucina: cucina,
                        )));
              },
              child: const Text('DATI ACCOUNT')),
          //const Spacer(flex: 1),
          const SizedBox(width: 50.0),
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
                        DispensaCucina(cucina: cucina)));
              },
              child: const Text('DISPENSA')),
          const SizedBox(width: 50.0),
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
                        MenuCucina(cucina: cucina)));
              },
              child: const Text('MENU')),
        ],
      ),
    );
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
              style: themeDatiAccountCucina.textStyle2(),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.0),
              color: Colors.white,
              border: Border.all(
                color: Colors.black, // Colore del bordo
                width: 0.5, // Spessore del bordo
              ),
            ),
            width: 500.0,
            height: 35.0,
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
}
