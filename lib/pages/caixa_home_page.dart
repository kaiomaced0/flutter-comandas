import 'package:flutter/material.dart';

class Caixa_home_page extends StatelessWidget {
  const Caixa_home_page({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comandas Full',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const _Caixa_home_page(title: 'Login'),
    );
  }
}

class _Caixa_home_page extends StatefulWidget {
  const _Caixa_home_page({super.key, required this.title});

  final String title;

  @override
  State<_Caixa_home_page> createState() => Caixa_home_pageState();
}

class Caixa_home_pageState extends State<_Caixa_home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
