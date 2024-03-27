import 'package:comanda_full/data/model/comanda.dart';
import 'package:comanda_full/widget/card_pedido.dart';
import 'package:comanda_full/widget/bs_add_pagamento.dart';
import 'package:comanda_full/widget/add_pedido.dart';
import 'package:flutter/material.dart';

class AdmComandasDetailPage extends StatefulWidget {
  late Comanda? comanda;
  AdmComandasDetailPage({super.key, required this.comanda});

  @override
  State<AdmComandasDetailPage> createState() => AdmComandasDetailPageState();
}

class AdmComandasDetailPageState extends State<AdmComandasDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos da Comanda'),
        actions: const [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListView.builder(
                itemCount: widget.comanda!.pedidos.length,
                itemBuilder: (context, index) {
                  return cardPedido(context, widget.comanda!.pedidos[index]);
                },
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: SizedBox(
                        width: 250,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          width: double.infinity,
                          decoration: ShapeDecoration(
                            color: Theme.of(context).colorScheme.surfaceTint,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: const Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                              child: Text('Realizar Pagamento',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.justify),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    bsPagamento(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
