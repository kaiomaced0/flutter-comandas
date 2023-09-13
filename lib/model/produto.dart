class Produto {
  final String nome;
  final double valorCompra;
  final double valorVenda;
  final String tipoProduto;
  final int estoque;

  Produto(
      {required this.nome,
      required this.valorCompra,
      required this.valorVenda,
      required this.tipoProduto,
      required this.estoque});

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
        nome: map['nome'],
        valorCompra: map['valorCompra'],
        valorVenda: map['valorVenda'],
        tipoProduto: map['tipoProduto'],
        estoque: map['estoque']);
  }
}
