import 'package:comanda_full/widget/bs_add_produto.dart';
import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

Padding cardProduto(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(4, 3, 4, 1),
    child: Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            label: 'Editar',
            padding: EdgeInsets.zero,
            onPressed: (context) {
              bsProduto(context);
            },
            icon: Icons.edit,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          SlidableAction(
            label: 'Inativar',
            padding: EdgeInsets.zero,
            onPressed: (context) {},
            icon: Icons.block,
            backgroundColor: Colors.red.shade900,
          )
        ],
      ),
      child: Container(
        color: const Color(0xFFD8E3FF),
        width: double.infinity,
        height: 63,
        child: const Padding(
          padding: EdgeInsets.fromLTRB(0, 2, 4, 1),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(2, 0, 4, 8),
                    child: Text(
                      'Nome do Produto',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                    child: Text(
                        style: TextStyle(fontSize: 10),
                        maxLines: 2,
                        ' Descricao do produto..............................\n...................................................'),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 2, 0, 0),
                    child: Chip(
                        label: Text(
                      'TipoProduto',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    )),
                  ),
                  Text(
                    'R\$ 100,00',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    ),
  );
}
