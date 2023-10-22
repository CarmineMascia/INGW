import 'dart:convert';

import 'package:prova1/Connection/Settings.dart';
import 'package:prova1/Model/Cucina.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/ConnectionInterface/CucinaConnessioneDB_interface.dart';
import 'package:http/http.dart' as http;

class CucinaConnessioneDB implements CucinaConnessioneDB_interface{
  @override
  bool UpdateIngredientiDB(Piatti piatto) {
    return true;
  }

  @override
  Future<Cucina> takeInfoDB(Cucina cucina) async {
    var url = "${Settings.url}userget/";

    final url2 = Uri.parse(url);
  final response = await http.post(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode({
          'name': cucina.email, 
       })
  );
  var json = jsonDecode(response.body);
    return (Cucina(json['nome'], json['cognome'], json['name'], 'lalalala'));
    
  }
}
