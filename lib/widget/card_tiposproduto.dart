import 'package:comanda_full/data/model/tipoproduto.dart';
import 'package:comanda_full/widget/bs_tiposproduto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Widget cardTiposProduto(BuildContext context, TipoProduto tipoProduto) {
  tipoProduto.cor = '0xff123456';
  return Container(
    height: 90,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(4, 5, 4, 5),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              label: 'Editar',
              padding: EdgeInsets.zero,
              borderRadius: BorderRadius.circular(10),
              onPressed: (context) {
                bsTiposProduto(context);
              },
              icon: Icons.edit,
              backgroundColor: Theme.of(context).colorScheme.surfaceTint,
            ),
            SlidableAction(
              label: 'Inativar',
              padding: EdgeInsets.zero,
              borderRadius: BorderRadius.circular(10),
              onPressed: (context) {},
              icon: Icons.block,
              backgroundColor: Theme.of(context).colorScheme.error,
            )
          ],
        ),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            width: double.infinity,
            height: 80,
            decoration: ShapeDecoration(
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 1,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tipoProduto.nome,
                  style: const TextStyle(fontSize: 20),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Color hexToColor(String hexString) {
  hexString = hexString.toUpperCase().replaceAll("#", "");
  if (hexString.length == 6) {
    hexString = "FF" + hexString;
  }
  return Color(int.parse(hexString, radix: 16));
}
