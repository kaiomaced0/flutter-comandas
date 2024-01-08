import 'dart:convert';
import 'package:comanda_full/main.dart';
import 'package:http/http.dart' as http;

class Comanda {
  final int id;
  final List<int> pedidos;
  final String nome;
  final double valor;
  final int pagamento;
  final int atendente;
  final bool servico;

  Comanda(
      {required this.id,
      required this.pedidos,
      required this.nome,
      required this.valor,
      required this.pagamento,
      required this.atendente,
      required this.servico});

  factory Comanda.fromMap(Map<String, dynamic> map) {
    return Comanda(
        id: map['id'],
        pedidos: List<int>.from((map['pedidos'] as List)),
        nome: map['nome'],
        valor: map['valor'],
        pagamento: map['pagamento'],
        atendente: map['atendente'],
        servico: map['servico']);
  }

  static Future<List<Comanda>> fetchComandas() async {
    final response = await http.get(Uri.parse('${url}/comanda'), headers: {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJrYWlvcHJvamVjdHMtand0Iiwic3ViIjoiQnJ1bm9DYXN0cm8iLCJncm91cHMiOlsiQWRtaW4iXSwiZXhwIjoxNzU3NDc3OTIxLCJpYXQiOjE2OTY5OTc5MjEsImp0aSI6IjNhZWIyZjJkLTA0OWYtNGE2OC1iYWEzLTMxZjkwM2E0YTA1ZiJ9.BJOn0lOYsoaCCZyNYkba8hDJ3-Je3H6X-RQT0EnH_cnNAu_Y0yPKrfMUj49CgDc2pMI9OnVrkJvjbaPKxGD2O5PlOjf9-VOAW4YdAdtSL-LjwKbtEDf83F9j-BW_-y898kQpmjpzCGNQtDQCHYVfT5VOZBvgmYSnF0kMJzIEm_7uirUlQCc6ekumSeNwdS4we019582ZZ2KBOc1ZDIXL-aC-3HvqbolrNjh0d0CaLG8w61kSBxOfUSHtyBtdADDQvhCK9vt_mI8ccigyv77yLtgdgM_mhQucwJFgVh4LNDDHjJWG6q7s10yEtRYbDoo2VauSxo60rpQoI1lHgpzjKQ'
    });
    if (response.statusCode == 200) {
      print('response ok');
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Comanda.fromMap(json)).toList();
    } else {
      print('falha ao carregar os Comandas');
      throw Exception('Falha ao carregar os Comandas');
    }
  }
}
