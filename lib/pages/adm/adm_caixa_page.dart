import 'package:flutter/material.dart';
import 'package:comanda_full/widget/bnb_adm.dart';

class AdmCaixaPage extends StatefulWidget {
  const AdmCaixaPage({super.key});

  @override
  State<AdmCaixaPage> createState() => AdmCaixaPageState();
}

class AdmCaixaPageState extends State<AdmCaixaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caixa'),
        actions: [],
      ),
      bottomNavigationBar: bnbAdm(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
