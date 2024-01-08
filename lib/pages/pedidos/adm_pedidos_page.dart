import 'package:comanda_full/widget/add_pedido.dart';
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
      bottomNavigationBar: bnbAdm(context, 0),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddPedido(
                comanda: null,
                pedido: null,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    filtroPedido(context),
                  ],
                ),
                cardPedidos(context),
                cardPedidos(context),
                cardPedidos(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
