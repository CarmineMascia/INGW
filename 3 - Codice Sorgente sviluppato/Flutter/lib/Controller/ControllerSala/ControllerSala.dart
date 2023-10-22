import 'package:prova1/Connection/SalaConnessioneDB.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/Model/Tavolo.dart';

class ControllerSala {
  SalaConnessioneDB salaConnessioneDB = SalaConnessioneDB();

  Future<bool> salvaNuovoOrdineSala(Map<Piatti, String> ordine,Tavolo tavolo) {
    List<Piatti> ordineFormattato = [];
    for (var i = 0; i < ordine.length; i++) {
      int quantita = int.parse(ordine.values.elementAt(i));
      for (int j = 0; j < quantita; j++) {
        ordineFormattato.add(ordine.keys.elementAt(j));
      }
    }
    return salaConnessioneDB.salvaNuovoOrdineSala(ordineFormattato,tavolo);
  }
}
