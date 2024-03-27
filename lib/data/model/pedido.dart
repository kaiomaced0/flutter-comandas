import 'dart:convert';
import 'package:comanda_full/data/model/itemcompra.dart';
import 'package:comanda_full/main.dart';
import 'package:http/http.dart' as http;

class Pedido {
  late List<ItemCompra> itemCompra;
  late String observacao;
  late String status;
  late double valor;
  late int quantidadePessoas;
  late int idComanda;

  Pedido(
      {required this.itemCompra,
      required this.observacao,
      required this.status,
      required this.valor,
      required this.quantidadePessoas});

  factory Pedido.fromMap(Map<String, dynamic> map) {
    return Pedido(
        itemCompra: List<ItemCompra>.from((map['itemCompra' as List])),
        observacao: map['observacao'],
        status: map['status'],
        valor: map['valor'] * 1.0,
        quantidadePessoas: map['quantidadePessoas']);
  }

  static Future<List<Pedido>> fetchProdutos() async {
    final response = await http.get(Uri.parse('${url}/pedido'), headers: {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJrYWlvcHJvamVjdHMtand0Iiwic3ViIjoiQnJ1bm9DYXN0cm8iLCJncm91cHMiOlsiQWRtaW4iXSwiZXhwIjoxNzU3NDc3OTIxLCJpYXQiOjE2OTY5OTc5MjEsImp0aSI6IjNhZWIyZjJkLTA0OWYtNGE2OC1iYWEzLTMxZjkwM2E0YTA1ZiJ9.BJOn0lOYsoaCCZyNYkba8hDJ3-Je3H6X-RQT0EnH_cnNAu_Y0yPKrfMUj49CgDc2pMI9OnVrkJvjbaPKxGD2O5PlOjf9-VOAW4YdAdtSL-LjwKbtEDf83F9j-BW_-y898kQpmjpzCGNQtDQCHYVfT5VOZBvgmYSnF0kMJzIEm_7uirUlQCc6ekumSeNwdS4we019582ZZ2KBOc1ZDIXL-aC-3HvqbolrNjh0d0CaLG8w61kSBxOfUSHtyBtdADDQvhCK9vt_mI8ccigyv77yLtgdgM_mhQucwJFgVh4LNDDHjJWG6q7s10yEtRYbDoo2VauSxo60rpQoI1lHgpzjKQ'
    });
    if (response.statusCode == 200) {
      print('response ok');
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Pedido.fromMap(json)).toList();
    } else {
      print('falha ao carregar os pedidos');
      throw Exception('Falha ao carregar os pedidos');
    }
  }
}
