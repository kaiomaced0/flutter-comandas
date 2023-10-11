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
        valorCompra: map['valorCompra'] * 1.0,
        valorVenda: map['valorVenda'] * 1.0,
        tipoProduto: map['tipoProduto'],
        estoque: map['estoque']);
  }

  List<Produto> gerarProdutos(List<Map<String, dynamic>> data) {
    return data.map((produtoData) => Produto.fromMap(produtoData)).toList();
  }
}
