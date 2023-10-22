import 'dart:convert';

import 'package:prova1/Model/Allergeni.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Messaggio.dart';
import 'package:prova1/Model/Ordine.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/Model/PiattiScontrino.dart';
import 'package:prova1/Model/Tavolo.dart';
import 'package:http/http.dart' as http;
import 'package:prova1/Connection/Settings.dart';
import 'package:prova1/ConnectionInterface/ClientsConnessioneDB_interface.dart';

class ClientsConnessioneDB implements ClientsConnessioneDB_interface {

  @override
  Future<List<List<Piatti>>> takeAllPiattiDB() async{
    var url = "${Settings.url}dish/";

    final url2 = Uri.parse(url);
    final response = await http.get(url2);
    var json = jsonDecode(response.body);
    List<Piatti> primi = [];
    List<Piatti> secondi = [];
    List<Piatti> contorni = [];
    List<Piatti> dolci = [];
    List<Piatti> bevande = [];
    for(var json2 in json){

      switch (json2['dish']['category']){
          case 1:
                List<Ingrediente> list = [];
                for(var ingredient in json2['ingredients']){
                    list.add(Ingrediente(ingredient['name'],ingredient['id'].toString(), ingredient['quantity'].toString(), DateTime.parse(ingredient['scadenza']), ingredient['description'], ingredient['minThreshold'].toString(),ingredient['cost'].toString()));
                }
              
                primi.add(Piatti(json2['dish']['name'], json2['dish']['cost'].toString(), "Primo", json2['dish']['description'], 'test', list));
                break;
          case 2:
                List<Ingrediente> list = [];
                for(var ingredient in json2['ingredients']){
                    list.add(Ingrediente(ingredient['name'],ingredient['id'].toString(), ingredient['quantity'].toString(), DateTime.parse(ingredient['scadenza']), ingredient['description'], ingredient['minThreshold'].toString(),ingredient['cost'].toString()));
                }
                secondi.add(Piatti(json2['dish']['name'], json2['dish']['cost'].toString(), "Secondo", json2['dish']['description'], 'test', list));
                break;
          case 3:
                List<Ingrediente> list = [];
                for(var ingredient in json2['ingredients']){
                    list.add(Ingrediente(ingredient['name'],ingredient['id'].toString(), ingredient['quantity'].toString(), DateTime.parse(ingredient['scadenza']), ingredient['description'], ingredient['minThreshold'].toString(),ingredient['cost'].toString()));
                }
                contorni.add(Piatti(json2['dish']['name'], json2['dish']['cost'].toString(), "Contorno", json2['dish']['description'], 'test', list));
                break;
          case 4:
                List<Ingrediente> list = [];
                for(var ingredient in json2['ingredients']){
                    list.add(Ingrediente(ingredient['name'],ingredient['id'].toString(), ingredient['quantity'].toString(), DateTime.parse(ingredient['scadenza']), ingredient['description'], ingredient['minThreshold'].toString(),ingredient['cost'].toString()));
                }
                dolci.add(Piatti(json2['dish']['name'], json2['dish']['cost'].toString(), "Dolce", json2['dish']['description'], 'test', list));
                break;
          case 5:
                List<Ingrediente> list = [];
                for(var ingredient in json2['ingredients']){
                    list.add(Ingrediente(ingredient['name'],ingredient['id'].toString(), ingredient['quantity'].toString(), DateTime.parse(ingredient['scadenza']), ingredient['description'], ingredient['minThreshold'].toString(),ingredient['cost'].toString()));
                }
                bevande.add(Piatti(json2['dish']['name'], json2['dish']['cost'].toString(), "Bevanda", json2['dish']['description'], 'test', list));
                break;
      }
      
    }
    return [primi,secondi,contorni,dolci,bevande];
  }

  @override
  Future<List<Ingrediente>> TakeIngredientiDB() async {
    var url = "${Settings.url}ingredients/";

    final url2 = Uri.parse(url);
    final response = await http.get(url2);
    var json = jsonDecode(response.body);
    List<Ingrediente> list = [];
    for(var message in json){
        list.add(Ingrediente(message['name'], message['id'].toString(), message['quantity'].toString(), DateTime.parse(message['scadenza']), message['description'], message['minThreshold'].toString(),message['cost'].toString()));
    }
    return list;
  }

  @override
  List<Allergeni> takeAllergeniDB() {
    return [
      Allergeni('nichel'),
      Allergeni('glutine'),
      Allergeni('lattosio'),
      Allergeni('galattosio'),
      Allergeni('tonno'),
      Allergeni('pomodoro'),
    ];
  }

