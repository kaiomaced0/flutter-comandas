// ignore_for_file: prefer_const_constructors

import 'package:comanda_full/data/model/pedido.dart';
import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

Widget cardPedido(BuildContext context, Pedido? pedido) {
  return GestureDetector(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(2, 3, 2, 3),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              padding: EdgeInsets.zero,
              borderRadius: BorderRadius.circular(10),
              label: "Pronto",
              onPressed: (context) {},
              backgroundColor: Colors.blueGrey,
            ),
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              padding: EdgeInsets.zero,
              label: "Preparando",
              onPressed: (context) {},
              backgroundColor: Colors.red.shade900,
            )
          ],
        ),
        child: Center(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              decoration: ShapeDecoration(
                color: const Color(0xFFF0E5F3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 3,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Chip(
                              backgroundColor: Colors.white,
                              label: Text(
                                pedido!.status ?? '',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )),
                          Text(
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12,
                                  color: Colors.black),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              pedido!.observacao ?? ''),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ListView.builder(
                                      itemCount: pedido!.itemCompra.length ?? 0,
                                      itemBuilder: (context, index) {
                                        return Text(
                                          '${pedido.itemCompra[index].quantidade}x  ${pedido.itemCompra[index].produto.nome}',
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  'R\$ ${pedido!.valor.toString() ?? '0,00'}',
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
