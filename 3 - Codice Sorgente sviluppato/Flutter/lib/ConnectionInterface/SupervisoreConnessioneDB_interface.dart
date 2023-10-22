
import 'package:prova1/Model/PiattiScontrino.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'package:prova1/Model/Tavolo.dart';

abstract class SupervisoreConnessioneDB_interface {
  Future<Supervisore> takeSupervisoreInfoDB(String supervisore);
  Future<int> notifica();
  Future<bool> chiudiTavoloDB(Tavolo tavolo);
  Future<bool> apriTavoloDB(Tavolo tavolo);
  Future<List<PiattiScontrino>> takePiattiPresi(Tavolo tavolo);
}
