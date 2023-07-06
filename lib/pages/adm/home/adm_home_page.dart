import 'package:comanda_full/widget/card_inicio_home_adm.dart';
import 'package:comanda_full/widget/container_card_home.dart';
import 'package:flutter/material.dart';
import 'package:comanda_full/widget/bnb_adm.dart';

class AdmHomePage extends StatefulWidget {
  const AdmHomePage({super.key});

  @override
  State<AdmHomePage> createState() => _AdmHomePageState();
}

class _AdmHomePageState extends State<AdmHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Comandas Full'),
          actions: const [],
        ),
        bottomNavigationBar: bnbAdm(context),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Text('   Caixa Atual:'),
                cardInicioHomeAdm(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: GestureDetector(
                        child: cardHome(context, 'Comandas'),
                        onTap: () {
                          mudarTelaAdm(3, context);
                        },
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: GestureDetector(
                        child: cardHome(context, 'Produtos'),
                        onTap: () {
                          mudarTelaAdm(1, context);
                        },
                      ),
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      child: cardHome(context, 'Pedidos'),
                      onTap: () {
                        mudarTelaAdm(4, context);
                      },
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      child: cardHome(context, 'Funcionarios'),
                      onTap: () {
                        mudarTelaAdm(5, context);
                      },
                    ),
                  ),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: GestureDetector(
                        child: cardHome(context, 'Pagamentos'),
                        onTap: () {
                          mudarTelaAdm(6, context);
                        },
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: GestureDetector(
                        child: cardHome(context, 'Relatórios'),
                        onTap: () {
                          mudarTelaAdm(2, context);
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: GestureDetector(
                        child: cardHome(context, 'Tipos de \n Produto'),
                        onTap: () {
                          mudarTelaAdm(7, context);
                        },
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: GestureDetector(
                        child: cardHome(context, 'Caixa'),
                        onTap: () {
                          mudarTelaAdm(8, context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
