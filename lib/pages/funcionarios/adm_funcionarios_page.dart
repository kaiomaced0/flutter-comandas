import 'package:comanda_full/data/model/usuario.dart';
import 'package:comanda_full/widget/bs_add_funcionarios.dart';
import 'package:comanda_full/widget/card_funcionarios.dart';
import 'package:flutter/material.dart';
import 'package:comanda_full/widget/bnb_adm.dart';

class AdmFuncionariosPage extends StatefulWidget {
  final List<Usuario> funcionarios;
  const AdmFuncionariosPage({super.key, required this.funcionarios});

  @override
  State<AdmFuncionariosPage> createState() => AdmFuncionariosPageState();
}

class AdmFuncionariosPageState extends State<AdmFuncionariosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Funcionarios'),
        actions: [],
      ),
      bottomNavigationBar: bnbAdm(context, 0),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bsFuncionario(context, null);
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
          child: Center(
              child: Column(children: [
        cardFuncionario(
            context,
            Usuario(
                id: 5, nome: 'nome', login: 'login', cpf: 'cpf', perfil: [2]))
      ]))),
    );
  }
}
