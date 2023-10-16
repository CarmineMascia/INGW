import 'package:prova1/Model/Allergeni.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Messaggio.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/Model/Tavolo.dart';

class ClientsConnessioneDB {
  Map<String, List<Piatti>> takeAllPiattiETipologieDB() {
    return {
      'Primi': [
        Piatti(
            'Spaghetti allo scoglio',
            '15',
            'Primi',
            'BUONO E GUSTOSO, UN PIATTO SEMPLICE CHE CONQUISTA TUTTI',
            'palla', [
          Ingrediente('Mozzarella', '00003', '5.0', DateTime(2024, 8, 3),
              'Buono e gustoso gnam', '15.0', '10')
        ]),
        Piatti(
            'Spaghetti alla amatriciana',
            '15',
            'Primi',
            'BUONO E GUSTOSO, UN PIATTO SEMPLICE CHE CONQUISTA TUTTI',
            'palla', [
          Ingrediente('Mozzarella', '00003', '5.0', DateTime(2024, 8, 3),
              'Buono e gustoso gnam', '15.0', '10')
        ]),
      ],
      'Secondi': [
        Piatti('Salsiccia', '10', 'Secondi', 'descrizione', '', [
          Ingrediente('Mozzarella', '00003', '5.0', DateTime(2024, 8, 3),
              'Buono e gustoso gnam', '15.0', '10')
        ]),
        Piatti('Pollo', '10', 'Secondi', 'descrizione', '', [
          Ingrediente('Mozzarella', '00003', '5.0', DateTime(2024, 8, 3),
              'Buono e gustoso gnam', '15.0', '10')
        ]),
      ],
      'Contorni': [
        Piatti('Friarielli', '5', 'Contorni', 'descrizione', '', [
          Ingrediente('Mozzarella', '00003', '5.0', DateTime(2024, 8, 3),
              'Buono e gustoso gnam', '15.0', '10')
        ]),
      ],
      'Dolci': [
        Piatti('Tiramisu', '10', 'Dolci', 'suicidio', 'lala', [
          Ingrediente('Mozzarella', '00003', '5.0', DateTime(2024, 8, 3),
              'Buono e gustoso gnam', '15.0', '10')
        ]),
      ],
      'Bibite': [
        Piatti('Acqua', '2', 'Bibite', 'lalla', '', [
          Ingrediente('Mozzarella', '00003', '5.0', DateTime(2024, 8, 3),
              'Buono e gustoso gnam', '15.0', '10')
        ]),
      ],
    };
    /* [
        Piatti(
            'Spaghetti allo scoglio',
            '15',
            'Primo',
            'BUONO E GUSTOSO, UN PIATTO SEMPLICE CHE CONQUISTA TUTTI',
            'palla', [
          Ingrediente('Mozzarella', '00003', '5.0', DateTime(2024, 8, 3),
              'Buono e gustoso gnam', '15.0', '10')
        ]),
        Piatti('Spaghetti alla amatriciana', '15', '', '', 'glutine', []),
        Piatti('Spaghetti alla carbonara', '15', '', '', 'lala', []),
        Piatti('Spaghetti aglio ed olio', '15', '', '', 'lololo', []),
        Piatti('Spaghetti al pomodoro', '15', '', '', 'mammami', []),
        Piatti('Spaghetti al pesto', '15', '', '', 'si', []),
        Piatti('Spaghetti alle vongole', '15', '', '', 'no', []),
        Piatti('Spaghetti alle cozze', '15', '', '', 'forse', []),
        Piatti('Spaghetti al pomodorino', '15', '', '', 'lalaa', []),
        Piatti('Spaghetti al burro', '15', '', '', 'totot', []),
      ],
      [
        Piatti('Spaghetti allo scoglio', '15', '', '', 'pqpq', []),
        Piatti('Spaghetti alla amatriciana', '15', '', '', 'peefe', []),
        Piatti('Spaghetti alla carbonara', '15', '', '', 'f', []),
      ],
      [
        Piatti('Spaghetti allo scoglio', '15', '', '', 'pqpq', []),
        Piatti('Spaghetti alla amatriciana', '15', '', '', 'peefe', []),
        Piatti('Spaghetti alla carbonara', '15', '', '', 'f', []),
      ],
      [
        Piatti('Spaghetti allo scoglio', '15', '', '', 'pqpq', []),
        Piatti('Spaghetti alla amatriciana', '15', '', '', 'peefe', []),
        Piatti('Spaghetti alla carbonara', '15', '', '', 'f', []),
      ],
      [
        Piatti('Spaghetti allo scoglio', '15', '', '', 'pqpq', []),
        Piatti('Spaghetti alla amatriciana', '15', '', '', 'peefe', []),
        Piatti('Spaghetti alla carbonara', '15', '', '', 'f', []),
      ]
    ];*/
  }

