import 'package:comanda_full/pages/produtos/widgets/produto_change.dart';
import 'package:comanda_full/widget/bnb_adm.dart';
import 'package:comanda_full/data/model/produto.dart';
import 'package:comanda_full/pages/produtos/widgets/card_produto.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdmProdutoPage extends StatefulWidget {
  @override
  _AdmProdutoPageState createState() => _AdmProdutoPageState();
}

class _AdmProdutoPageState extends State<AdmProdutoPage> {
  late Future<List<Produto>> produtos;

  @override
  void initState() {
    super.initState();
    produtos = Produto.fetchProdutos();
  }

  Future<void> _atualizarDados() async {
    await Future.delayed(Duration(milliseconds: 500));

    setState(() {
      produtos = Produto.fetchProdutos();
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      bottomNavigationBar: bnbAdm(context, null),
      appBar: AppBar(title: Text('Produtos')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              showDragHandle: true,
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return FractionallySizedBox(
                    heightFactor: 0.95, child: ProdutoChange());
              });
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: RefreshIndicator(
            onRefresh: _atualizarDados,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: FutureBuilder<List<Produto>>(
                future: produtos,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    print('carregando...');
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    print('erro conexao');
                    return Center(child: Text('Erro: ${snapshot.error}'));
                  } else {
                    print('fetch ok! ');
                    final produtosList = snapshot.data!;

                    return Scrollbar(
                      interactive: true,
                      thickness: 10,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: produtosList.length,
                        itemBuilder: (context, index) {
                          final produto = produtosList[index];
                          return cardProduto(context, produto);
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
