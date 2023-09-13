class Pedido {
  final List<int> itemCompra;
  final String observacao;
  final int status;
  final double valor;
  final int quantidadePessoas;

  Pedido(
      {required this.itemCompra,
      required this.observacao,
      required this.status,
      required this.valor,
      required this.quantidadePessoas});

  factory Pedido.fromMap(Map<String, dynamic> map) {
    return Pedido(
        itemCompra: List<int>.from((map['itemCompra' as List])),
        observacao: map['observacao'],
        status: map['status'],
        valor: map['valor'] * 1.0,
        quantidadePessoas: map['quantidadePessoas']);
  }
}
