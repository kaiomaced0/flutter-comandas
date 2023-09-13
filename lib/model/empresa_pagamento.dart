class EmpresaPagamento {
  final int empresa;
  final String data;
  final bool pago;

  EmpresaPagamento(
      {required this.empresa, required this.data, required this.pago});

  factory EmpresaPagamento.fromMap(Map<String, dynamic> map) {
    return EmpresaPagamento(
        empresa: map['empresa'], data: map['data'], pago: map['pago']);
  }
}
