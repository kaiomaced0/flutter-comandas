import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:comanda_full/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Produto {
  late int id;
  late String nome;
  late String descricao;
  late double? custo;
  late double valor;
  late int tipoProduto;
  late int estoque;
  late String linkimage;

  Produto(
      {required this.id,
      required this.nome,
      required this.descricao,
      this.custo,
      required this.valor,
      required this.tipoProduto,
      required this.estoque,
      required this.linkimage});

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
        id: map['id'],
        nome: map['nome'] ?? '',
        descricao: map['descricao'] ?? '',
        tipoProduto: map['tipoProduto'] ?? 1,
        valor: map['valor'] * 1.0,
        estoque: map['estoque'] ?? null,
        linkimage: map['linkimage'] ?? '');
  }
// }

  static Future<List<Produto>> fetchProdutos() async {
    SharedPreferences _sharedpreferences =
        await SharedPreferences.getInstance();
    print('entrou na funcao fetch ');

    final response = await http.get(Uri.parse('${url}/produto'), headers: {
      'Authorization': 'Bearer ${_sharedpreferences.getString('token')}'
    });
    if (response.statusCode == 200) {
      print('response ok');
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Produto.fromMap(json)).toList();
    } else {
      print('falha ao carregar os produtos');
      throw Exception('Falha ao carregar os produtos');
    }
  }

  
}
