import 'package:prova1/Connection/SupervisoreConnessioneDB.dart';
import 'package:prova1/Model/PiattiScontrino.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/Model/Tavolo.dart';
import 'package:prova1/Model/Piatti.dart';

class ControllerSupervisore {
  SupervisoreConnessioneDB supervisoreConnessioneDB =
      SupervisoreConnessioneDB();

  Future<Supervisore> takeSupervisoreInfoDB(String supervisore) {
    return supervisoreConnessioneDB.takeSupervisoreInfoDB(supervisore);
  }

  Future<bool> chiudiTavolo(Tavolo tavolo) {
    return supervisoreConnessioneDB.chiudiTavoloDB(tavolo);
  }

  Future<bool> apriTavolo(Tavolo tavolo) {
    return supervisoreConnessioneDB.apriTavoloDB(tavolo);
  }

  Future<List<PiattiScontrino>> takePiattiPresi(Tavolo tavolo) {
    return supervisoreConnessioneDB.takePiattiPresi(tavolo);
  }
}
