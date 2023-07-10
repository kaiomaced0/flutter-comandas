import 'package:comanda_full/widget/bs_add_produto.dart';
import 'package:comanda_full/widget/card_produto.dart';
import 'package:flutter/material.dart';
import 'package:comanda_full/widget/bnb_adm.dart';

class AdmProdutoPage extends StatefulWidget {
  const AdmProdutoPage({super.key});

  @override
  State<AdmProdutoPage> createState() => AdmProdutoPageState();
}

class AdmProdutoPageState extends State<AdmProdutoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [],
      ),
      bottomNavigationBar: bnbAdm(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bsProduto(context);
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
          child: Center(
              child: Column(
                  children: [cardProduto(context), cardProduto(context)]))),
    );
  }
}
