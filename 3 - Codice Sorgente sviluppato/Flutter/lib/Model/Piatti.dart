import 'package:prova1/Model/Allergeni.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:flutter/material.dart';

class Piatti {
  String nome;
  String prezzo;
  String tipologia;
  String descrizione;
  String allergeni;
  String codice1 = "0";
  List<Ingrediente> ingredienti;

  Piatti(this.nome, this.prezzo, this.tipologia, this.descrizione,
      this.allergeni, this.ingredienti);

  String get id => codice1;    

  set setid(String codice) {
     codice1 = codice;
   } 
}
