import 'package:comanda_full/pages/adm/adm_caixa_page.dart';
import 'package:comanda_full/pages/adm/adm_comandas_detail_page.dart';
import 'package:comanda_full/pages/adm/adm_comandas_page.dart';
import 'package:comanda_full/pages/adm/adm_funcionarios_page.dart';
import 'package:comanda_full/pages/adm/adm_pagamentos_page.dart';
import 'package:comanda_full/pages/adm/adm_pedidos_page.dart';
import 'package:comanda_full/pages/adm/adm_produtos_page.dart';
import 'package:comanda_full/pages/adm/adm_relatorios_page.dart';
import 'package:comanda_full/pages/adm/adm_tiposproduto_page.dart';
import 'package:comanda_full/pages/adm/home/adm_home_page.dart';
import 'package:flutter/material.dart';
import 'src/shared/themes/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      title: 'App Widget',
      theme: lightTheme,
      darkTheme: darkTheme,
      routes: {
        '/': (context) => const AdmHomePage(),
        '/produtos': (context) => const AdmProdutoPage(),
        '/relatorios': (context) => const AdmRelatorioPage(),
        '/caixa': (context) => const AdmCaixaPage(),
        '/comandas': (context) => const AdmComandasPage(),
        '/comandas/detail': (context) => const AdmComandasDetailPage(),
        '/funcionarios': (context) => const AdmFuncionariosPage(),
        '/pagamentos': (context) => const AdmPagamentosPage(),
        '/pedidos': (context) => const AdmPedidosPage(),
        '/tiposproduto': (context) => const AdmTiposProdutoPage(),
      },
    );
  }
}
