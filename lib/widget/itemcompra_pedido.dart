import 'package:flutter/material.dart';

Widget itemCompraPedido() {
  const String nome = 'aa';
  const int quantidade = 5;
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '$quantidade x  $nome ',
        maxLines: 1,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
