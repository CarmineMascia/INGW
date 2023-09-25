class Ingrediente {
  String nome;
  String codice;
  String quantita;
  DateTime scadenza;
  String descrizione;
  String sogliaMinima = "0";

  Ingrediente(this.nome, this.codice, this.quantita, this.scadenza,
      this.descrizione, this.sogliaMinima);

  Ingrediente.noSogliaMinima(
    this.nome,
    this.codice,
    this.quantita,
    this.scadenza,
    this.descrizione,
  );
}
