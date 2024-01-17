import 'package:comanda_full/data/model/produto.dart';
import 'package:flutter/material.dart';

class ProdutoChange extends StatefulWidget {
  late Produto? produto;
  ProdutoChange({super.key, this.produto});

  @override
  State<ProdutoChange> createState() => _ProdutoChangeState();
}

class _ProdutoChangeState extends State<ProdutoChange> {
  TextEditingController nome = TextEditingController();
  TextEditingController descricao = TextEditingController();
  TextEditingController custo = TextEditingController();
  TextEditingController valor = TextEditingController();
  TextEditingController tipoproduto = TextEditingController();
  TextEditingController estoque = TextEditingController();
  @override
  void initState() {
    if (widget.produto != null) {
      nome = TextEditingController(text: widget.produto!.nome);
      descricao = TextEditingController(text: widget.produto!.descricao);
      custo = TextEditingController(text: widget.produto!.custo.toString());
      valor = TextEditingController(text: widget.produto!.valor.toString());
      tipoproduto =
          TextEditingController(text: widget.produto!.tipoProduto.toString());
      estoque = TextEditingController(text: widget.produto!.estoque.toString());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: SizedBox(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 1.2, 10, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Nome do Produto: ', textAlign: TextAlign.start),
                    TextField(
                        onTap: () {
                          setState(() {
                            widget.produto!.nome = nome.text;
                          });
                        },
                        controller: nome,
                        autofocus: true,
                        decoration: const InputDecoration(hintMaxLines: 1)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Descrição do Produto: ',
                        textAlign: TextAlign.start),
                    TextField(
                        onTap: () {
                          setState(() {
                            widget.produto!.descricao = descricao.text;
                          });
                        },
                        controller: descricao,
                        maxLines: null,
                        autofocus: true,
                        decoration: const InputDecoration(hintMaxLines: 1)),
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
                      padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Preço Custo: ',
                            textAlign: TextAlign.start,
                          ),
                          TextField(
                            onTap: () {
                              setState(() {
                                widget.produto!.custo =
                                    double.tryParse(custo.text) ?? 0.0;
                              });
                            },
                            controller: custo,
                            autofocus: true,
                            decoration: const InputDecoration(hintMaxLines: 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 20, 5),
                      child: SizedBox(
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Preço Venda: '),
                            TextField(
                              onTap: () {
                                setState(() {
                                  widget.produto!.valor =
                                      double.tryParse(valor.text) ?? 0.0;
                                });
                              },
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
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Tipo Produto: ', textAlign: TextAlign.start),
                    TextField(
                      onTap: () {
                        setState(() {
                          widget.produto!.tipoProduto =
                              int.tryParse(tipoproduto.text) ?? 1;
                        });
                      },
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
                  width: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Estoque: '),
                      TextField(
                        textAlign: TextAlign.center,
                        onTap: () {
                          setState(() {
                            widget.produto!.estoque =
                                int.tryParse(estoque.text) ?? 0;
                          });
                        },
                        controller: estoque,
                        autofocus: false,
                        decoration: const InputDecoration(hintMaxLines: 1),
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
                    print(widget.produto);
                    nome.text.isEmpty &&
                            descricao.text.isEmpty &&
                            valor.text.isEmpty &&
                            estoque.text.isEmpty
                        ? ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                            backgroundColor: Color.fromARGB(255, 104, 14, 14),
                            duration: Duration(milliseconds: 900),
                            content: Text('Informe os dados do Produto!',
                                style: TextStyle(color: Colors.white)),
                          ))
                        : {
                            Produto.inserirProduto(Produto(
                                id: widget.produto!.id ?? null,
                                nome: nome.text,
                                descricao: descricao.text,
                                valor: double.tryParse(valor.text) ?? 0.0,
                                custo: double.tryParse(custo.text) ?? 0.0,
                                tipoProduto:
                                    int.tryParse(tipoproduto.text) ?? 1,
                                estoque: int.tryParse(estoque.text) ?? 0,
                                linkimage:
                                    'https://firebasestorage.googleapis.com/v0/b/teste-8ed63.appspot.com/o/hamburguerdefault.png?alt=media&token=95d84ca1-0a80-4e3e-a771-6697808f85f4')),
                            Navigator.of(context).pop()
                          };
                  },
                ),
              )
            ],
          ),
        ),
      ),
    )));
  }
}
