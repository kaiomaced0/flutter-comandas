import 'dart:ui';

import 'package:flutter/material.dart';

Padding cardProduto() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(4, 3, 4, 1),
    child: Container(
      color: Color(0xFFD8E3FF),
      width: double.infinity,
      height: 63,
      child: const Padding(
        padding: EdgeInsets.fromLTRB(0, 2, 4, 1),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 4, 8),
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
          Column(
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
          )
        ]),
      ),
    ),
  );
}
