import 'package:comanda_full/data/model/tipoproduto.dart';
import 'package:comanda_full/src/shared/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class TiposProdutoChange extends StatefulWidget {
  late TipoProduto? tipoProduto;
  TiposProdutoChange({super.key, this.tipoProduto});

  @override
  State<TiposProdutoChange> createState() => _TiposProdutoChangeState();
}

class _TiposProdutoChangeState extends State<TiposProdutoChange> {
  Color corEscolhida = const Color.fromARGB(255, 32, 141, 88);
  TextEditingController nome = TextEditingController();

  @override
  void initState() {
    if (widget.tipoProduto != null) {
      corEscolhida = hexToColor(widget.tipoProduto!.cor!);
      nome = TextEditingController(text: widget.tipoProduto!.nome);
    }
    super.initState();
  }

  void changeColor(Color color) {
    setState(() {
      corEscolhida = color;
    });
  }

  void _showOverlay(BuildContext context, Color cor) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: cor,
              onColorChanged: changeColor,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Pronto!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 1.2, 0, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Nome do Tipo de Produto: ',
                          textAlign: TextAlign.start, maxLines: 1),
                      TextField(
                        onTap: () {
                          setState(() {});
                        },
                        controller: nome,
                        autofocus: true,
                        decoration: const InputDecoration(hintMaxLines: 1),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Escolha a cor:    ',
                              textAlign: TextAlign.start, maxLines: 1),
                          GestureDetector(
                            onTap: () {
                              _showOverlay(context, corEscolhida);
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: corEscolhida,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.colorize,
                                    size: 50,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
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
                      if (widget.tipoProduto == null) {
                        nome.text.isEmpty
                            ? ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                backgroundColor:
                                    Color.fromARGB(255, 104, 14, 14),
                                duration: Duration(milliseconds: 900),
                                content: Text(
                                    'Informe o nome do Tipo de Produto',
                                    style: TextStyle(color: Colors.white)),
                              ))
                            : {
                                TipoProduto.inserirTipoProduto(TipoProduto(
                                  nome: nome.text,
                                  cor: colorToHexa(corEscolhida),
                                )),
                                Navigator.of(context).pop(),
                                Navigator.of(context).pop(),
                                Navigator.of(context).pushNamed('/tiposproduto')
                              };
                      } else {
                        nome.text.isEmpty
                            ? ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                backgroundColor:
                                    Color.fromARGB(255, 104, 14, 14),
                                duration: Duration(milliseconds: 900),
                                content: Text(
                                    'Informe o nome do Tipo de Produto',
                                    style: TextStyle(color: Colors.white)),
                              ))
                            : {
                                TipoProduto.inserirTipoProduto(TipoProduto(
                                    nome: nome.text,
                                    cor: colorToHexa(corEscolhida),
                                    id: widget.tipoProduto!.id)),
                                Navigator.of(context).pop(),
                                Navigator.of(context).pop(),
                                Navigator.of(context).pushNamed('/tiposproduto')
                              };
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
