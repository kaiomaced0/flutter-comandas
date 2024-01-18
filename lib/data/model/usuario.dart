import 'dart:convert';
import 'package:comanda_full/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Usuario {
  final int? id;
  final bool? ativo;
  final String nome;
  final String login;
  final String cpf;
  final List<int>? perfil;

  Usuario(
      {this.id,
      required this.nome,
      this.ativo,
      required this.login,
      required this.cpf,
      this.perfil});

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
        id: map['id'],
        nome: map['nome'],
        ativo: map['ativo'],
        login: map['login'],
        cpf: map['cpf'] ?? '000000000-00',
        perfil: (map['listaPerfil'] as List)
            .map((item) => item['id'] as int)
            .toList());
  }

  static Future<Usuario> obterDadosUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    var baseUrl = Uri.parse('$url/usuariologado');

    var resposta = await http.get(baseUrl, headers: {
      'Authorization': 'Bearer $token',
    });

    if (resposta.statusCode == 200) {
      Map<String, dynamic> dados = json.decode(resposta.body);
      return Usuario.fromMap(dados);
    } else {
      throw Exception('Falha ao carregar dados do usuário');
    }
  }

  static Future<List<Usuario>> fetchUsuarios() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    final response = await http.get(Uri.parse('${url}/gerente/funcionarios'),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      print('response ok');
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Usuario.fromMap(json)).toList();
    } else {
      print('falha ao carregar os Usuarios');
      throw Exception('Falha ao carregar os Usuarios');
    }
  }

  static Future<void> inserirUsuario(
      Usuario u, String senha, String idPerfil) async {
    SharedPreferences _sharedpreferences =
        await SharedPreferences.getInstance();

    if (u.id == null) {
      final Uri uri = Uri.parse('$url/gerente/funcionario/add');
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${_sharedpreferences.getString('token')}'
        },
        body: jsonEncode(<String, String>{
          'nome': u.nome,
          'login': u.login,
          'senha': senha,
          'cpf': u.cpf,
          'idPerfil': idPerfil,
        }),
      );

      if (response.statusCode == 200) {
        print('Usuario inserido com sucesso: ${response.body}');
      } else {
        throw Exception('Falha ao inserir Usuario');
      }
    } else {
      Uri uri = Uri.parse('$url/gerente/funcionario/update/nome');
      final response = await http.patch(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${_sharedpreferences.getString('token')}'
        },
        body: jsonEncode(<String, String>{
          'id': u.id.toString(),
          'nome': u.nome,
        }),
      );
      uri = Uri.parse('$url/gerente/funcionario/update/senha');
      http.patch(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${_sharedpreferences.getString('token')}'
        },
        body: jsonEncode(<String, String>{
          'idUsuario': u.id.toString(),
          'senha': senha,
        }),
      );

      if (response.statusCode == 200) {
        print('Usuario alterado com sucesso: ${response.body}');
      } else {
        throw Exception('Falha ao alterar Usuario');
      }
    }
  }
}
