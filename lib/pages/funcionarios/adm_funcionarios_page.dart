import 'package:comanda_full/data/model/usuario.dart';
import 'package:comanda_full/pages/funcionarios/widgets/funcionario_change.dart';
import 'package:comanda_full/pages/funcionarios/widgets/card_funcionarios.dart';
import 'package:flutter/material.dart';
import 'package:comanda_full/widget/bnb_adm.dart';

class AdmFuncionariosPage extends StatefulWidget {
  const AdmFuncionariosPage({super.key});

  @override
  State<AdmFuncionariosPage> createState() => AdmFuncionariosPageState();
}

class AdmFuncionariosPageState extends State<AdmFuncionariosPage> {
  late Future<List<Usuario>> funcionarios;

  @override
  void initState() {
    super.initState();
    funcionarios = Usuario.fetchUsuarios();
  }

  Future<void> _atualizarDados() async {
    await Future.delayed(Duration(milliseconds: 500));

    setState(() {
      funcionarios = Usuario.fetchUsuarios();
    });
  }

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
          showModalBottomSheet(
              showDragHandle: true,
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return FractionallySizedBox(
                    heightFactor: 0.8, child: FuncionarioChange());
              });
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
          child: Center(
              child: Column(children: [
        RefreshIndicator(
          onRefresh: _atualizarDados,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: FutureBuilder<List<Usuario>>(
              future: funcionarios,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print('carregando...');
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  print('erro conexao');
                  return Center(child: Text('Erro: ${snapshot.error}'));
                } else {
                  print('fetch ok! ');
                  final funcionariosList = snapshot.data!;

                  return Scrollbar(
                    interactive: true,
                    thickness: 10,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: funcionariosList.length,
                      itemBuilder: (context, index) {
                        final funcionario = funcionariosList[index];
                        return cardFuncionario(
                            context,
                            Usuario(
                                id: funcionario.id,
                                nome: funcionario.nome,
                                login: funcionario.login,
                                cpf: funcionario.cpf,
                                perfil: funcionario.perfil));
                      },
                    ),
                  );
                }
              },
            ),
          ),
        )
      ]))),
    );
  }
}
