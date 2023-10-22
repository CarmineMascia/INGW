import 'dart:ffi';
import 'dart:math';
import 'dart:convert';

import 'package:prova1/Model/Admin.dart';
import 'package:prova1/Model/Allergeni.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Messaggio.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:http/http.dart' as http;
import 'package:prova1/Connection/Settings.dart';
import 'package:prova1/ConnectionInterface/AdminConnessioneDB_interface.dart';

class AdminConnessioneDB implements AdminConnessioneDB_interface{
  //ci va il metodo che ci dice quante notifiche ci sono
  @override
  Future<int> notifica() async {
    var url = "${Settings.url}notification/";

    final url2 = Uri.parse(url);
    final response = await http.get(url2);
    var json = jsonDecode(response.body);

    return json['notification_count'];
  }

  @override
  int recv(int num) {
    return 1;
  }

  @override
  Future<Admin> takeAdminInfoDB(String email) async {

    var url = "${Settings.url}userget/";

    final url2 = Uri.parse(url);
  final response = await http.post(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode({
          'name': email, 
       })
  );
  var json = jsonDecode(response.body);
    return (Admin(json['nome'], json['cognome'], json['name'], 'lalalala'));
  }

  @override
  Future<List<Messaggio>> TakeMessagesDB() async {
    var url = "${Settings.url}notification/";

    final url2 = Uri.parse(url);
    final response = await http.get(url2);
    var json = jsonDecode(response.body);

    return [Messaggio(json['notifications']['message'], json['notifications']['date'])];
  }

  @override
  void DeletePiattiDB(List<Piatti> selectedPiatti) {
    //elimina i piatti dal DB
  }

  @override
  Future<bool> addEmployee(String accountType, Iterable<String?> values) async {
    var url = "${Settings.url}user/";

    final url2 = Uri.parse(url);
    final response = await http.post(url2,headers: {"Content-Type": "application/json"},
       body: jsonEncode({
        "name": "${values.elementAt(2)}",
        "password": "${values.elementAt(3)}",
        "role": accountType.toLowerCase(),
        "nome": "${values.elementAt(0)}",
        "cognome": "${values.elementAt(1)}"
    }
));
    if(response.body == "\"Added successfully\""){
      return true;
    }else{
      return false;
    }
  }

  @override
  void setToZeroNotifications() {}

  @override
  Future<Map<DateTime, double>> getIncassoGiornalieroDB(
      DateTime startDate, DateTime endDate) async {
        var url = "${Settings.url}statistics/";

    final url2 = Uri.parse(url);
    final response = await http.post(url2,headers: {"Content-Type": "application/json"},
       body: jsonEncode({
    "start":"${startDate.year}-${startDate.month}-${startDate.day}",
    "end":"${endDate.year}-${endDate.month}-${endDate.day}"
}
));
    var json = jsonDecode(response.body)['guadagno giornaliero'];
    Map<DateTime, double> mappa = {};
    for (var element in json) {
      mappa[DateTime.parse(element['data'])] = element['guadagno'];
    }

    return mappa;
  }

  bool salvaNuovoOrdineDelMenuDB(List<Piatti> piatti) {
    return true;
  }

  @override
  Future<double> getValoreMedioContoDB(DateTime startDate, DateTime endDate) async {
    var url = "${Settings.url}statistics/";

    final url2 = Uri.parse(url);
    final response = await http.post(url2,headers: {"Content-Type": "application/json"},
       body: jsonEncode({
    "start":"${startDate.year}-${startDate.month}-${startDate.day}",
    "end":"${endDate.year}-${endDate.month}-${endDate.day}"
}
));
return jsonDecode(response.body)['Expected value of receipt'];
  }
}
