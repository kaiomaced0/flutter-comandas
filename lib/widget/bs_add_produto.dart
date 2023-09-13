import 'package:flutter/material.dart';

Future bsProduto(BuildContext context) {
  return showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: SingleChildScrollView(
              child: SizedBox(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 1.2, 10, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nome do Produto: ', textAlign: TextAlign.start),
                          TextField(
                              autofocus: true,
                              decoration: InputDecoration(hintMaxLines: 1)),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Descrição do Produto: ',
                              textAlign: TextAlign.start),
                          TextField(
                              maxLines: null,
                              autofocus: true,
                              decoration: InputDecoration(hintMaxLines: 1)),
                        ],
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Preço Custo: ',
                                  textAlign: TextAlign.start,
                                ),
                                TextField(
                                  autofocus: true,
                                  decoration: InputDecoration(hintMaxLines: 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                            child: SizedBox(
                              width: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Preço Venda: '),
                                  TextField(
                                    autofocus: true,
                                    decoration: InputDecoration(hintMaxLines: 1),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 1, 20, 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tipo Produto: ', textAlign: TextAlign.start),
                          TextField(
                            autofocus: true,
                            decoration: InputDecoration(hintMaxLines: 1),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 1, 20, 5),
                      child: SizedBox(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Estoque: '),
                            TextField(
                              autofocus: false,
                              decoration: InputDecoration(hintMaxLines: 1),
                            ),
                          ],
                        ),
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
                                  color:
                                      Theme.of(context).colorScheme.surfaceTint,
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
          )),
        );
      });
}
