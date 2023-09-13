import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/Model/PiattiScontrino.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/Model/Tavolo.dart';
import 'package:prova1/SupervisoreUI/LogicUI/DatiAccountSupervisore.dart';
import 'package:prova1/SupervisoreUI/LogicUI/DispensaSupervisore.dart';
import 'package:prova1/SupervisoreUI/LogicUI/MenuSupervisore.dart';
import 'package:prova1/SupervisoreUI/LogicUI/MessaggiSupervisore.dart';
import 'package:prova1/SupervisoreUI/LogicUI/RicevuteSupervisore.dart';
import 'package:prova1/SupervisoreUI/Themes/ThemeDatiAccount.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/widgets.dart' as widgets;

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ControllerUISupervisore {
  ThemeDatiAccountSupervisore themeDatiAccountSupervisore =
      ThemeDatiAccountSupervisore();

  Widget ShowText(String key, String value) {
    return SizedBox(
      width: 500.0,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft, // Allinea il Text in alto a sinistra
            child: Text(
              key,
              style: themeDatiAccountSupervisore.textStyle2(),
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

  Widget buttonBarSupervisore(BuildContext context, Supervisore supervisore) {
    return Container(
      color: const Color.fromRGBO(255, 255, 255, 0.4),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 2,
          ),
          /*ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(4.0),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  fixedSize:
                      MaterialStateProperty.all(const Size(180.0, 10.0))),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MessaggiSupervisore(
                          supervisore: supervisore,
                        )));
              },
              child: const Text('MESSAGGI')),
          const Spacer(flex: 2),*/
          ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(4.0),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  fixedSize:
                      MaterialStateProperty.all(const Size(180.0, 10.0))),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DatiAccountSupervisore(
                          supervisore: supervisore,
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
                    builder: (context) => MenuSupervisore(
                          supervisore: supervisore,
                        )));
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => /*DispensaAdmin()*/
                        DispensaSupervisore(supervisore: supervisore)));
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
                        RicevuteSupervisore(supervisore: supervisore)));
              },
              child: const Text('RICEVUTE')),
          Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }

  Future<void> createPDF(List<PiattiScontrino> plates, Tavolo tavolo) async {
    final pdf = pw.Document();
    /*final ByteData data =
        await rootBundle.load('assets/path_to_your_image.jpg');
    final Uint8List uint8List = data.buffer.asUint8List();*/

    // Aggiungi il titolo del conto
    pdf.addPage(pw.MultiPage(
      build: (context) => [
        pw.Center(child: pw.Text('RATATOUILLE23')),

        pw.SizedBox(height: 10),
        pw.Center(
          child: pw.Text('Conto del Tavolo ${tavolo.nome}'),
        ),
        pw.SizedBox(height: 10),
        // Elenco dei piatti nel conto
        pw.TableHelper.fromTextArray(
          headers: ['Nome', 'Quantità', 'Prezzo'],
          data: plates.map((plate) {
            final total = plate.quantita * plate.prezzoPerUnita;
            return [plate.nome, plate.quantita, total];
          }).toList(),
        ),
      ],
    ));

    // Ottieni la directory temporanea per salvare il file PDF
    // Ottieni la directory desiderata per salvare il file PDF

    // Ottieni la data e l'orario correnti formattati come 'anno-mese-giorno-orario'
    final now = DateTime.now();
    final formattedDateTime = DateFormat('yyyy-MM-dd-HH-mm-ss').format(now);
    final directory = await getApplicationDocumentsDirectory();
    final filePath;
    if (tavolo.attivo == true) {
      filePath =
          '${directory.path}/conto_provvisorio_tavolo_${tavolo.nome}_$formattedDateTime.pdf';
    } else {
      filePath =
          '${directory.path}/conto_tavolo_${tavolo.nome}_$formattedDateTime.pdf';
    }

    // Salva il file PDF nella directory desiderata
    final file = File(filePath);
    await file.writeAsBytes(await pdf.save());

    await launchUrl(Uri.parse(filePath));

    // Il file PDF è stato memorizzato nella directory specificata

    // Ora hai il tuo file PDF salvato in filePath
    // Puoi gestire il file come desideri, ad esempio condividerlo o aprirlo.

    // Esempio di come puoi condividere il file PDF
    // await Share.shareFiles([filePath], text: 'Condividi conto del Tavolo ${tavolo.codice}');
  }
}
