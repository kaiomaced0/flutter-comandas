import 'package:comanda_full/widget/bs_add_produto.dart';
import 'package:comanda_full/widget/bnb_adm.dart';
import 'package:comanda_full/data/model/produto.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bnbAdm(context, null),
      appBar: AppBar(
        title: Text('Produtos'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bsProduto(context, null);
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FutureBuilder<List<Produto>>(
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

                  return ListView.builder(
                    itemCount: produtosList.length,
                    itemBuilder: (context, index) {
                      final produto = produtosList[index];
                      return ListTile(
                        title: Text(produto.nome),
                        subtitle: Text(
                            'ID: ${produto.id} - Valor: ${produto.valor.toStringAsFixed(2)} - Estoque: ${produto.estoque}'),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
