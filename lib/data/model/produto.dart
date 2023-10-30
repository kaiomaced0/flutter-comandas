import 'dart:convert';
import 'package:http/http.dart' as http;

class Produto {
  final int id;
  final String nome;
  final double? valorCompra;
  final double valorVenda;
  final String? tipoProduto;
  final int estoque;

  Produto(
      {required this.id,
      required this.nome,
      this.valorCompra,
      required this.valorVenda,
      this.tipoProduto,
      required this.estoque});

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
        id: map['id'],
        nome: map['nome'],
        valorVenda: map['valorVenda'] * 1.0,
        estoque: map['estoque']);
  }
// }

  static Future<List<Produto>> fetchProdutos() async {
    print('entrou na funcao fetch ');

    final response =
        await http.get(Uri.parse('http://localhost:8080/produto'), headers: {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJrYWlvcHJvamVjdHMtand0Iiwic3ViIjoiQnJ1bm9DYXN0cm8iLCJncm91cHMiOlsiQWRtaW4iXSwiZXhwIjoxNzU3NTM5Mzk4LCJpYXQiOjE2OTcwNTkzOTgsImp0aSI6ImM0YmFkYWY1LTEwOGEtNGQ2MS1iOGQ5LTNhZmU0ZDdkNGRkOSJ9.pCsZcgHtV9mJVTShNVSCOQZ0A_JeoG8F4q3wEGad1KVVLd7W9f4FbWT2d9MP4_1_7TRO-44m3VR-eheNYnscoDl5u4Z6GnrDM49uL8g5YjyhbYRmhkf3j8C0OfsAdE6mZof1mvbmHWGjZ5kgknoR1SjG18Y9Qp0haSR9gAkNS--IdKwyNWYJuPZAN53u1ooP8HdBT9hikd61FCwIM8ColAauNql7KN9hVj-tjjZjHokBCLcxt4tx_-pGAtwwGyu6Ik9J5mLxiYQe9HRYu7AZ86sfPF38maYfXPFJAyUxWydbqQ5BuHnTTxtVn9IgoPqsIUaMM1ZhHXvsdNTCGtBbHA'
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
