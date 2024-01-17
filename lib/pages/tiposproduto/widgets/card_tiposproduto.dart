import 'package:comanda_full/data/model/tipoproduto.dart';
import 'package:comanda_full/pages/tiposproduto/widgets/tiposproduto_chanche.dart';
import 'package:comanda_full/src/shared/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Widget cardTiposProduto(BuildContext context, TipoProduto tipoProduto) {
  Color color = hexToColor(tipoProduto.cor!);

  return SizedBox(
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
                TiposProdutoChange(
                  tipoProduto: tipoProduto,
                );
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
              color: color,
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
                  style: const TextStyle(
                      shadows: [
                        Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 10.0,
                            color: Colors.black)
                      ],
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
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
