import 'package:prova1/Model/User.dart';

class Cucina extends User {
  String nome = "";
  String cognome = "";
  String email;
  String password;

  Cucina(this.nome, this.cognome, this.email, this.password)
      : super(email: email, password: password);

  Cucina.emailAndPassword(this.email, this.password)
      : super(email: email, password: password);
}
