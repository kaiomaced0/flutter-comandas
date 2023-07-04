import 'package:flutter/material.dart';
import 'package:comanda_full/widget/bnb_adm.dart';

class AdmRelatorioPage extends StatefulWidget {
  const AdmRelatorioPage({super.key});

  @override
  State<AdmRelatorioPage> createState() => AdmRelatorioPageState();
}

class AdmRelatorioPageState extends State<AdmRelatorioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Relatórios'),
          actions: [],
        ),
      bottomNavigationBar: bnbAdm(context),
    );
  }
}
