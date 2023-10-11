import 'package:comanda_full/data/model/empresa.dart';
import 'package:comanda_full/data/model/usuario.dart';

class UsuarioLogado {
  final String token;
  final Usuario usuario;
  final Empresa empresa;

  UsuarioLogado(
      {required this.token, required this.usuario, required this.empresa});
}
