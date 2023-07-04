import 'package:flutter/material.dart';

Widget cardTiposProduto(BuildContext context, String? title, Color? color) {
  color ??= const Color(0xFFF0E5F3);
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
  );
}
