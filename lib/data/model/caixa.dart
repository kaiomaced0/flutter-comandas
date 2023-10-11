import 'dart:ffi';

class Caixa {
  final String nome;
  final List<Long> comandas;
  final List<Long> pagamentos;
  final double valorTotal;
  final DateTime dataCaixa;

  Caixa(
      {required this.nome,
      required this.comandas,
      required this.pagamentos,
      required this.valorTotal,
      required this.dataCaixa});

  factory Caixa.fromMap(Map<String, dynamic> map) {
    return Caixa(
        nome: map['nome'],
        comandas: map['comandas'],
        pagamentos: map['pagamentos'],
        valorTotal: map['valorTotal'] * 1.0,
        dataCaixa: map['dataCaixa']);
  }
}
