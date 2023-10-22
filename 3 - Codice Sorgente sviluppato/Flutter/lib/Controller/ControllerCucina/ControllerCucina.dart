import 'package:prova1/Connection/CucinaConnessioneDB.dart';
import 'package:prova1/Model/Cucina.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Piatti.dart';

class ControllerCucina {
  CucinaConnessioneDB cucinaConnessioneDB = CucinaConnessioneDB();

  Future<Cucina> takeInfo(Cucina cucina) {
    return cucinaConnessioneDB.takeInfoDB(cucina);
  }

  bool UpdateIngredienti(Piatti piatto) {
    return cucinaConnessioneDB.UpdateIngredientiDB(piatto);
  }
}
