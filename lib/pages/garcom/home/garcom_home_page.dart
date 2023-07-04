import 'package:flutter/material.dart';

class Garcom_home_page extends StatelessWidget {
  const Garcom_home_page({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comandas Full',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const _Garcom_home_page(title: 'Login'),
    );
  }
}

class _Garcom_home_page extends StatefulWidget {
  const _Garcom_home_page({super.key, required this.title});

  final String title;

  @override
  State<_Garcom_home_page> createState() => Garcom_home_pageState();
}

class Garcom_home_pageState extends State<_Garcom_home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
