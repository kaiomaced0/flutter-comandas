class ItemCompra {
  final int produto;
  final int quantidade;
  final double valor;

  ItemCompra(
      {required this.produto, required this.quantidade, required this.valor});

  factory ItemCompra.fromMap(Map<String, dynamic> map) {
    return ItemCompra(
        produto: map['produto'],
        quantidade: map['quantidade'],
        valor: map['valor'] * 1.0);
  }
}
