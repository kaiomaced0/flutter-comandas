import 'package:comanda_full/widget/bs_add_funcionarios.dart';
import 'package:comanda_full/widget/card_funcionarios.dart';
import 'package:flutter/material.dart';
import 'package:comanda_full/widget/bnb_adm.dart';

class AdmFuncionariosPage extends StatefulWidget {
  const AdmFuncionariosPage({super.key});

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
      bottomNavigationBar: bnbAdm(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            showDragHandle: true,
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return SingleChildScrollView(child: bsFuncionario(context));
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
          child: Center(
              child: Column(children: [cardFuncionario(), cardFuncionario()]))),
    );
  }
}