  List<Ingrediente> TakeIngredientiDB() {
    return [
      Ingrediente(
          'Prosciutto cotto',
          '00001',
          '5.0',
          DateTime(2025, 8, 3),
          'Buono e gustoso gnamckospsniprkvpsmimo opf pwmorospvmsopigjsnvkpkm  mgpgwmdlskmgkewgpigkwrinpkwdfkmefowpgiwngkn gqpwfmkrdmslòfmsdkrnionkgsmkfmpsdksvmriongksi eipwkfmodlskmnkgirgnwbojcndlckamofpefèapvnddbu jngnjrspgkgjnsfnhgjpoae o pfiejaipfmkdkgnikdagpiengrujnjgaipefmoqdòklcvsnvriogn gefofeopa    ofejoppafpjoeaojpfopjafpjofefejofjojopfeapfaejoeevovuaaaaaaaaaaaaaaaa iojfeaeeeeeeeeeeeeeeeeeeeeeeeee paofnaudoavijoguhvjaeifaojncauofjaeionaceiaougnjcaidjpakwopdicmksljvdurjiapeugiacoqehaocjvnhryiu fuehajpsoiojiydfuoiefoneiduiosdjhayfuoinjhyudhifuiodjnhiyuofiajehhu ifaiuipodknjufiadjknjabgduivnk juivajdnjuivjdiuaejtudfj',
          '1.0',
          '10'),
      Ingrediente('Prosciutto crudo', '00002', '5.0', DateTime(2026, 8, 3),
          'Buono e gustoso gnam', '3.0', '15'),
      Ingrediente('Mozzarella', '00003', '5.0', DateTime(2024, 8, 3),
          'Buono e gustoso gnam', '2.0', '15'),
    ];
  }

  List<Allergeni> takeAllergeniDB() {
    return [
      Allergeni('nichel'),
      Allergeni('glutine'),
      Allergeni('lattosio'),
      Allergeni('galattosio'),
      Allergeni('tonno'),
      Allergeni('pomodoro'),
    ];
  }

  List<Ingrediente> TakeDispensaDB() {
    return [
      Ingrediente(
          'Prosciutto cotto',
          '00001',
          '5.0',
          DateTime(2025, 8, 3),
          'Buono e gustoso gnamckospsniprkvpsmimo opf pwmorospvmsopigjsnvkpkm  mgpgwmdlskmgkewgpigkwrinpkwdfkmefowpgiwngkn gqpwfmkrdmslòfmsdkrnionkgsmkfmpsdksvmriongksi eipwkfmodlskmnkgirgnwbojcndlckamofpefèapvnddbu jngnjrspgkgjnsfnhgjpoae o pfiejaipfmkdkgnikdagpiengrujnjgaipefmoqdòklcvsnvriogn gefofeopa    ofejoppafpjoeaojpfopjafpjofefejofjojopfeapfaejoeevovuaaaaaaaaaaaaaaaa iojfeaeeeeeeeeeeeeeeeeeeeeeeeee paofnaudoavijoguhvjaeifaojncauofjaeionaceiaougnjcaidjpakwopdicmksljvdurjiapeugiacoqehaocjvnhryiu fuehajpsoiojiydfuoiefoneiduiosdjhayfuoinjhyudhifuiodjnhiyuofiajehhu ifaiuipodknjufiadjknjabgduivnk juivajdnjuivjdiuaejtudfj',
          '1.0',
          '15'),
      Ingrediente('Prosciutto crudo', '00002', '5.0', DateTime(2026, 8, 3),
          'Buono e gustoso gnam', '3.0', '15'),
      Ingrediente('Mozzarella', '00003', '5.0', DateTime(2024, 8, 3),
          'Buono e gustoso gnam', '2.0', '10'),
    ];
  }

  List<Messaggio> TakeMessagesDB() {
    return [
      Messaggio('La mozzarella sta per terminare', DateTime(2023, 8, 6)),
      Messaggio('La salsa sta per terminare', DateTime(2023, 8, 7)),
      Messaggio('La pizza sta per terminare', DateTime(2023, 8, 6)),
      Messaggio('Il prosciutto sta per terminare', DateTime(2023, 8, 8)),
    ];
  }

  bool UpdatePiattoDB(Piatti piatti) {
    return true;
  }

  bool SavePiattoDB(Piatti piatti) {
    print("Messaggio: OK");
    return true;
  }

  List<Tavolo> TakeTavoli() {
    return [
      Tavolo('1', true),
      Tavolo('2', true),
      Tavolo('3', false),
      Tavolo('4', true),
      Tavolo('5', false),
      Tavolo('6', true),
    ];
  }

  int checkUserDB(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      return 0;
    }
    return 1;
  }

  bool AggiungiIngredienteDB(Ingrediente ingrediente) {
    return true;
  }

  bool UpdateIngredienteDB(Ingrediente ingrediente) {
    return true;
  }

  bool checkFirstTime() {
    return false;
  }

  bool setSogliaMinima(Ingrediente ingrediente, String sogliaMinima) {
    return true;
  }

  bool inserisciCategoria(String text) {
    return true;
  }

  bool eliminaCategoria(String categoria) {
    return true;
  }

  void DeletePiattiDB(List<Piatti> selectedPiatti) {}

  bool salvaNuovoOrdineDelMenuDB(List<Piatti> piatti) {
    return true;
  }
}
