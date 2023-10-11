class Comanda {
  final List<int> pedidos;
  final String nome;
  final double valor;
  final int pagamento;
  final int atendente;
  final bool servico;

  Comanda(
      {required this.pedidos,
      required this.nome,
      required this.valor,
      required this.pagamento,
      required this.atendente,
      required this.servico});

  factory Comanda.fromMap(Map<String, dynamic> map) {
    return Comanda(
      pedidos: List<int>.from((map['pedidos'] as List)),
      nome: map['nome'],
      valor: map['valor'],
      pagamento: map['pagamento'],
      atendente: map['atendente'],
      servico: map['servico']);
  }

}
