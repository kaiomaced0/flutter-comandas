// ignore_for_file: prefer_const_constructors

import 'package:comanda_full/data/model/usuario.dart';
import 'package:comanda_full/pages/funcionarios/widgets/funcionario_change.dart';
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
              showModalBottomSheet(
                  showDragHandle: true,
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return FractionallySizedBox(
                        heightFactor: 0.8,
                        child: FuncionarioChange(
                          usuario: u,
                        ));
                  });
            },
            icon: Icons.edit,
            backgroundColor: Theme.of(context).colorScheme.surfaceTint,
          ),
          SlidableAction(
            label: 'Inativar',
            padding: EdgeInsets.zero,
            onPressed: (context) {},
            icon: Icons.block,
            backgroundColor: Theme.of(context).colorScheme.error,
          )
        ],
      ),
      child: Container(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        width: double.infinity,
        height: 85,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 2, 4, 1),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 2, 8),
                  child: Row(
                    children: [
                      Text('Nome: ',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.background)),
                      Text(
                        u.nome,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.background),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    children: [
                      Text('Login: ',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.background)),
                      Text(
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.background),
                          maxLines: 2,
                          u.login),
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 2, 0, 0),
                  child: Chip(
                      autofocus: true,
                      label: Text(
                        u.perfil == 1 ? 'Funcionario' : 'Gerente',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 15),
                      )),
                ),
                Row(
                  children: [
                    Text('CPF: ',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.background)),
                    Text(
                      u.cpf,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.background),
                    ),
                  ],
                ),
              ],
            )
          ]),
        ),
      ),
    ),
  );
}
