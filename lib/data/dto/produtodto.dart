import 'dart:convert';

import 'package:comanda_full/data/model/produto.dart';
import 'package:http/http.dart' as http;

class ProdutoDTO {
  final int id;
  final String nome;
  final double valorVenda;
  final int estoque;

  ProdutoDTO({
    required this.id,
    required this.nome,
    required this.valorVenda,
    required this.estoque,
  });

  factory ProdutoDTO.fromJson(Map<String, dynamic> json) {
    return ProdutoDTO(
      id: json['id'] as int,
      nome: json['nome'] as String,
      valorVenda: json['valorVenda'] * 1.0 as double,
      estoque: json['estoque'] as int,
    );
  }
}

Produto criaProduto(ProdutoDTO produtoDTO) {
  return Produto(
      estoque: produtoDTO.estoque,
      nome: produtoDTO.nome,
      valorVenda: produtoDTO.valorVenda,
      id: produtoDTO.id,
      tipoProduto: null,
      valorCompra: null);
}

Future<List<Produto>> obterProdutos() async {
  List<Produto> produtos = [];
  final headers = {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJrYWlvcHJvamVjdHMtand0Iiwic3ViIjoiQnJ1bm9DYXN0cm8iLCJncm91cHMiOlsiQWRtaW4iXSwiZXhwIjoxNzU3NDc3OTIxLCJpYXQiOjE2OTY5OTc5MjEsImp0aSI6IjNhZWIyZjJkLTA0OWYtNGE2OC1iYWEzLTMxZjkwM2E0YTA1ZiJ9.BJOn0lOYsoaCCZyNYkba8hDJ3-Je3H6X-RQT0EnH_cnNAu_Y0yPKrfMUj49CgDc2pMI9OnVrkJvjbaPKxGD2O5PlOjf9-VOAW4YdAdtSL-LjwKbtEDf83F9j-BW_-y898kQpmjpzCGNQtDQCHYVfT5VOZBvgmYSnF0kMJzIEm_7uirUlQCc6ekumSeNwdS4we019582ZZ2KBOc1ZDIXL-aC-3HvqbolrNjh0d0CaLG8w61kSBxOfUSHtyBtdADDQvhCK9vt_mI8ccigyv77yLtgdgM_mhQucwJFgVh4LNDDHjJWG6q7s10yEtRYbDoo2VauSxo60rpQoI1lHgpzjKQ', // Adicione o token aqui
    'Content-Type': 'application/json',
  };
  final response = await http.get(Uri.parse('http://localhost:8080/produto'),
      headers: headers);

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data
        .map((produtoData) => criaProduto(ProdutoDTO.fromJson(produtoData)))
        .toList();
  } else {
    throw Exception('Falha ao carregar produtos');
  }
}

void main() async {
  try {
    final produtos = await obterProdutos();

    produtos.forEach((produto) {
      print("ID: ${produto.id}");
      print("Nome: ${produto.nome}");
      print("\n");
    });
  } catch (e) {
    print("Erro: $e");
  }
}

List<ProdutoDTO> gerarProdutos(List<Map<String, dynamic>> data) {
  return data.map((produtoData) => ProdutoDTO.fromJson(produtoData)).toList();
}
