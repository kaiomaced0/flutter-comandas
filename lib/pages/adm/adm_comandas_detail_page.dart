import 'package:comanda_full/widget/bs_add_comanda.dart';
import 'package:comanda_full/widget/bs_add_pedido.dart';
import 'package:comanda_full/widget/card_pedidos.dart';
import 'package:flutter/material.dart';
import 'package:comanda_full/widget/bnb_adm.dart';

class AdmComandasDetailPage extends StatefulWidget {
  const AdmComandasDetailPage({super.key});

  @override
  State<AdmComandasDetailPage> createState() => AdmComandasDetailPageState();
}

class AdmComandasDetailPageState extends State<AdmComandasDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comanda'),
        actions: [],
      ),
      bottomNavigationBar: bnbAdm(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              showDragHandle: true,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return SingleChildScrollView(
                    child: bsPedido(context, 'Comanda Atual'));
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [cardPedidos(), cardPedidos()],
          ),
        ),
      ),
    );
  }
}
