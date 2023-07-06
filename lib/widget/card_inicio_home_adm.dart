import 'package:flutter/material.dart';

Widget cardInicioHomeAdm() {
  return SizedBox(
    height: 80,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: SizedBox(
                height: 64,
                child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFFC1C1C1)),
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 4, 1, 0),
                          child: SizedBox(
                            height: 64,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 6,
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
                                Expanded(
                                  flex: 4,
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
                      ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(1, 4, 0, 0),
                          child: SizedBox(
                            height: 64,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 6,
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
                                Expanded(
                                  flex: 4,
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
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: SizedBox(
                height: 64,
                child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFFC1C1C1)),
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 4, 1, 0),
                          child: SizedBox(
                            height: 64,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 6,
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
                                Expanded(
                                  flex: 4,
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
                      ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(1, 4, 0, 0),
                          child: SizedBox(
                            height: 64,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 6,
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
                                Expanded(
                                  flex: 4,
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
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
