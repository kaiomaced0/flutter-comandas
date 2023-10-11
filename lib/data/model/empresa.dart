class Empresa {
  final String cnpj;
  final String nome;
  final String nomeFantasia;
  final List<int> empresaPagamento;
  final int admin;
  final DateTime proxPagamento;
  final List<int> produtos;
  final List<int> caixas;
  final List<int> pagamentos;
  final List<int> comandas;
  final List<int> pedidos;
  final List<int> funcionarios;

  Empresa(
      {required this.cnpj,
      required this.nome,
      required this.nomeFantasia,
      required this.empresaPagamento,
      required this.admin,
      required this.proxPagamento,
      required this.produtos,
      required this.caixas,
      required this.pagamentos,
      required this.comandas,
      required this.pedidos,
      required this.funcionarios});

  factory Empresa.fromMap(Map<String, dynamic> map) {
    return Empresa(
        cnpj: map['cnpj'],
        nome: map['nome'],
        nomeFantasia: map['nomeFantasia'],
        empresaPagamento: map['empresaPagamento'],
        admin: map['admin'],
        proxPagamento: map['proxPagamento'],
        produtos: map['produtos'],
        caixas: map['caixas'],
        pagamentos: map['pagamentos'],
        comandas: map['comandas'],
        pedidos: map['pedidos'],
        funcionarios: map['funcionarios']);
  }
}
