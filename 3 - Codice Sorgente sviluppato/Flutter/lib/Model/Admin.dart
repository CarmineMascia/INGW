class Admin {
  String nome = "";
  String cognome = "";
  String email;
  String password;

  Admin(this.nome, this.cognome, this.email, this.password);

  Admin.emailAndPassword(this.email, this.password);
}
