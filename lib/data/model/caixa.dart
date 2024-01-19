import 'dart:convert';
import 'dart:ffi';
import 'package:comanda_full/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Caixa {
  late String nome;
  late String? comentario;
  late double? valorTotal;
  late bool? fechado;

  Caixa(
      {required this.nome,
      this.comentario,
      required this.valorTotal,
      this.fechado});

  factory Caixa.fromMap(Map<String, dynamic> map) {
    return Caixa(
        nome: map['nome'],
        comentario: map['comentario'],
        valorTotal: map['valorTotal'] * 1.0,
        fechado: map['fechado'] ?? false);
  }

  static Future<List<Caixa>> fetchCaixas() async {
    SharedPreferences _sharedpreferences =
        await SharedPreferences.getInstance();
    final response = await http.get(
      Uri.parse('${url}/caixa'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${_sharedpreferences.getString('token')}'
      },
    );
    if (response.statusCode == 200) {
      print('response ok');
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Caixa.fromMap(json)).toList();
    } else {
      print('falha ao carregar os Caixas');
      throw Exception('Falha ao carregar os Caixas');
    }
  }

  static Future<Caixa> atual() async {
    SharedPreferences _sharedpreferences =
        await SharedPreferences.getInstance();
    final response = await http.get(
      Uri.parse('${url}/caixa/atual'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${_sharedpreferences.getString('token')}'
      },
    );
    if (response.statusCode == 200) {
      print('response ok');
      return Caixa.fromMap(json.decode(response.body));
    } else {
      print('falha ao carregar os Caixas');
      throw Exception('Falha ao carregar os Caixas');
    }
  }

  static Future<void> insertCaixa(Caixa c) async {
    if (c == null) {
      print('Caixa é null');
      throw Exception('Falha ao inserir Caixa, Caixa Null');
    }
    SharedPreferences _sharedpreferences =
        await SharedPreferences.getInstance();

    final Uri uri = Uri.parse('$url/caixa');
    print(uri.toString());
    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${_sharedpreferences.getString('token')}'
      },
      body: jsonEncode(
          <String, String>{'nome': c.nome, 'comentario': c.comentario ?? ''}),
    );

    if (response.statusCode == 200) {
      print('Caixa inserido com sucesso: ${response.body}');
    } else {
      throw Exception('Falha ao inserir Caixa');
    }
  }
}
