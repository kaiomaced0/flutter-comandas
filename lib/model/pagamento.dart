class Pagamento {
  final int comanda;
  final bool pagamentoRealizado;
  final int caixa;
  final double valorPagamento;

  Pagamento(
      {required this.comanda,
      required this.pagamentoRealizado,
      required this.caixa,
      required this.valorPagamento});
  factory Pagamento.fromMap(Map<String, dynamic> map) {
    return Pagamento(
        comanda: map['comanda'],
        pagamentoRealizado: map['pagamentoRealizado'],
        caixa: map['caixa'],
        valorPagamento: map['valorPagamento'] * 1.0);
  }
}