  @override
  Future<Map<String, List<Piatti>>> takeAllPiattiETipologieDB() async {
    Map<String, List<Piatti>> map = {};
    Map<String, String> map2 = {};
    var url = "${Settings.url}categories/";

    final url2 = Uri.parse(url);
    final response = await http.get(url2);
    var json = jsonDecode(response.body);
    for(var categories in json){
      map[categories['name']] = [];
      map2[categories['id'].toString()] = categories['name'];
    }
    var url3 = "${Settings.url}dish/";
    final url4 = Uri.parse(url3);
    final response2 = await http.get(url4);
    var json2 = jsonDecode(response2.body);
    for(var test in json2){
      List<Ingrediente> list = [];
                for(var ingredient in test['ingredients']){
                    list.add(Ingrediente(ingredient['name'],ingredient['id'].toString(), ingredient['quantity'].toString(), DateTime.parse(ingredient['scadenza']), ingredient['description'], ingredient['minThreshold'].toString(),ingredient['cost'].toString()));
                }
      Piatti piatto = Piatti(test['dish']['name'], test['dish']['cost'].toString(), map2[test['dish']['category'].toString()]!, test['dish']['description'], test['dish']['allergens'], list);
      piatto.setid = test['dish']['id'].toString();
      map[map2[(test['dish']['category']).toString()]]?.add(piatto);
    }
    return map;
  }

  @override
  Future<List<Ingrediente>> TakeDispensaDB() async {
    var url = "${Settings.url}ingredients/";

    final url2 = Uri.parse(url);
    final response = await http.get(url2);
    var json = jsonDecode(response.body);
    List<Ingrediente> list = [];
    for(var message in json){
        list.add(Ingrediente(message['name'], message['id'].toString(), message['quantity'].toString(), DateTime.parse(message['scadenza']), message['description'], message['minThreshold'].toString(),message['cost'].toString()));
    }
    return list;
  }

  @override
  Future<List<Messaggio>> TakeMessagesDB() async {
    var url = "${Settings.url}notification/";

    final url2 = Uri.parse(url);
    final response = await http.get(url2);
    var json = jsonDecode(response.body);
    var messages = json['notifications'];
    List<Messaggio> list = [];
    for(var message in messages){
        list.add(Messaggio(message['message'],  DateTime.parse(message['date'])));
    }
    return list;
  }

  @override
  Future<bool> UpdatePiattoDB(Piatti piatti) async {
    Map<String, String> map2 = {};
    var url3 = "${Settings.url}categories/";
    final url4 = Uri.parse(url3);
    final response = await http.get(url4);
    var json = jsonDecode(response.body);
    for(var categories in json){
      map2[categories['name']] = categories['id'].toString();
    }
    var url = "${Settings.url}dish/";
    final url2 = Uri.parse(url);
  final response2 = await http.put(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode({
      "id": piatti.id,
      "name":piatti.nome,
      "cost": piatti.prezzo,
      "description": piatti.descrizione,
      "category": map2[piatti.tipologia],
      "allergens": piatti.allergeni
  })
  );
  
  SaveIngredientiDB(piatti);
   if(response2.body == "\"Updated successfully\""){
      return true;
    }else{
      return false;
    }
  }

  @override
  Future<bool> SavePiattoDB(Piatti piatti) async {
    Map<String, String> map2 = {};
    var url3 = "${Settings.url}categories/";

    final url4 = Uri.parse(url3);
    final response = await http.get(url4);
    var json = jsonDecode(response.body);
    for(var categories in json){
      map2[categories['name']] = categories['id'].toString();
    }
    var url = "${Settings.url}dish/";
    final url2 = Uri.parse(url);
  final response2 = await http.post(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode({
      "name":piatti.nome,
      "cost": piatti.prezzo,
      "description": piatti.descrizione,
      "category": int.parse(map2[piatti.tipologia]!),
      "allergens": piatti.allergeni
  })
  );

  SaveIngredientiDB(piatti);
   if(response2.body == "\"Added successfully\""){
      return true;
    }else{
      return false;
    }
  }




@override
  Future<bool> SaveIngredientiDB(Piatti piatto) async {
  String id = await getCodice(piatto);
  var url = "${Settings.url}ingredientsInDish/";
    final url2 = Uri.parse(url);
    List stringa = [];
    for(var ingredienti in piatto.ingredienti){
        var string = {
          "dishId": id,
          "ingredientsId":ingredienti.codice.toString(),
          "quantityNeeded": ingredienti.quantita
       };
        stringa.add(string);
    }
  final response = await http.post(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode(stringa)
  );
  
   if(response.body == "\"Added successfully\""){
      return true;
      
    }else{
      return false;
      
    }

}

  @override
  Future<String> getCodice(Piatti piatti) async {
    var url = "${Settings.url}getdish/";

    final url2 = Uri.parse(url);
    final response2 = await http.post(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode({
      "name":piatti.nome
  })
  );
  var json = jsonDecode(response2.body);
    
    return json['id'].toString();
  }

  @override
  Future<List<Tavolo>> TakeTavoli() async {

    List<Tavolo> lista = [];
    var url = "${Settings.url}table/";
    final url2 = Uri.parse(url);
  final response = await http.get(url2,
    headers: {"Content-Type": "application/json"}
  
  );
  final json = jsonDecode(response.body);
    for(var tavoli in json){
      lista.add(Tavolo(tavoli['tableNumber'].toString(),tavoli['isActive']));
    }
    
    return lista;
  }


  @override
  Future<int> checkUserDB(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return 0;
    }
    var url = "${Settings.url}login/";

