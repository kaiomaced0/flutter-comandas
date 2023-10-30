import 'package:comanda_full/pages/caixas/adm_caixa_page.dart';
import 'package:comanda_full/pages/comandas/adm_comandas_detail_page.dart';
import 'package:comanda_full/pages/comandas/adm_comandas_page.dart';
import 'package:comanda_full/pages/funcionarios/adm_funcionarios_page.dart';
import 'package:comanda_full/pages/login/login_page.dart';
import 'package:comanda_full/pages/pagamentos/adm_pagamentos_page.dart';
import 'package:comanda_full/pages/pedidos/adm_pedidos_page.dart';
import 'package:comanda_full/pages/produtos/adm_produtos_page.dart';
import 'package:comanda_full/pages/relatorios/adm_relatorios_page.dart';
import 'package:comanda_full/pages/tiposproduto/adm_tiposproduto_page.dart';
import 'package:comanda_full/pages/home/adm_home_page.dart';
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
        '/produtos': (context) => AdmProdutoPage(),
        '/relatorios': (context) => const AdmRelatorioPage(),
        '/caixa': (context) => const AdmCaixaPage(),
        '/comandas': (context) => const AdmComandasPage(),
        '/comandas/detail': (context) => const AdmComandasDetailPage(),
        '/funcionarios': (context) => const AdmFuncionariosPage(),
        '/pagamentos': (context) => const AdmPagamentosPage(),
        '/pedidos': (context) => const AdmPedidosPage(),
        '/tiposproduto': (context) => const AdmTiposProdutoPage(),
        '/login': (context) => const LoginPage()
      },
    );
  }
}
