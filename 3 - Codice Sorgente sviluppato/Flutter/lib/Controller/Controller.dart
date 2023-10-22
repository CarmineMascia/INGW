import 'dart:math';

import 'package:prova1/Connection/ClientsConnessioneDB.dart';
import 'package:prova1/Model/Allergeni.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Messaggio.dart';
import 'package:prova1/Model/Ordine.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/Model/Tavolo.dart';

class Controller {
  ClientsConnessioneDB clientsConnessioneDB = ClientsConnessioneDB();

  Future<int> checkUser(String email, String password) async {
    return await clientsConnessioneDB.checkUserDB(email, password);
  }


  Future<List<List<Piatti>>> takeAllPiatti() async {
    Future<List<List<Piatti>>> list2 = clientsConnessioneDB.takeAllPiattiDB();
    return list2;
  }

  Future<Map<String, List<Piatti>>> takeAllPiattiETipologie() async {
    return clientsConnessioneDB.takeAllPiattiETipologieDB();
  }

  Future<List<Ingrediente>> takeIngredienti() {
    return clientsConnessioneDB.TakeIngredientiDB();
  }

  List<Allergeni> takeAllergeni() {
    return clientsConnessioneDB.takeAllergeniDB();
  }

  Future<List<Ingrediente>> TakeDispensa() {
    return clientsConnessioneDB.TakeDispensaDB();
  }

  Future<List<Messaggio>> TakeMessages() {
    return clientsConnessioneDB.TakeMessagesDB();
  }

  Future<bool> UpdatePiatto(Piatti piatti) {
    if (piatti.nome.isEmpty ||
        piatti.tipologia.isEmpty ||
        piatti.descrizione.isEmpty ||
        piatti.ingredienti.isEmpty ||
        piatti.allergeni.isEmpty) {
      return Future.value(false);
    } else {
      return clientsConnessioneDB.UpdatePiattoDB(piatti);
    }
  }

  Future<bool> SavePiatto(Piatti piatti) {
    if (piatti.nome.isEmpty ||
        piatti.tipologia.isEmpty || piatti.prezzo.isEmpty) {
      return Future.value(false);
    } else {
      return clientsConnessioneDB.SavePiattoDB(piatti);
    }
  }

  Future<bool> AggiungiIngrediente(Ingrediente ingrediente) {
    if (ingrediente.nome.isEmpty ||
        ingrediente.descrizione.isEmpty ||
        ingrediente.quantita.isEmpty) {
      return Future.value(false);
    }
    return clientsConnessioneDB.AggiungiIngredienteDB(ingrediente);
  }

  Future<bool> UpdateIngrediente(Ingrediente ingrediente) {
    if (ingrediente.nome.isEmpty ||
        ingrediente.descrizione.isEmpty ||
        ingrediente.codice.isEmpty ||
        ingrediente.quantita.isEmpty) {
      return Future.value(false);
    }
    return clientsConnessioneDB.UpdateIngredienteDB(ingrediente);
  }

  Future<List<Tavolo>> TakeTavoli() {
    return clientsConnessioneDB.TakeTavoli();
  }

  Future<bool> checkFirstTime(String email) {
    return clientsConnessioneDB.checkFirstTime(email);
  }

  Future<bool> setNewPassword(String mail,String text) {
    return clientsConnessioneDB.updatePassword(mail,text);
  }

  Future<bool> setSogliaMinima(Ingrediente ingrediente, String sogliaMinima) {
    return clientsConnessioneDB.setSogliaMinima(ingrediente, sogliaMinima);
  }

  Future<bool> inserisciCategoria(String text) {
    return clientsConnessioneDB.inserisciCategoria(text);
  }

  Future<bool> eliminaCategoria(String categoria) {
    return clientsConnessioneDB.eliminaCategoria(categoria);
  }

  void DeletePiatti(List<Piatti> selectedPiatti) {
    clientsConnessioneDB.DeletePiattiDB(selectedPiatti);
  }

  Future<bool> salvaNuovoOrdineDelMenu(List<Piatti> piatti) {
    return clientsConnessioneDB.salvaNuovoOrdineDelMenuDB(piatti);
  }

  Future<Ordine> TakeOrdine(Tavolo tavolo) {
    return clientsConnessioneDB.TakeOrdine(tavolo);
  }
}
