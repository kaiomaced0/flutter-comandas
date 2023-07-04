import 'package:flutter/material.dart';

class Login_page extends StatelessWidget {
  const Login_page({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comandas Full',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const _Login_page(title: 'Login'),
    );
  }
}

class _Login_page extends StatefulWidget {
  const _Login_page({super.key, required this.title});

  final String title;

  @override
  State<_Login_page> createState() => Login_pageState();
}

class Login_pageState extends State<_Login_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
