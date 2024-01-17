import 'dart:convert';
import 'package:comanda_full/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Usuario {
  final int id;
  final String nome;
  final String login;
  final String cpf;
  final List<int> perfil;

  Usuario(
      {required this.id,
      required this.nome,
      required this.login,
      required this.cpf,
      required this.perfil});

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
        id: map['id'],
        nome: map['nome'],
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

    final response = await http.get(Uri.parse('${url}/usuario'),
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
}
