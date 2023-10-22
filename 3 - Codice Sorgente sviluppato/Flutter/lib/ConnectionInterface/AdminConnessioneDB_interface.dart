
import 'package:prova1/Model/Admin.dart';
import 'package:prova1/Model/Allergeni.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Messaggio.dart';
import 'package:prova1/Model/Piatti.dart';


abstract class AdminConnessioneDB_interface {
  Future<int> notifica();
  int recv(int num);
  Future<Admin> takeAdminInfoDB(String email);
  Future<List<Messaggio>> TakeMessagesDB();
  void DeletePiattiDB(List<Piatti> selectedPiatti);
  Future<bool> addEmployee(String accountType, Iterable<String?> values);
  void setToZeroNotifications();
  Future<Map<DateTime, double>> getIncassoGiornalieroDB(
      DateTime startDate, DateTime endDate);
  Future<double> getValoreMedioContoDB(DateTime startDate, DateTime endDate);
}