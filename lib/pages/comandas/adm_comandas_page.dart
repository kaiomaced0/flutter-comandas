import 'package:comanda_full/widget/bs_add_comanda.dart';
import 'package:comanda_full/widget/card_comandas.dart';
import 'package:flutter/material.dart';
import 'package:comanda_full/widget/bnb_adm.dart';

class AdmComandasPage extends StatefulWidget {
  const AdmComandasPage({super.key});

  @override
  State<AdmComandasPage> createState() => AdmComandasPageState();
}

class AdmComandasPageState extends State<AdmComandasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comandas'),
        actions: [],
      ),
      bottomNavigationBar: bnbAdm(context, 0),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              showDragHandle: true,
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return FractionallySizedBox(
                    heightFactor: 0.63,
                    child: SingleChildScrollView(child: bsComanda(context)));
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      child: cardComanda(context, 'Mesa 1'),
                      onTap: () {
                        mudarTelaAdm(9, context);
                      },
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      child: cardComanda(context, 'Mesa 2'),
                      onTap: () {},
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
                      child: cardComanda(context, 'Mesa 3'),
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                      child: cardComanda(context, 'Mesa 4'),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
