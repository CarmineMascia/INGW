import 'package:prova1/Model/Allergeni.dart';
import 'package:prova1/Model/Ingrediente.dart';
import 'package:prova1/Model/Messaggio.dart';
import 'package:prova1/Model/Piatti.dart';
import 'package:prova1/Model/Tavolo.dart';

class ClientsConnessioneDB {
  List<List<Piatti>> takeAllPiattiDB() {
    return [
      [
        Piatti('Spaghetti allo scoglio', '15', '00001',
            'BUONO E GUSTOSO, UN PIATTO SEMPLICE CHE CONQUISTA TUTTI', [
          Allergeni('nichel')
        ], [
          Ingrediente('Mozzarella', '00003', '5.0', DateTime(2024, 8, 3),
              'Buono e gustoso gnam')
        ]),
        Piatti('Spaghetti alla amatriciana', '15', '', '', [], []),
        Piatti('Spaghetti alla carbonara', '15', '', '', [], []),
        Piatti('Spaghetti aglio ed olio', '15', '', '', [], []),
        Piatti('Spaghetti al pomodoro', '15', '', '', [], []),
        Piatti('Spaghetti al pesto', '15', '', '', [], []),
        Piatti('Spaghetti alle vongole', '15', '', '', [], []),
        Piatti('Spaghetti alle cozze', '15', '', '', [], []),
        Piatti('Spaghetti al pomodorino', '15', '', '', [], []),
        Piatti('Spaghetti al burro', '15', '', '', [], []),
      ],
      [
        Piatti('Spaghetti allo scoglio', '15', '', '', [], []),
        Piatti('Spaghetti alla amatriciana', '15', '', '', [], []),
        Piatti('Spaghetti alla carbonara', '15', '', '', [], []),
      ],
      [
        Piatti('Spaghetti allo scoglio', '15', '', '', [], []),
        Piatti('Spaghetti alla amatriciana', '15', '', '', [], []),
        Piatti('Spaghetti alla carbonara', '15', '', '', [], []),
      ],
      [
        Piatti('Spaghetti allo scoglio', '15', '', '', [], []),
        Piatti('Spaghetti alla amatriciana', '15', '', '', [], []),
        Piatti('Spaghetti alla carbonara', '15', '', '', [], []),
      ],
      [
        Piatti('Spaghetti allo scoglio', '15', '', '', [], []),
        Piatti('Spaghetti alla amatriciana', '15', '', '', [], []),
        Piatti('Spaghetti alla carbonara', '15', '', '', [], []),
      ]
    ];
  }

  List<Ingrediente> TakeIngredientiDB() {
    return [
      Ingrediente('Prosciutto cotto', '00001', '5.0', DateTime(2025, 8, 3),
          'Buono e gustoso gnamckospsniprkvpsmimo opf pwmorospvmsopigjsnvkpkm  mgpgwmdlskmgkewgpigkwrinpkwdfkmefowpgiwngkn gqpwfmkrdmslòfmsdkrnionkgsmkfmpsdksvmriongksi eipwkfmodlskmnkgirgnwbojcndlckamofpefèapvnddbu jngnjrspgkgjnsfnhgjpoae o pfiejaipfmkdkgnikdagpiengrujnjgaipefmoqdòklcvsnvriogn gefofeopa    ofejoppafpjoeaojpfopjafpjofefejofjojopfeapfaejoeevovuaaaaaaaaaaaaaaaa iojfeaeeeeeeeeeeeeeeeeeeeeeeeee paofnaudoavijoguhvjaeifaojncauofjaeionaceiaougnjcaidjpakwopdicmksljvdurjiapeugiacoqehaocjvnhryiu fuehajpsoiojiydfuoiefoneiduiosdjhayfuoinjhyudhifuiodjnhiyuofiajehhu ifaiuipodknjufiadjknjabgduivnk juivajdnjuivjdiuaejtudfj'),
      Ingrediente('Prosciutto crudo', '00002', '5.0', DateTime(2026, 8, 3),
          'Buono e gustoso gnam'),
      Ingrediente('Mozzarella', '00003', '5.0', DateTime(2024, 8, 3),
          'Buono e gustoso gnam'),
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
      Ingrediente('Prosciutto cotto', '00001', '5.0', DateTime(2025, 8, 3),
          'Buono e gustoso gnamckospsniprkvpsmimo opf pwmorospvmsopigjsnvkpkm  mgpgwmdlskmgkewgpigkwrinpkwdfkmefowpgiwngkn gqpwfmkrdmslòfmsdkrnionkgsmkfmpsdksvmriongksi eipwkfmodlskmnkgirgnwbojcndlckamofpefèapvnddbu jngnjrspgkgjnsfnhgjpoae o pfiejaipfmkdkgnikdagpiengrujnjgaipefmoqdòklcvsnvriogn gefofeopa    ofejoppafpjoeaojpfopjafpjofefejofjojopfeapfaejoeevovuaaaaaaaaaaaaaaaa iojfeaeeeeeeeeeeeeeeeeeeeeeeeee paofnaudoavijoguhvjaeifaojncauofjaeionaceiaougnjcaidjpakwopdicmksljvdurjiapeugiacoqehaocjvnhryiu fuehajpsoiojiydfuoiefoneiduiosdjhayfuoinjhyudhifuiodjnhiyuofiajehhu ifaiuipodknjufiadjknjabgduivnk juivajdnjuivjdiuaejtudfj'),
      Ingrediente('Prosciutto crudo', '00002', '5.0', DateTime(2026, 8, 3),
          'Buono e gustoso gnam'),
      Ingrediente('Mozzarella', '00003', '5.0', DateTime(2024, 8, 3),
          'Buono e gustoso gnam'),
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
    return 2;
  }

  bool AggiungiIngredienteDB(Ingrediente ingrediente) {
    return true;
  }

  bool UpdateIngredienteDB(Ingrediente ingrediente) {
    return true;
  }
}
