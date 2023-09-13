import 'package:flutter/material.dart';

Future bsProdutoEstoque(BuildContext context) {
  return showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.6,
          child: SingleChildScrollView(
              child: SizedBox(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 1.2, 10, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Estoque atual: ', textAlign: TextAlign.start),
                          TextField(
                              controller: TextEditingController(text: '23'),
                              readOnly: true,
                              autofocus: true,
                              enabled: false,
                              decoration: const InputDecoration(hintMaxLines: 1)),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 1, 20, 5),
                      child: SizedBox(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Valor: '),
                            TextField(
                              keyboardType: TextInputType.number,                             
                              autofocus: false,
                              decoration: InputDecoration(hintMaxLines: 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: SizedBox(
                                  width: 120,
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    width: double.infinity,
                                    decoration: ShapeDecoration(
                                      color:
                                          Colors.green.shade900,
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
                                    child: const Row(
                                      children: [
                                        Align(
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
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),

                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: SizedBox(
                                  width: 120,
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    width: double.infinity,
                                    decoration: ShapeDecoration(
                                      color:
                                          Theme.of(context).colorScheme.error,
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
                                    child: const Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                                            child: Text('Remover',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
        );
      });
}
