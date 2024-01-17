import 'package:comanda_full/data/model/tipoproduto.dart';
import 'package:comanda_full/data/model/usuario.dart';
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
import 'package:comanda_full/widget/add_pedido.dart';
import 'package:flutter/material.dart';
import 'src/shared/themes/themes.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      title: 'App Widget',
      theme: lightTheme,
      darkTheme: darkTheme,
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const AdmHomePage(),
        '/produtos': (context) => AdmProdutoPage(),
        '/relatorios': (context) => const AdmRelatorioPage(),
        '/caixa': (context) => const AdmCaixaPage(),
        '/comandas': (context) => const AdmComandasPage(),
        '/comandas/detail': (context) => AdmComandasDetailPage(comanda: null),
        '/funcionarios': (context) =>
            const AdmFuncionariosPage(funcionarios: []),
        '/pagamentos': (context) => const AdmPagamentosPage(),
        '/pedidos': (context) => const AdmPedidosPage(),
        '/pedidos/add': (context) => AddPedido(comanda: null, pedido: null),
        '/tiposproduto': (context) => AdmTiposProdutoPage(),
        '/login': (context) => const LoginPage()
      },
    );
  }
}

Future<Widget>? tokenSalvo() async {
  final prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token') ?? '';

  if (token.isEmpty) {
    return const LoginPage();
  } else {
    return const AdmHomePage();
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({key, this.title}) : super(key: key);
  final title;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen(context);
  }
}

Widget _introScreen(BuildContext context) {
  return Stack(
    children: <Widget>[
      FlutterSplashScreen(
        duration: const Duration(seconds: 2),
        nextScreen: FutureBuilder(
            future: tokenSalvo(),
            builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return snapshot.data ?? const SizedBox();
              }
            }),
        splashScreenBody: Center(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.red],
              ),
            ),
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            child: Stack(children: [
              const Center(
                child: Text('Comandas',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontFamily: 'Orbitron')),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/images/girafffus_logo.jpg',
                          height: MediaQuery.of(context).size.height * 0.15),
                      const Text('@kaiomacedo_m',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    ],
  );
}
