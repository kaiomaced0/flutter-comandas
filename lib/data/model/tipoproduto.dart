import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:comanda_full/main.dart';

class TipoProduto {
  late int id;
  late String nome;
  late String cor;

  TipoProduto({required this.id, required this.nome, required this.cor});

  factory TipoProduto.fromMap(Map<String, dynamic> map) {
    return TipoProduto(id: map['id'], nome: map['nome'], cor: map['cor']);
  }

  static Future<List<TipoProduto>> fetchTipoProdutos() async {
    print('entrou na funcao fetch ');

    final response = await http.get(Uri.parse('${url}/tipoproduto'), headers: {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJrYWlvcHJvamVjdHMtand0Iiwic3ViIjoiQnJ1bm9DYXN0cm8iLCJncm91cHMiOlsiQWRtaW4iXSwiZXhwIjoxNzU3NTM5Mzk4LCJpYXQiOjE2OTcwNTkzOTgsImp0aSI6ImM0YmFkYWY1LTEwOGEtNGQ2MS1iOGQ5LTNhZmU0ZDdkNGRkOSJ9.pCsZcgHtV9mJVTShNVSCOQZ0A_JeoG8F4q3wEGad1KVVLd7W9f4FbWT2d9MP4_1_7TRO-44m3VR-eheNYnscoDl5u4Z6GnrDM49uL8g5YjyhbYRmhkf3j8C0OfsAdE6mZof1mvbmHWGjZ5kgknoR1SjG18Y9Qp0haSR9gAkNS--IdKwyNWYJuPZAN53u1ooP8HdBT9hikd61FCwIM8ColAauNql7KN9hVj-tjjZjHokBCLcxt4tx_-pGAtwwGyu6Ik9J5mLxiYQe9HRYu7AZ86sfPF38maYfXPFJAyUxWydbqQ5BuHnTTxtVn9IgoPqsIUaMM1ZhHXvsdNTCGtBbHA'
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
}
