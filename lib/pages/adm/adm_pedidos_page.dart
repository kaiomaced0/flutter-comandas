import 'package:comanda_full/widget/bs_add_pedido.dart';
import 'package:comanda_full/widget/button_filter_pedidos.dart';
import 'package:comanda_full/widget/card_pedidos.dart';
import 'package:flutter/material.dart';
import 'package:comanda_full/widget/bnb_adm.dart';

class AdmPedidosPage extends StatefulWidget {
  const AdmPedidosPage({super.key});

  @override
  State<AdmPedidosPage> createState() => AdmPedidosPageState();
}

class AdmPedidosPageState extends State<AdmPedidosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
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
              return FractionallySizedBox(
                  heightFactor: 0.7,
                  child: SingleChildScrollView(child: bsPedido(context)));
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                filtroPedido(context),
              ],
            ),
            cardPedidos(),
            cardPedidos(),
            cardPedidos()
          ],
        ),
      ),
    );
  }
}
