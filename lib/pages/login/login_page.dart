// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:comanda_full/data/model/usuario.dart';
import 'package:comanda_full/main.dart';
import 'package:comanda_full/pages/home/adm_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> logar(String login, String senha) async {
    SharedPreferences _sharedpreferences =
        await SharedPreferences.getInstance();
    final baseUrl = Uri.parse('$url/auth');

    final Map<String, String> requestBody = {
      'login': login,
      'senha': senha,
    };

    final response = await http.post(
      baseUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      print('Solicitação POST bem-sucedida');
      print('Resposta: ${response.body}');

      final token = response.headers['authorization'];
      print(token);

      await _sharedpreferences.setString('token', token.toString());
      Usuario u = await Usuario.obterDadosUsuario();

      await _sharedpreferences.setString('perfil', u.perfil![0].toString());

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Color.fromARGB(255, 14, 104, 17),
        duration: Duration(seconds: 1),
        content: Text('Login Realizado com Sucesso!',
            style: TextStyle(color: Colors.white)),
      ));
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const AdmHomePage()),
        (Route<dynamic> route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Color.fromARGB(255, 104, 14, 14),
        duration: Duration(milliseconds: 900),
        content: Text('Login ou senha incorreto!',
            style: TextStyle(color: Colors.white)),
      ));

      print('Erro na solicitação POST');
      print('Status code: ${response.statusCode}');
      print('Resposta: ${response.body}');
    }
  }

  TextEditingController senha = TextEditingController();
  TextEditingController login = TextEditingController();
  bool _obscureText = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 38, 27, 99),
              Color.fromARGB(255, 34, 34, 34)
            ],
          ),
        ),
        child: Stack(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Image.asset('assets/images/girafffus_logo.jpg',
                    height: MediaQuery.of(context).size.height * 0.15),
              ]),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Image.asset('assets/images/oitodemarco.jpg',
                  //           height: MediaQuery.of(context).size.height * 0.25),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(1.0),
                  //   child: Image(
                  //       image:
                  //           const AssetImage('assets/images/simbolobebe.jpg'),
                  //       height: MediaQuery.of(context).size.height * 0.25),
                  // ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {});
                            },
                            controller: login,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              labelText: 'Login',
                              hintText: 'Digite seu login',
                              fillColor: Color.fromARGB(255, 236, 236, 236),
                              filled: true,
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {});
                              },
                              controller: senha,
                              style: const TextStyle(color: Colors.black),
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                labelText: 'Senha',
                                hintText: 'Digite sua senha',
                                fillColor: Colors.grey[200],
                                filled: true,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
                          child: GestureDetector(
                            onTap: login.text.isNotEmpty &&
                                    senha.text.isNotEmpty
                                ? () async {
                                    isLoading = true;

                                    Future.delayed(const Duration(seconds: 1),
                                        () {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    });

                                    logar(login.text, senha.text);
                                  }
                                : () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      duration: Duration(milliseconds: 1500),
                                      backgroundColor:
                                          Color.fromARGB(255, 34, 51, 66),
                                      content:
                                          Text('Login ou senha não inseridos!'),
                                    ));
                                  },
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Container(
                                constraints: const BoxConstraints(
                                    maxWidth: 250, maxHeight: 50),
                                width: MediaQuery.of(context).size.width * 0.75,
                                height:
                                    MediaQuery.of(context).size.width * 0.12,
                                decoration: ShapeDecoration(
                                  color: const Color.fromARGB(255, 0, 44, 80),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 4,
                                      offset: Offset(2, 2),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Login',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () => {
                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => ForgetPassPage(),
                                  //   ),
                                  // )
                                },
                            child: const Text('Esqueceu a senha?',
                                style: TextStyle(
                                    color:
                                        Color.fromARGB(255, 255, 255, 255)))),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          if (isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
        ]),
      ),
    );
  }
}
