import 'dart:convert';

import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:prova1/Model/Allergeni.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Messaggio.dart';
import 'package:prova1/Model/Ordine.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/Model/PiattiScontrino.dart';
import 'package:prova1/Model/Tavolo.dart';
import 'package:http/http.dart' as http;
import 'package:prova1/Connection/Settings.dart';

class SalaConnessioneDB {
  Future<bool> salvaNuovoOrdineSala(List<Piatti> ordine,Tavolo tavolo) async {
    for(Piatti piatto in ordine){
    var url = "${Settings.url}dishOfOrder/";
    final url2 = Uri.parse(url);
  final response2 = await http.post(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode({
    "tableNumber":tavolo.nome,
    "dishId":piatto.id
})
  );
  }
      return true;
  }
}
