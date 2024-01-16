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
          color: Theme.of(context).colorScheme.inversePrimary,
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
            Flexible(
              child: Text(
                '$title',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
