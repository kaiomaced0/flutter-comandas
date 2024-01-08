import 'package:comanda_full/data/model/pedido.dart';
import 'package:comanda_full/data/model/produto.dart';
import 'package:flutter/material.dart';

Widget itemCompraPedido() {
  return ListView.builder(
    itemBuilder: (context, index) {
      Text('nome produto  x  quantidade');
    },
    itemCount: 3,
  );
}
