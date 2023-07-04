import 'package:flutter/material.dart';

Widget bsTiposProduto(BuildContext context) {
  return SizedBox(
    height: 220,
    width: double.infinity,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 1.2, 0, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nome do Tipo de Produto: ', textAlign: TextAlign.start),
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(hintMaxLines: 1),
                  ),
                ],
              ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: SizedBox(
                      width: 250,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: double.infinity,
                        decoration: ShapeDecoration(
                          color: Theme.of(context).colorScheme.surfaceTint,
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
                        child: const Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                            child: Text('Adicionar',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.justify),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
    ),
  );
}
