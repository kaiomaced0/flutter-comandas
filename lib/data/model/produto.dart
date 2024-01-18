import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:comanda_full/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Produto {
  late int? id;
  late String nome;
  late String descricao;
  late double? custo;
  late double valor;
  late int? tipoProduto;
  late int estoque;
  late String linkimage;

  Produto(
      {this.id,
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
        custo: map['custo'] * 1.0,
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

  static Future<void> inserirProduto(Produto p) async {
    SharedPreferences _sharedpreferences =
        await SharedPreferences.getInstance();

    if (p.id == null) {
      final Uri uri = Uri.parse('$url/produto');
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${_sharedpreferences.getString('token')}'
        },
        body: jsonEncode(<String, String>{
          'nome': p.nome,
          'descricao': p.descricao,
          'linkimage': p.linkimage,
          'custo': p.custo.toString(),
          'valor': p.valor.toString(),
          'estoque': p.estoque.toString(),
          'idTipoProduto': p.tipoProduto.toString(),
        }),
      );

      if (response.statusCode == 200) {
        print('Produto inserido com sucesso: ${response.body}');
      } else {
        throw Exception('Falha ao inserir produto');
      }
    } else {
      final Uri uri = Uri.parse('$url/produto/update/${p.id}');
      final response = await http.patch(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${_sharedpreferences.getString('token')}'
        },
        body: jsonEncode(<String, String>{
          'nome': p.nome,
          'descricao': p.descricao,
          'linkimage': p.linkimage,
          'custo': p.custo.toString(),
          'valor': p.valor.toString(),
          'estoque': p.estoque.toString(),
          'idTipoProduto': p.tipoProduto.toString(),
        }),
      );

      if (response.statusCode == 200) {
        print('Produto alterado com sucesso: ${response.body}');
      } else {
        throw Exception('Falha ao alterar produto');
      }
    }
  }

  static Future<void> adicionarEstoqueProduto(int id, int quantidade) async {
    SharedPreferences _sharedpreferences =
        await SharedPreferences.getInstance();
    final Uri uri = Uri.parse('$url/produto/adicionarestoque');
    final response = await http.patch(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${_sharedpreferences.getString('token')}'
      },
      body: jsonEncode(<String, String>{
        'id': id.toString(),
        'quantidade': quantidade.toString(),
      }),
    );

    if (response.statusCode == 200) {
      print('Estoque Produto inserido com sucesso: ${response.body}');
    } else {
      throw Exception('Falha ao inserir estoque produto');
    }
  }

  static Future<void> removerEstoqueProduto(int id, int quantidade) async {
    SharedPreferences _sharedpreferences =
        await SharedPreferences.getInstance();
    final Uri uri = Uri.parse('$url/produto/retirarestoque');
    final response = await http.patch(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${_sharedpreferences.getString('token')}'
      },
      body: jsonEncode(<String, String>{
        'id': id.toString(),
        'quantidade': quantidade.toString(),
      }),
    );

    if (response.statusCode == 200) {
      print('Estoque Produto removido com sucesso: ${response.body}');
    } else {
      throw Exception('Falha ao remover estoque produto');
    }
  }
}