    final url2 = Uri.parse(url);
  final response = await http.post(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode({
          'name': email, 
           'password': password
       })
  );
  final json = jsonDecode(response.body);
  if(response.body == "\"Wrong credential\""){
      return 5;
    }else if(json['role'] == "admin"){
      return 1;
    }else if(json['role'] == "cucina"){
      return 2;
    }else if(json['role'] == "supervisore"){
      return 3;
    }else if(json['role'] == "sala"){
      return 4;
    }
    return 5;
  }

  @override
  Future<bool> AggiungiIngredienteDB(Ingrediente ingrediente) async {
    var url = "${Settings.url}ingredients/";
    final url2 = Uri.parse(url);
  final response = await http.post(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode({
          "name": ingrediente.nome,
          "description": ingrediente.descrizione,
          "quantity": double.parse(ingrediente.quantita),
          "cost": double.parse(ingrediente.costo),
          "isAllergen": "False",
          "minThreshold": ingrediente.sogliaMinima
       })
  );
   if(response.body == "\"Added successfully\""){
      return true;
    }else{
      return false;
    }
  }

  @override
  Future<bool> UpdateIngredienteDB(Ingrediente ingrediente) async {
    var url = "${Settings.url}ingredients/";
    final url2 = Uri.parse(url);
  final response = await http.put(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode({
          "id": double.parse(ingrediente.codice),
          "name": ingrediente.nome,
          "description": ingrediente.descrizione,
          "quantity": double.parse(ingrediente.quantita),
          "cost": double.parse(ingrediente.costo),
          "isAllergen": "False",
          "minThreshold": ingrediente.sogliaMinima
       })
  );
   if(response.body == "\"Updated successfully\""){
      return true;
    }else{
      return false;
    }
  }

  @override
  Future<bool> checkFirstTime(String email) async {
    var url = "${Settings.url}userget/";

    final url2 = Uri.parse(url);
  final response = await http.post(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode({
          'name': email, 
       })
  );
  return jsonDecode(response.body)['isNew'];
  }

  @override
  Future<bool> setSogliaMinima(Ingrediente ingrediente, String sogliaMinima) async {
    var url = "${Settings.url}ingredients/";
    final url2 = Uri.parse(url);
  final response = await http.put(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode({
          "id": double.parse(ingrediente.codice),
          "minThreshold": sogliaMinima
       })
  );
   if(response.body == "\"Updated successfully\""){
      return true;
    }else{
      return false;
    }
  }

  @override
  Future<bool> updatePassword(String mail,String password) async {
 var url = "${Settings.url}updatePassword/";

    final url2 = Uri.parse(url);
  final response = await http.put(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode({
          'name': mail, 
          'password': password,
          'isNew': false
       })
  );
   if(response.body == "\"Updated successfully\""){
      return true;
    }else{
      return false;
    }
  }

  @override
  Future<bool> inserisciCategoria(String text) async {
    var url = "${Settings.url}categories/";
    final url2 = Uri.parse(url);
  final response = await http.post(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode({
          "name": text,
       })
  );
   if(response.body == "\"Added successfully\""){
      return true;
    }else{
      return false;
    }
  }

  @override
  Future<bool> eliminaCategoria(String categoria) async {
    var url = "${Settings.url}categories/";
    final url2 = Uri.parse(url);
  final response = await http.delete(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode({
          "name": categoria,
       })
  );
   if(response.body == "\"Deleted sucessfully\""){
      return true;
    }else{
      return false;
    }
  }

  @override
  Future<void> DeletePiattiDB(List<Piatti> selectedPiatti) async {
    var url = "${Settings.url}dish/";
    final url2 = Uri.parse(url);
    List stringa = [];
    for(var piatti in selectedPiatti){
        var string = {
          "id": piatti.id
       };
        stringa.add(string);
    }
  final response = await http.delete(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode(stringa)
  );
  }

  Future<bool> salvaNuovoOrdineDelMenuDB(List<Piatti> piatti) async {
    var url = "${Settings.url}orderdish/";
    final url2 = Uri.parse(url);

    List stringa = [];
    int i = 0;
    for(var piatto in piatti){
        var string = {
          "id": piatto.id,
          "position": i
       };
       i = i+1;
        stringa.add(string);
    }

  final response = await http.post(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode(stringa)
  );
   if(response.body == "\"Updated successfully\""){
      return true;
    }else{
      return false;
    }
  }

  Future<Ordine> TakeOrdine(Tavolo tavolo) async {
    List<PiattiScontrino> lista = [];
    var url = "${Settings.url}getorder/";
    final url2 = Uri.parse(url);
    print(tavolo.nome);
  final response = await http.post(url2,
    headers: {"Content-Type": "application/json"},
       body: jsonEncode({
    "tableNumber": tavolo.nome
})
  );
  final json = jsonDecode(response.body);
    for(var string in json['dishes']){
      lista.add(PiattiScontrino(nome: string['dish']['name'], quantita: string['count'], prezzoPerUnita: string['dish']['cost']));
    }
    
    return Ordine(tavolo, lista,json['order']['cost']);
  }
  
}
