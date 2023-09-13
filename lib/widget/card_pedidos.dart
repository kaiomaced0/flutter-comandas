import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

Widget cardPedidos(BuildContext context) {
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
              icon: Icons.edit,
              backgroundColor: Colors.blueGrey,
            ),
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              padding: EdgeInsets.zero,
              label: "Preparando",
              onPressed: (context) {},
              icon: Icons.block,
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
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20, 1, 20, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Mesa 1',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              Chip(
                                  backgroundColor: Colors.white,
                                  label: Text(
                                    maxLines: 1,
                                    'Aguardando',
                                    style: TextStyle(fontSize: 12),
                                  )),
                              Text(
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                  maxLines: 2,
                                  'observacoes...............................\n................................................'),
                            ],
                          ),
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
                              Text(
                                '1x' ' Produto1',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                              Text(
                                '1x' ' Produto1',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                              Text(
                                '1x' + ' Produto1',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Text(
                                  'R\$ 40,00',
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
