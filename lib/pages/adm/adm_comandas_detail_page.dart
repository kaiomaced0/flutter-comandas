import 'package:comanda_full/widget/bs_add_comanda.dart';
import 'package:comanda_full/widget/container_card_home.dart';
import 'package:flutter/material.dart';
import 'package:comanda_full/widget/bnb_adm.dart';

class AdmComandasDetailPage extends StatefulWidget {
  const AdmComandasDetailPage({super.key});

  @override
  State<AdmComandasDetailPage> createState() => AdmComandasDetailPageState();
}

class AdmComandasDetailPageState extends State<AdmComandasDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comanda'),
        actions: [],
      ),
      bottomNavigationBar: bnbAdm(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return bsComanda(context);
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: cardHome(context, 'Mesa 1'),
                  onTap: () {
                    mudarTelaAdm(6, context);
                  },
                ),
                GestureDetector(
                  child: cardHome(context, 'Mesa 2'),
                  onTap: () {
                    mudarTelaAdm(6, context);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: cardHome(context, 'Mesa 3'),
                  onTap: () {
                    mudarTelaAdm(6, context);
                  },
                ),
                GestureDetector(
                  child: cardHome(context, 'Mesa 4'),
                  onTap: () {
                    mudarTelaAdm(6, context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
