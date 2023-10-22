import 'package:prova1/Model/Cucina.dart';
import 'package:prova1/Model/Piatti.dart';

abstract class CucinaConnessioneDB_interface {
  bool UpdateIngredientiDB(Piatti piatto);
  Future<Cucina> takeInfoDB(Cucina cucina);
}
