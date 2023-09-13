class Usuario {
  final String nome;
  final String login;
  final String cpf;
  final int perfil;

  Usuario(
      {required this.nome,
      required this.login,
      required this.cpf,
      required this.perfil});

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
        nome: map['nome'],
        login: map['login'],
        cpf: map['cpf'],
        perfil: map['perfil']);
  }
}
