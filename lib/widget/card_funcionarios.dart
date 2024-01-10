// ignore_for_file: prefer_const_constructors

import 'package:comanda_full/data/model/usuario.dart';
import 'package:comanda_full/widget/bs_add_funcionarios.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:flutter/material.dart';

Widget cardFuncionario(BuildContext context, Usuario u) {
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
              bsFuncionario(context, u);
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
        color: const Color.fromARGB(255, 255, 216, 216),
        width: double.infinity,
        height: 80,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 2, 4, 1),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 2, 8),
                  child: Text(
                    u.nome,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                      style: TextStyle(fontSize: 12), maxLines: 2, u.login),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 2, 0, 0),
                  child: Chip(
                      autofocus: true,
                      label: Text(
                        u.perfil.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      )),
                ),
                Text(
                  u.cpf,
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
