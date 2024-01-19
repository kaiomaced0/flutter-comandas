import 'package:comanda_full/data/model/caixa.dart';
import 'package:comanda_full/pages/caixas/wodgets/caixa_change.dart';
import 'package:flutter/material.dart';
import 'package:comanda_full/widget/bnb_adm.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AdmCaixaPage extends StatefulWidget {
  const AdmCaixaPage({super.key});

  @override
  State<AdmCaixaPage> createState() => AdmCaixaPageState();
}

class AdmCaixaPageState extends State<AdmCaixaPage> {
  late Caixa? caixa;
  late Future<List<Caixa>> caixas;
  @override
  void initState() {
    caixas = Caixa.fetchCaixas();
    super.initState();
  }

  Future<void> _atualizarDados() async {
    await Future.delayed(Duration(milliseconds: 500));

    setState(() {
      caixas = Caixa.fetchCaixas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caixa'),
        actions: [],
      ),
      bottomNavigationBar: bnbAdm(context, null),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              showDragHandle: true,
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return FractionallySizedBox(
                    heightFactor: 0.85, child: CaixaChange());
              });
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          RefreshIndicator(
            onRefresh: _atualizarDados,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: FutureBuilder<List<Caixa>>(
                  future: caixas,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      print('carregando...');
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      print('erro conexao');
                      return Center(child: Text('Erro: ${snapshot.error}'));
                    } else {
                      print('fetch ok! ');
                      final caixalist = snapshot.data!;

                      return Scrollbar(
                        interactive: true,
                        thickness: 10,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0.5, 1, 0.5, 4),
                                child: Slidable(
                                  endActionPane: ActionPane(
                                    motion: const StretchMotion(),
                                    children: caixalist[index].fechado!
                                        ? [
                                            SlidableAction(
                                              label: 'Fechado',
                                              padding: EdgeInsets.zero,
                                              onPressed: (context) {},
                                              icon: Icons.lock_outline,
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .surfaceTint,
                                            )
                                          ]
                                        : [
                                            SlidableAction(
                                              label: 'Fechar',
                                              padding: EdgeInsets.zero,
                                              onPressed: (context) {},
                                              icon: Icons.lock_open_sharp,
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .surfaceTint,
                                            ),
                                            SlidableAction(
                                              label: 'Fechar',
                                              padding: EdgeInsets.zero,
                                              onPressed: (context) {},
                                              icon: Icons.lock_open_sharp,
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .surfaceTint,
                                            ),
                                          ],
                                  ),
                                  child: Container(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outlineVariant,
                                    height: 70,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 10, 10),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 7,
                                            child: Column(children: [
                                              Text(
                                                caixalist[index].nome,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                caixalist[index].comentario ??
                                                    '',
                                                style: TextStyle(fontSize: 16),
                                              )
                                            ]),
                                          ),
                                          Flexible(
                                              flex: 3,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const Text('Valor Total:'),
                                                  Text(
                                                      'R\$ ${caixalist[index].valorTotal.toString()}')
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: caixalist.length),
                      );
                    }
                  }),
            ),
          )
        ],
      )),
    );
  }
}
