import 'package:prova1/Model/Cucina.dart';
import 'package:prova1/Model/Piatti.dart';

class CucinaConnessioneDB {
  bool UpdateIngredientiDB(Piatti piatto) {
    return true;
  }

  Cucina takeInfoDB(Cucina cucina) {
    return Cucina("Paolo", "Fox", "paolofox@gmail.com", "seiperseitrentasei");
  }
}
