class Ingrediente {
  String nome;
  String codice = "";
  String costo;
  String quantita;
  DateTime scadenza;
  String descrizione;
  String sogliaMinima = "0";

  Ingrediente(this.nome, this.codice, this.quantita, this.scadenza,
      this.descrizione, this.sogliaMinima, this.costo);

  Ingrediente.noSogliaMinimaECodice(
    this.nome,
    this.costo,
    this.quantita,
    this.scadenza,
    this.descrizione,
  );
}
