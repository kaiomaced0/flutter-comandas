import 'package:flutter/material.dart';

Padding cardPagamento() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(2, 3, 2, 1),
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
                      'Tipo Acesso',
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
  );
}
