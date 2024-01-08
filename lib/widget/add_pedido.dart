import 'package:comanda_full/data/model/comanda.dart';
import 'package:comanda_full/data/model/pedido.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:comanda_full/widget/itemcompra_pedido.dart';

class AddPedido extends StatefulWidget {
  late Pedido? pedido;
  late Comanda? comanda;
  AddPedido({super.key, required this.comanda, required this.pedido});

  @override
  State<AddPedido> createState() => _AddPedidoState();
}

class _AddPedidoState extends State<AddPedido> {
  TextEditingController mesa = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pedido')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 15),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 1.2, 0, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Qual a mesa: ', textAlign: TextAlign.start),
                      widget.comanda != null
                          ? TextField(
                              controller: TextEditingController(
                                  text: widget.comanda!.nome!),
                              autofocus: false,
                              decoration:
                                  const InputDecoration(hintMaxLines: 1))
                          : TextField(
                              controller: mesa,
                              autofocus: true,
                              decoration:
                                  const InputDecoration(hintMaxLines: 1)),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Produto: ',
                              maxLines: 1,
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
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Quant: ', maxLines: 1),
                            TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              autofocus: true,
                              decoration:
                                  const InputDecoration(hintMaxLines: 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 40,
                                decoration: ShapeDecoration(
                                  color:
                                      const Color.fromARGB(255, 194, 172, 239),
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
                                child: Icon(Icons.add),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Column(
                //     children: [itemCompraPedido()],
                //   ),
                // ),
                const Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 20, 10),
                    child: Text(
                      'R\$ 40,00',
                      maxLines: 1,
                      style: TextStyle(
                          fontFamily: 'Roboto', fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                  )
                ]),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 1, 20, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Observacao: ', textAlign: TextAlign.start),
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
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
