import 'dart:convert';

import 'package:prova1/Connection/Settings.dart';
import 'package:prova1/Model/PiattiScontrino.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/Model/Tavolo.dart';
import 'package:http/http.dart' as http;
import 'package:prova1/ConnectionInterface/SupervisoreConnessioneDB_interface.dart';

class SupervisoreConnessioneDB implements SupervisoreConnessioneDB_interface{
  @override
  Future<Supervisore> takeSupervisoreInfoDB(String supervisore) async{
var url = "${Settings.url}userget/";

    final url2 = Uri.parse(url);
  final response = await http.post(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode({
          'name': supervisore, 
       })
  );
  var json = jsonDecode(response.body);
    return (Supervisore(json['nome'], json['cognome'], json['name'], 'lalalala'));
  }

  
  @override
  Future<int> notifica() async {
    var url = "${Settings.url}notification/";

    final url2 = Uri.parse(url);
    final response = await http.get(url2);
    var json = jsonDecode(response.body);

    return json['notification_count'];
  }

  @override
  Future<bool> chiudiTavoloDB(Tavolo tavolo) async{
    var url = "${Settings.url}order/";
    final url2 = Uri.parse(url);
  final response = await http.put(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode({
          "tableNumber": tavolo.nome
       })
  );
   if(response.body == "\"Updated successfully\""){
      return true;
    }else{
      return false;
    }
  }

  @override
  Future<bool> apriTavoloDB(Tavolo tavolo) async {
    var url = "${Settings.url}order/";
    final url2 = Uri.parse(url);
  final response = await http.post(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode({
          "tableNumber": tavolo.nome
       })
  );
   if(response.body == "\"Added successfully\""){
      return true;
    }else{
      return false;
    }
  
  }

  @override
  Future<List<PiattiScontrino>> takePiattiPresi(Tavolo tavolo) async {
    List<PiattiScontrino> lista = [];
    var url = "${Settings.url}getorder/";
    final url2 = Uri.parse(url);
  final response = await http.post(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode({
          "tableNumber": tavolo.nome
       })
  );
  final json = jsonDecode(response.body);
    for(var piatti in json['dishes']){
      lista.add(PiattiScontrino(nome: piatti['dish']['name'], quantita: piatti['count'], prezzoPerUnita: piatti['dish']['cost']));
    }
    
    return lista;
  }
}
