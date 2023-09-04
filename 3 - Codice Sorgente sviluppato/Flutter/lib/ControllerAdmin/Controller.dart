import 'package:prova1/Model/Admin.dart';
import 'package:prova1/Model/Allergeni.dart';
import 'package:prova1/Model/Cucina.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Connection/AdminConnessioneDB.dart';
import 'package:prova1/Model/Messaggio.dart';
import 'package:flutter/material.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/Model/Sala.dart';
import 'package:prova1/Model/Supervisore.dart';
import 'dart:math'; //ricorda di levarlo poi

class Controller {
  AdminConnessioneDB connessioneDB = AdminConnessioneDB();

  Admin takeAdminInfoDB() {
    return connessioneDB.takeAdminInfoDB();
  }

  CreaAccountDB() {}

  List<Ingrediente> TakeDispensa() {
    return connessioneDB.TakeDispensaDB();
  }

  List<Messaggio> TakeMessages() {
    return connessioneDB.TakeMessagesDB();
  }

  List<List<Piatti>> takeAllPiatti() {
    return connessioneDB.takeAllPiattiDB();
  }

  void DeletePiatti(List<Piatti> selectedPiatti) {
    connessioneDB.DeletePiattiDB(selectedPiatti);
  }

  List<Allergeni> takeAllergeni() {
    return connessioneDB.takeAllergeniDB();
  }

  List<Ingrediente> takeIngredienti() {
    return connessioneDB.TakeIngredientiDB();
  }

  bool SavePiatto(Piatti piatti) {
    if (piatti.nome.isEmpty ||
        piatti.codice.isEmpty ||
        piatti.descrizione.isEmpty ||
        piatti.ingredienti.isEmpty ||
        piatti.allergeni.isEmpty) {
      return false;
    }
    return connessioneDB.SavePiattoDB(piatti);
  }

  void addEmployee(
      String accountType, Iterable<String?> values, BuildContext context) {
    /*switch (accountType) {
      case 'Cucina':
        Cucina(values.elementAt(0).toString(), values.elementAt(1).toString(),
            values.elementAt(2).toString(), values.elementAt(3).toString());
        break;
      case 'Supervisore':
        Supervisore(
            values.elementAt(0).toString(),
            values.elementAt(1).toString(),
            values.elementAt(2).toString(),
            values.elementAt(3).toString());
        break;
      case 'Sala':
        Sala(values.elementAt(0).toString(), values.elementAt(1).toString(),
            values.elementAt(2).toString(), values.elementAt(3).toString());
        break;
      default:*/
    if (accountType == null) {
      SnackBar snackBar =
          const SnackBar(content: Text('Inserisci tutti i campi'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (connessioneDB.addEmployee(accountType, values) == true) {
      SnackBar snackBar =
          const SnackBar(content: Text('Aggiunto correttamente'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      SnackBar snackBar = const SnackBar(
          content: Text('Errore di comunicazione con il Database'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void setToZeroNotifications() {
    connessioneDB.setToZeroNotifications();
  }

  Map<DateTime, double> getIncassoGiornaliero(
      DateTime startDate, DateTime endDate) {
    return connessioneDB.getIncassoGiornalieroDB(startDate, endDate);
  }

  //calcolare facendo la media
  double getIncassoMedio(Map<DateTime, double> incassoGiornalieroStatistiche) {
    double sum = 0.0;
    incassoGiornalieroStatistiche.forEach((key, value) {
      sum += value;
    });
    return sum / incassoGiornalieroStatistiche.length;
  }

  //prendere i conti e tornare il valore della media
  double getValoreMedioConto(DateTime startDate, DateTime endDate) {
    return Random().nextDouble() * 200;
  }

  //calcolare la somma degli incassi
  double getIncassoComplessivo(
      Map<DateTime, double> incassoGiornalieroStatistiche) {
    double sum = 0.0;
    incassoGiornalieroStatistiche.forEach((key, value) {
      sum += value;
    });
    return sum;
  }

  int checkUser(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      return 0;
    }
    return 1;
  }

  bool UpdatePiatto(Piatti piatti) {
    return connessioneDB.UpdatePiattoDB(piatti);
  }
}
