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
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJrYWlvcHJvamVjdHMtand0Iiwic3ViIjoiQW5hU2lsdmEiLCJncm91cHMiOlsiQWRtaW4iXSwiZXhwIjoxNzU1MzI0NzA2LCJpYXQiOjE2OTQ4NDQ3MDYsImp0aSI6ImVjZTAwMWY1LTQ3ZGUtNDRiMy05NWM2LTdkZGQxNWMxZWVhZCJ9.eRQt7Pu86JGT7HpSWU58HW633lym_Gfn45nAPTFw3IBcN3_p_Z_cOT7iEm3NktPkXYpP30XGqgLIrFBIk99Ll7f9DEA7CWyuW0ZJcTDO5guwq9_hiIvdZbs5ZiKQQRdtLUAnjshSvWBLj3gTAGdl4OBga7hmEc-cB4InuW598U9eKa2CwGa8GMdUzAo0fJLUfskp2ITC_7wwirsNPP9BH3hI-bCgKokqRRLFLU9-rNykY08gwMF-Xf_Pu2OZdBKJH7mfERPTI9GlH7p4EKy7qy1p2VQbShRA2VppaHmBgcqk6b4D2EOM5vt5XLxXMdg71rw-lLRHpTGmEaM_mlqpnA', // Adicione o token aqui
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
      print("Valor de Venda: ${produto.valorVenda}");
      print("Estoque: ${produto.estoque}");
      print("\n");
    });
  } catch (e) {
    print("Erro: $e");
  }
}

List<ProdutoDTO> gerarProdutos(List<Map<String, dynamic>> data) {
  return data.map((produtoData) => ProdutoDTO.fromJson(produtoData)).toList();
}
