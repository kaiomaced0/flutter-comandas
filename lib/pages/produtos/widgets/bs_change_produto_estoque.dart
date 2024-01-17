import 'package:comanda_full/data/model/produto.dart';
import 'package:flutter/material.dart';

class ProdutoEstoqueChange extends StatefulWidget {
  late int id;
  late int estoque;
  ProdutoEstoqueChange({super.key, required this.id, required this.estoque});

  @override
  State<ProdutoEstoqueChange> createState() => _ProdutoEstoqueChangeState();
}

class _ProdutoEstoqueChangeState extends State<ProdutoEstoqueChange> {
  TextEditingController valor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                          controller: TextEditingController(
                              text: widget.estoque.toString()),
                          readOnly: true,
                          autofocus: true,
                          enabled: false,
                          decoration: const InputDecoration(hintMaxLines: 1)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 30),
                  child: SizedBox(
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Valor: '),
                        TextField(
                          onTap: () => setState(() {}),
                          controller: valor,
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
                              width: 140,
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                width: double.infinity,
                                decoration: ShapeDecoration(
                                  color: Colors.green.shade900,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 15, 5),
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
                          valor.text.isEmpty
                              ? ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                  backgroundColor:
                                      Color.fromARGB(255, 104, 14, 14),
                                  duration: Duration(milliseconds: 900),
                                  content: Text(
                                      'Informe o valor a ser adicionado',
                                      style: TextStyle(color: Colors.white)),
                                ))
                              : {
                                  Produto.adicionarEstoqueProduto(
                                      widget.id, int.tryParse(valor.text)!),
                                  Navigator.of(context).pop(),
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    backgroundColor:
                                        Color.fromARGB(255, 14, 104, 17),
                                    duration: Duration(seconds: 1),
                                    content: Text('Estoque atualizado!',
                                        style: TextStyle(color: Colors.white)),
                                  ))
                                };
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
                              width: 140,
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
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 5, 15, 5),
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
                          valor.text.isEmpty
                              ? ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                  backgroundColor:
                                      Color.fromARGB(255, 104, 14, 14),
                                  duration: Duration(milliseconds: 900),
                                  content: Text(
                                      'Informe o valor a ser removido',
                                      style: TextStyle(color: Colors.white)),
                                ))
                              : {
                                  Produto.removerEstoqueProduto(
                                      widget.id, int.tryParse(valor.text)!),
                                  Navigator.of(context).pop(),
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    backgroundColor:
                                        Color.fromARGB(255, 14, 104, 17),
                                    duration: Duration(seconds: 1),
                                    content: Text('Estoque atualizado!',
                                        style: TextStyle(color: Colors.white)),
                                  ))
                                };
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
  }
}
