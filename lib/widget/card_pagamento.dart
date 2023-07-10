import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Widget cardPagamento(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(2, 3, 2, 1),
    child: Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            padding: EdgeInsets.zero,
            label: "Excluir",
            onPressed: (context) {
              showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                        child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Center(
                          child: Column(
                        children: [
                          const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Certeza que deseja cancelar esse Pagamento?'),
                          ),
                          const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Porque deseja Cancelar?'),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                                maxLines: null,
                                autofocus: true,
                                decoration: InputDecoration(hintMaxLines: 3)),
                          ),
                          SizedBox(
                            width: 250,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              width: double.infinity,
                              decoration: ShapeDecoration(
                                color:
                                    Theme.of(context).colorScheme.surfaceTint,
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
                                  child: Text('Adicionar',
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
                        ],
                      )),
                    ));
                  });
            },
            icon: Icons.block,
            backgroundColor: Colors.red.shade900,
          )
        ],
      ),
      child: Container(
        color: const Color(0xFFA2E298),
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
                  padding: EdgeInsets.fromLTRB(10, 0, 4, 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Text(
                          'Nome Comanda',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'Nome UsuarioCaixa',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 5, 0),
                  child: Row(
                    children: [
                      Text(
                          style: TextStyle(fontSize: 12),
                          maxLines: 2,
                          'Caixa: caixa'),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                        child: Text(
                            style: TextStyle(fontSize: 12),
                            maxLines: 2,
                            'Usuario: usuario'),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 2, 0, 0),
                  child: Chip(
                      autofocus: true,
                      label: Text(
                        'R\$ 40,00',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      )),
                ),
                Text(
                  'CPF: 000000000-00',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            )
          ]),
        ),
      ),
    ),
  );
}
