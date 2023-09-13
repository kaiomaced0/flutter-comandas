import 'package:flutter/material.dart';

Future bsRemoverPagamento(BuildContext context, int pagamento) {
  return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Center(
              child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Certeza que deseja cancelar esse Pagamento?'),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Porque deseja Cancelar?'),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                    maxLines: null,
                    autofocus: true,
                    decoration: InputDecoration(hintMaxLines: 3)),
              ),
              SizedBox(
                width: 250,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: Theme.of(context).colorScheme.error,
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
                          child: Text('Excluir',
                              maxLines: 1,
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
            ],
          )),
        ));
      });
}
