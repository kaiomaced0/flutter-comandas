import 'package:comanda_full/data/model/produto.dart';
import 'package:flutter/material.dart';

Future bsProduto(BuildContext context, Produto? p) {
  TextEditingController nome = TextEditingController();
  TextEditingController descricao = TextEditingController();
  TextEditingController custo = TextEditingController();
  TextEditingController valor = TextEditingController();
  TextEditingController tipoproduto = TextEditingController();
  TextEditingController estoque = TextEditingController();
  if (p != null) {
    nome = TextEditingController(text: p.nome);
    descricao = TextEditingController(text: p.descricao);
    custo = TextEditingController(text: p.custo.toString());
    valor = TextEditingController(text: p.valor.toString());
    tipoproduto = TextEditingController(text: p.tipoProduto.toString());
    estoque = TextEditingController(text: p.estoque.toString());
  }
  return showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 1,
          child: SingleChildScrollView(
              child: SizedBox(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 1.2, 10, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Nome do Produto: ',
                              textAlign: TextAlign.start),
                          TextField(
                              onTap: () {},
                              controller: nome,
                              autofocus: true,
                              decoration:
                                  const InputDecoration(hintMaxLines: 1)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Descrição do Produto: ',
                              textAlign: TextAlign.start),
                          TextField(
                              onTap: () {},
                              controller: descricao,
                              maxLines: null,
                              autofocus: true,
                              decoration:
                                  const InputDecoration(hintMaxLines: 1)),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Preço Custo: ',
                                  textAlign: TextAlign.start,
                                ),
                                TextField(
                                  onTap: () {},
                                  controller: custo,
                                  autofocus: true,
                                  decoration:
                                      const InputDecoration(hintMaxLines: 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                            child: SizedBox(
                              width: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Preço Venda: '),
                                  TextField(
                                    onTap: () {},
                                    controller: valor,
                                    autofocus: true,
                                    decoration:
                                        const InputDecoration(hintMaxLines: 1),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 1, 20, 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Tipo Produto: ',
                              textAlign: TextAlign.start),
                          TextField(
                            onTap: () {},
                            controller: tipoproduto,
                            autofocus: true,
                            decoration: const InputDecoration(hintMaxLines: 1),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 1, 20, 5),
                      child: SizedBox(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Estoque: '),
                            TextField(
                              onTap: () {},
                              controller: estoque,
                              autofocus: false,
                              decoration:
                                  const InputDecoration(hintMaxLines: 1),
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
