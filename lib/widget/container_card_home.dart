import 'package:flutter/material.dart';

Widget cardHome(BuildContext context, String? title) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        width: 148,
        height: 96,
        decoration: ShapeDecoration(
          color: const Color(0xFFF0E5F3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
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
