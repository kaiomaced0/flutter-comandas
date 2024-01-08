// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:comanda_full/data/repository/usuario_logado_repository.dart';
import 'package:comanda_full/pages/home/adm_home_page.dart';
import 'package:comanda_full/widget/bnb_adm.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> postData(String login, String senha) async {
    final url = Uri.parse('http://localhost:8080/auth');

    final Map<String, String> requestBody = {
      'login': login,
      'senha': senha,
    };

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      // A solicitação foi bem-sucedida
      print('Solicitação POST bem-sucedida');
      print('Resposta: ${response.body}');

      final token = response.headers['authorization'];
      UsuarioLogadoRepository.usuario.token = token!;
      print('Token do usuário: ${UsuarioLogadoRepository.usuario.token}');
      mudarTelaAdm(0, context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: const Color.fromARGB(255, 14, 104, 17),
        content: const Text('Login Realizado com Sucesso!'),
      ));
    } else {
      // A solicitação falhou
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
      body: Stack(children: [
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Comandas Full',
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 450),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 5),
                        child: TextField(
                          controller: login,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            labelText: 'Login',
                            hintText: 'Digite seu login',
                            fillColor: Color.fromARGB(255, 236, 236, 236),
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 15),
                          child: TextField(
                            controller: senha,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
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
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              constraints:
                                  BoxConstraints(maxWidth: 300, maxHeight: 50),
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: MediaQuery.of(context).size.width * 0.1,
                              decoration: ShapeDecoration(
                                color: const Color.fromARGB(255, 17, 98, 19),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Row(
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
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => AdmHomePage()),
                              (Route<dynamic> route) => false,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 35),
                        child: GestureDetector(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              constraints:
                                  BoxConstraints(maxWidth: 300, maxHeight: 50),
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: MediaQuery.of(context).size.width * 0.1,
                              decoration: ShapeDecoration(
                                color: Color.fromARGB(255, 98, 60, 17),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Cadastro',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: () => (),
                        ),
                      ),
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
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
      ]),
    );
  }
}
