import 'package:prova1/Model/Allergeni.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Messaggio.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/Model/Tavolo.dart';

abstract class ClientsConnessioneDB_interface {
  Future<List<List<Piatti>>> takeAllPiattiDB();
  Future<List<Ingrediente>> TakeIngredientiDB();
  List<Allergeni> takeAllergeniDB();
  Future<Map<String, List<Piatti>>> takeAllPiattiETipologieDB();
  Future<List<Ingrediente>> TakeDispensaDB();
  Future<List<Messaggio>> TakeMessagesDB();
  Future<bool> UpdatePiattoDB(Piatti piatti);
  Future<bool> SavePiattoDB(Piatti piatti);
  Future<bool> SaveIngredientiDB(Piatti piatto);
  Future<String> getCodice(Piatti piatti);
  Future<List<Tavolo>> TakeTavoli();
  Future<int> checkUserDB(String email, String password);
  Future<bool> AggiungiIngredienteDB(Ingrediente ingrediente);
  Future<bool> UpdateIngredienteDB(Ingrediente ingrediente);
  Future<bool> checkFirstTime(String email);
  Future<bool> setSogliaMinima(Ingrediente ingrediente, String sogliaMinima);
  Future<bool> updatePassword(String mail, String password);
  Future<bool> inserisciCategoria(String text);
  Future<bool> eliminaCategoria(String categoria);
  Future<void> DeletePiattiDB(List<Piatti> selectedPiatti);
}