import 'package:prova1/Model/PiattiScontrino.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/Model/Tavolo.dart';

class SupervisoreConnessioneDB {
  Supervisore takeSupervisoreInfoDB() {
    return Supervisore('Carmine', 'Mascia', 'mascia.c02@gmail.com', 'lalalala');
  }

  int notifica() {
    return 3;
  }

  bool chiudiTavoloDB(Tavolo tavolo) {
    return true;
  }

  bool apriTavoloDB(Tavolo tavolo) {
    return true;
  }

  List<PiattiScontrino> takePiattiPresi(Tavolo tavolo) {
    return [
      PiattiScontrino(
          nome: 'Spaghetti al pomodoro', quantita: 3, prezzoPerUnita: 15.0),
      PiattiScontrino(
          nome: 'Spaghetti al pesto', quantita: 3, prezzoPerUnita: 10.0),
      PiattiScontrino(nome: 'Carbonara', quantita: 1, prezzoPerUnita: 15.0),
    ];
  }
}
