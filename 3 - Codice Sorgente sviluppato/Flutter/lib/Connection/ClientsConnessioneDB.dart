import 'package:prova1/Model/Allergeni.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Messaggio.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/Model/Tavolo.dart';

class ClientsConnessioneDB {
  List<List<Piatti>> takeAllPiattiDB() {
    return [
      [
        Piatti(
            'Spaghetti allo scoglio',
            '15',
            'Primo',
            'BUONO E GUSTOSO, UN PIATTO SEMPLICE CHE CONQUISTA TUTTI',
            'palla', [
          Ingrediente('Mozzarella', '00003', '5.0', DateTime(2024, 8, 3),
              'Buono e gustoso gnam', '15.0')
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
    ];
  }

  List<Ingrediente> TakeIngredientiDB() {
    return [
      Ingrediente(
          'Prosciutto cotto',
          '00001',
          '5.0',
          DateTime(2025, 8, 3),
          'Buono e gustoso gnamckospsniprkvpsmimo opf pwmorospvmsopigjsnvkpkm  mgpgwmdlskmgkewgpigkwrinpkwdfkmefowpgiwngkn gqpwfmkrdmslòfmsdkrnionkgsmkfmpsdksvmriongksi eipwkfmodlskmnkgirgnwbojcndlckamofpefèapvnddbu jngnjrspgkgjnsfnhgjpoae o pfiejaipfmkdkgnikdagpiengrujnjgaipefmoqdòklcvsnvriogn gefofeopa    ofejoppafpjoeaojpfopjafpjofefejofjojopfeapfaejoeevovuaaaaaaaaaaaaaaaa iojfeaeeeeeeeeeeeeeeeeeeeeeeeee paofnaudoavijoguhvjaeifaojncauofjaeionaceiaougnjcaidjpakwopdicmksljvdurjiapeugiacoqehaocjvnhryiu fuehajpsoiojiydfuoiefoneiduiosdjhayfuoinjhyudhifuiodjnhiyuofiajehhu ifaiuipodknjufiadjknjabgduivnk juivajdnjuivjdiuaejtudfj',
          '1.0'),
      Ingrediente('Prosciutto crudo', '00002', '5.0', DateTime(2026, 8, 3),
          'Buono e gustoso gnam', '3.0'),
      Ingrediente('Mozzarella', '00003', '5.0', DateTime(2024, 8, 3),
          'Buono e gustoso gnam', '2.0'),
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
          '1.0'),
      Ingrediente('Prosciutto crudo', '00002', '5.0', DateTime(2026, 8, 3),
          'Buono e gustoso gnam', '3.0'),
      Ingrediente('Mozzarella', '00003', '5.0', DateTime(2024, 8, 3),
          'Buono e gustoso gnam', '2.0'),
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
}
