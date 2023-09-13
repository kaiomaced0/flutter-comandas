class Caixa {
  final List<int> comandas;
  final List<int> pagamentos;
  final double valorTotal;
  final DateTime dataCaixa;

  Caixa(
      {required this.comandas,
      required this.pagamentos,
      required this.valorTotal,
      required this.dataCaixa});

  factory Caixa.fromMap(Map<String, dynamic> map) {
    return Caixa(
        comandas: map['comandas'],
        pagamentos: map['pagamentos'],
        valorTotal: map['valorTotal'] * 1.0,
        dataCaixa: map['dataCaixa']);
  }
}
