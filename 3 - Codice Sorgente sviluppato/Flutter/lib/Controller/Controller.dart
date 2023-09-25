import 'package:prova1/Connection/ClientsConnessioneDB.dart';
import 'package:prova1/Model/Allergeni.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Messaggio.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/Model/Tavolo.dart';

class Controller {
  ClientsConnessioneDB clientsConnessioneDB = ClientsConnessioneDB();

  int checkUser(String email, String password) {
    return clientsConnessioneDB.checkUserDB(email, password);
  }

  List<List<Piatti>> takeAllPiatti() {
    return clientsConnessioneDB.takeAllPiattiDB();
  }

  List<Ingrediente> takeIngredienti() {
    return clientsConnessioneDB.TakeIngredientiDB();
  }

  List<Allergeni> takeAllergeni() {
    return clientsConnessioneDB.takeAllergeniDB();
  }

  List<Ingrediente> TakeDispensa() {
    return clientsConnessioneDB.TakeDispensaDB();
  }

  List<Messaggio> TakeMessages() {
    return clientsConnessioneDB.TakeMessagesDB();
  }

  bool UpdatePiatto(Piatti piatti) {
    if (piatti.nome.isEmpty ||
        piatti.tipologia.isEmpty ||
        piatti.descrizione.isEmpty ||
        piatti.ingredienti.isEmpty ||
        piatti.allergeni.isEmpty) {
      return false;
    } else {
      return clientsConnessioneDB.UpdatePiattoDB(piatti);
    }
  }

  bool SavePiatto(Piatti piatti) {
    if (piatti.nome.isEmpty ||
        piatti.tipologia.isEmpty ||
        piatti.descrizione.isEmpty ||
        piatti.ingredienti.isEmpty ||
        piatti.allergeni.isEmpty) {
      return false;
    } else {
      return clientsConnessioneDB.SavePiattoDB(piatti);
    }
  }

  bool AggiungiIngrediente(Ingrediente ingrediente) {
    if (ingrediente.nome.isEmpty ||
        ingrediente.descrizione.isEmpty ||
        ingrediente.codice.isEmpty ||
        ingrediente.quantita.isEmpty) {
      return false;
    }
    return clientsConnessioneDB.AggiungiIngredienteDB(ingrediente);
  }

  bool UpdateIngrediente(Ingrediente ingrediente) {
    if (ingrediente.nome.isEmpty ||
        ingrediente.descrizione.isEmpty ||
        ingrediente.codice.isEmpty ||
        ingrediente.quantita.isEmpty) {
      return false;
    }
    return clientsConnessioneDB.UpdateIngredienteDB(ingrediente);
  }

  List<Tavolo> TakeTavoli() {
    return clientsConnessioneDB.TakeTavoli();
  }

  bool checkFirstTime() {
    return clientsConnessioneDB.checkFirstTime();
  }

  bool setNewPassword(String text) {
    return false;
  }

  bool setSogliaMinima(Ingrediente ingrediente, String sogliaMinima) {
    return clientsConnessioneDB.setSogliaMinima(ingrediente, sogliaMinima);
  }
}
