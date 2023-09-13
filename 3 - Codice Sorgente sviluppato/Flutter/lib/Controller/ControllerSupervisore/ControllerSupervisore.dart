import 'package:prova1/Connection/SupervisoreConnessioneDB.dart';
import 'package:prova1/Model/PiattiScontrino.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/Model/Tavolo.dart';

class ControllerSupervisore {
  SupervisoreConnessioneDB supervisoreConnessioneDB =
      SupervisoreConnessioneDB();

  Supervisore takeSupervisoreInfoDB() {
    return supervisoreConnessioneDB.takeSupervisoreInfoDB();
  }

  bool chiudiTavolo(Tavolo tavolo) {
    return supervisoreConnessioneDB.chiudiTavoloDB(tavolo);
  }

  bool apriTavolo(Tavolo tavolo) {
    return supervisoreConnessioneDB.apriTavoloDB(tavolo);
  }

  List<PiattiScontrino> takePiattiPresi(Tavolo tavolo) {
    return supervisoreConnessioneDB.takePiattiPresi(tavolo);
  }
}
