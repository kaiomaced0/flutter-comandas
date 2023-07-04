import 'dart:ui';

import 'package:flutter/material.dart';

Padding cardFuncionario() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(4, 3, 4, 1),
    child: Container(
      color: Color.fromARGB(255, 255, 216, 216),
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
                child: Text(
                  'Nome Funcionario',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                    style: TextStyle(fontSize: 12),
                    maxLines: 2,
                    'Login do usuario'),
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
