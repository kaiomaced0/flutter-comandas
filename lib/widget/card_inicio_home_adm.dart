import 'package:flutter/material.dart';

Container cardInicioHomeAdm() {
  return Container(
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 155,
            height: 64,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.50, color: Color(0xFFC1C1C1)),
                borderRadius: BorderRadius.circular(13),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 10,
                  spreadRadius: 0,
                )
              ],
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 64,
                    child: const Column(
                      children: [
                        SizedBox(
                          width: 65,
                          height: 30,
                          child: Text(
                            'Comandas \n em Aberto',
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontFamily: 'Concert One',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          height: 23,
                          child: Text(
                            '8',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontFamily: 'Concert One',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 64,
                    child: const Column(
                      children: [
                        SizedBox(
                          width: 65,
                          height: 30,
                          child: Text(
                            'Comandas\n Fechadas',
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontFamily: 'Concert One',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 65,
                          height: 23,
                          child: Text(
                            '8',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 14,
                              fontFamily: 'Concert One',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 155,
            height: 64,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.50, color: Color(0xFFC1C1C1)),
                borderRadius: BorderRadius.circular(13),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 10,
                  spreadRadius: 0,
                )
              ],
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 64,
                    child: const Column(
                      children: [
                        SizedBox(
                          width: 68,
                          height: 30,
                          child: Text(
                            'Pedidos \n em Processo',
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontFamily: 'Concert One',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 65,
                          height: 23,
                          child: Text(
                            '8',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontFamily: 'Concert One',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 64,
                    child: const Column(
                      children: [
                        SizedBox(
                          width: 70,
                          height: 30,
                          child: Text(
                            'Pedidos\n Realizados',
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontFamily: 'Concert One',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          height: 23,
                          child: Text(
                            '8',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 14,
                              fontFamily: 'Concert One',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
