
import 'package:flutter/material.dart';

class Comanda_page extends StatelessWidget {
  const Comanda_page({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comandas Full',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const _Comanda_page(title: 'Login'),
    );
  }
}

class _Comanda_page extends StatefulWidget {
  const _Comanda_page({super.key, required this.title});

  final String title;

  @override
  State<_Comanda_page> createState() => Comanda_pageState();
}

class Comanda_pageState extends State<_Comanda_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
