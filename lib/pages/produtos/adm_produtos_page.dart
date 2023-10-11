import 'dart:convert';

import 'package:comanda_full/data/model/produto.dart';
import 'package:comanda_full/widget/bs_add_produto.dart';
import 'package:comanda_full/widget/card_produto.dart';
import 'package:flutter/material.dart';
import 'package:comanda_full/widget/bnb_adm.dart';
import 'package:http/http.dart' as http;

class AdmProdutoPage extends StatefulWidget {
  const AdmProdutoPage({super.key});

  @override
  State<AdmProdutoPage> createState() => AdmProdutoPageState();
}

class AdmProdutoPageState extends State<AdmProdutoPage> {
  Produto p = new Produto(id: 1, nome: 'objeto', valorVenda: 50, estoque: 10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [],
      ),
      bottomNavigationBar: bnbAdm(context, null),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bsProduto(context);
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
          child: Center(
              child: Column(children: [
        cardProduto(context, p),
        cardProduto(context, p)
      ]))),
    );
  }
}
