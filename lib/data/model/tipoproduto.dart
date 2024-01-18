import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:comanda_full/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TipoProduto {
  late int? id;
  late String nome;
  late String? cor;

  TipoProduto({this.id, required this.nome, this.cor});

  factory TipoProduto.fromMap(Map<String, dynamic> map) {
    return TipoProduto(id: map['id'], nome: map['nome'], cor: map['cor']);
  }

  static Future<List<TipoProduto>> fetchTipoProdutos() async {
    SharedPreferences _sharedpreferences =
        await SharedPreferences.getInstance();
    print('entrou na funcao fetch ');

    final response = await http.get(Uri.parse('${url}/tipoproduto'), headers: {
      'Authorization': 'Bearer ${_sharedpreferences.getString('token')}'
    });
    if (response.statusCode == 200) {
      print('response ok');
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => TipoProduto.fromMap(json)).toList();
    } else {
      print('falha ao carregar os TipoProdutos');
      throw Exception('Falha ao carregar os TipoProdutos');
    }
  }

  static Future<void> inserirTipoProduto(TipoProduto t) async {
    print('id ${t.id ?? 0}, nome ${t.nome ?? 'vazio'}, cor ${t.cor} ');
    if (t == null) {
      print('TipoProduto é null');
      throw Exception('Falha ao inserir tipoProduto, TipoProduto Null');
    }
    SharedPreferences _sharedpreferences =
        await SharedPreferences.getInstance();

    if (t.id == null) {
      final Uri uri = Uri.parse('$url/tipoproduto');
      print(uri.toString());
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${_sharedpreferences.getString('token')}'
        },
        body: jsonEncode(<String, String>{
          'nome': t.nome,
          'cor': t.cor!,
        }),
      );

      if (response.statusCode == 200) {
        // Se a chamada para o servidor foi bem-sucedida, analise a resposta.
        print('Produto inserido com sucesso: ${response.body}');
      } else {
        // Se a chamada não foi bem-sucedida, lance um erro.
        throw Exception('Falha ao inserir produto');
      }
    } else {
      final Uri uri = Uri.parse('$url/tipoproduto/update/${t.id}');
      print(uri.toString());
      final response = await http.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${_sharedpreferences.getString('token')}'
        },
        body: jsonEncode(<String, String>{
          'nome': t.nome,
          'cor': t.cor!,
        }),
      );

      if (response.statusCode == 200) {
        // Se a chamada para o servidor foi bem-sucedida, analise a resposta.
        print('Produto inserido com sucesso: ${response.body}');
      } else {
        // Se a chamada não foi bem-sucedida, lance um erro.
        throw Exception('Falha ao inserir produto');
      }
    }
  }
}
