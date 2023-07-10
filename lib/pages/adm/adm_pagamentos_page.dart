import 'package:comanda_full/widget/button_filter_pagamentos.dart';
import 'package:comanda_full/widget/card_pagamento.dart';
import 'package:flutter/material.dart';
import 'package:comanda_full/widget/bnb_adm.dart';

class AdmPagamentosPage extends StatefulWidget {
  const AdmPagamentosPage({super.key});

  @override
  State<AdmPagamentosPage> createState() => AdmPagamentosPageState();
}

class AdmPagamentosPageState extends State<AdmPagamentosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagamentos'),
        actions: [],
      ),
      bottomNavigationBar: bnbAdm(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            FiltroPagamento(context),
            cardPagamento(context),
            cardPagamento(context),
            cardPagamento(context),
          ],
        )),
      ),
    );
  }
}
