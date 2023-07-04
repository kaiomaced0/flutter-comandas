import 'package:flutter/material.dart';

Padding filtroPedido(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 1, 8, 8),
    child: ElevatedButton(
        onPressed: () {},
        child: TextButton.icon(
          autofocus: false,
          onPressed: () {},
          label: const Text('Todos',
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                color: Colors.black,
              )),
          icon: const Icon(Icons.arrow_drop_down),
        )),
  );
}
