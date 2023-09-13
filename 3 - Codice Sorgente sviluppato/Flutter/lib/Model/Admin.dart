import 'package:prova1/Model/User.dart';

class Admin extends User {
  String nome = "";
  String cognome = "";
  String email;
  String password;

  Admin(this.nome, this.cognome, this.email, this.password)
      : super(email: email, password: password);

  Admin.emailAndPassword(this.email, this.password)
      : super(email: email, password: password);
}
