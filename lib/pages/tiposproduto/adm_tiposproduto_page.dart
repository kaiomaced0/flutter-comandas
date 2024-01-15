import 'package:comanda_full/data/model/tipoproduto.dart';
import 'package:comanda_full/widget/bs_tiposproduto.dart';
import 'package:comanda_full/widget/card_tiposproduto.dart';
import 'package:flutter/material.dart';
import 'package:comanda_full/widget/bnb_adm.dart';

class AdmTiposProdutoPage extends StatefulWidget {
  late Future<List<TipoProduto>> tipoProdutos;
  AdmTiposProdutoPage({super.key, required this.tipoProdutos});

  @override
  State<AdmTiposProdutoPage> createState() => AdmTiposProdutoPageState();
}

class AdmTiposProdutoPageState extends State<AdmTiposProdutoPage> {
  @override
  void initState() {
    widget.tipoProdutos = TipoProduto.fetchTipoProdutos();
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
        child: Center(
          child: Column(
            children: [
              FutureBuilder<List<TipoProduto>>(
                future: widget.tipoProdutos,
                builder: (context, snapshot) {
                  return ListView.builder(
                      itemBuilder: (context, index) {
                        cardTiposProduto(context, snapshot.data![index]);
                      },
                      itemCount: snapshot.data!.length);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
