import 'package:prova1/Model/PiattiScontrino.dart';
import 'package:prova1/Model/Tavolo.dart';

class Ordine {
  Tavolo tavolo;
  List<PiattiScontrino> Piatti = [];
  double costo;
  Ordine(this.tavolo, this.Piatti,this.costo);
}
