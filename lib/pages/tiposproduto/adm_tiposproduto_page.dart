import 'package:comanda_full/data/model/tipoproduto.dart';
import 'package:comanda_full/widget/bs_tiposproduto.dart';
import 'package:comanda_full/widget/card_tiposproduto.dart';
import 'package:flutter/material.dart';
import 'package:comanda_full/widget/bnb_adm.dart';

class AdmTiposProdutoPage extends StatefulWidget {
  AdmTiposProdutoPage({super.key});

  @override
  State<AdmTiposProdutoPage> createState() => AdmTiposProdutoPageState();
}

class AdmTiposProdutoPageState extends State<AdmTiposProdutoPage> {
  late Future<List<TipoProduto>> tipoProdutos;
  @override
  void initState() {
    tipoProdutos = TipoProduto.fetchTipoProdutos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipos de Produto'),
        actions: [],
      ),
      bottomNavigationBar: bnbAdm(context, 0),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bsTiposProduto(context);
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: FutureBuilder<List<TipoProduto>>(
              future: tipoProdutos,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print('carregando...');
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  print('erro conexao');
                  return Center(child: Text('Erro: ${snapshot.error}'));
                } else {
                  print('fetch ok! ');
                  final tipolist = snapshot.data!;

                  return Scrollbar(
                    interactive: true,
                    thickness: 10,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return cardTiposProduto(context, tipolist[index]);
                        },
                        itemCount: tipolist.length),
                  );
                }
              }),
        ),
      ),
    );
  }
}
