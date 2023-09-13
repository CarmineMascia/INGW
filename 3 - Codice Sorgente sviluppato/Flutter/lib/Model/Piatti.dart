import 'package:prova1/Model/Allergeni.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:flutter/material.dart';

class Piatti {
  String nome;
  String prezzo;
  String tipologia;
  String descrizione;
  List<Allergeni> allergeni;
  List<Ingrediente> ingredienti;

  Piatti(this.nome, this.prezzo, this.tipologia, this.descrizione,
      this.allergeni, this.ingredienti);
}
