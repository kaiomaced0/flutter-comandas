import 'package:comanda_full/widget/bs_tiposproduto.dart';
import 'package:comanda_full/widget/card_tiposproduto.dart';
import 'package:flutter/material.dart';
import 'package:comanda_full/widget/bnb_adm.dart';

class AdmTiposProdutoPage extends StatefulWidget {
  const AdmTiposProdutoPage({super.key});

  @override
  State<AdmTiposProdutoPage> createState() => AdmTiposProdutoPageState();
}

class AdmTiposProdutoPageState extends State<AdmTiposProdutoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipos de Produto'),
        actions: [],
      ),
      bottomNavigationBar: bnbAdm(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return FractionallySizedBox(
                  heightFactor: 0.5,
                  child: SingleChildScrollView(child: bsTiposProduto(context)));
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              cardTiposProduto(context, 'Bebidas', null),
              cardTiposProduto(context, 'Entradas', null),
              cardTiposProduto(context, 'Principal', null),
              cardTiposProduto(context, 'Porcao', null),
            ],
          ),
        ),
      ),
    );
  }
}
