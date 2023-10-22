import 'package:prova1/Model/User.dart';

class Sala extends User{
  String nome = "";
  String cognome = "";
  String email;
  String password;

  Sala(this.nome, this.cognome, this.email, this.password)
      : super(email: email, password: password);

  Sala.emailAndPassword(this.email, this.password)
      : super(email: email, password: password);
}
