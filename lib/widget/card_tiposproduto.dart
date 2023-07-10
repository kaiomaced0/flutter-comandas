import 'package:comanda_full/widget/bs_tiposproduto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Widget cardTiposProduto(BuildContext context, String? title, Color? color) {
  color ??= const Color(0xFFF0E5F3);
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
            backgroundColor: Theme.of(context).primaryColor,
          ),
          SlidableAction(
            label: 'Inativar',
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.circular(10),
            onPressed: (context) {},
            icon: Icons.block,
            backgroundColor: Colors.red.shade900,
          )
        ],
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          width: double.infinity,
          height: 60,
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
                '$title',
                style: const TextStyle(fontSize: 20),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
