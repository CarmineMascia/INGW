import 'package:prova1/Model/User.dart';

class Supervisore extends User {
  String nome = "";
  String cognome = "";
  String email;
  String password;

  Supervisore(this.nome, this.cognome, this.email, this.password)
      : super(email: email, password: password);

  Supervisore.emailAndPassword(this.email, this.password)
      : super(email: email, password: password);
}
