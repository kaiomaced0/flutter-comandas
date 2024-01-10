import 'package:comanda_full/data/model/usuario.dart';
import 'package:flutter/material.dart';

Future bsFuncionario(BuildContext context, Usuario? u) {
  TextEditingController nome = TextEditingController();
  TextEditingController login = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController tipoacesso = TextEditingController();
  TextEditingController senha = TextEditingController();
  if (u != null) {
    nome = TextEditingController(text: u.nome);
    login = TextEditingController(text: u.login);
    cpf = TextEditingController(text: u.cpf);
    tipoacesso = TextEditingController(text: u.perfil.toString());
  }
  return showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.8,
          child: SingleChildScrollView(
              child: SizedBox(
            width: double.infinity,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 1.2, 0, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nome do Funcionario: ',
                              textAlign: TextAlign.start, maxLines: 1),
                          TextField(
                              controller: nome,
                              autofocus: true,
                              decoration: InputDecoration(hintMaxLines: 1)),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Login: ',
                                  textAlign: TextAlign.start,
                                ),
                                TextField(
                                  controller: login,
                                  autofocus: true,
                                  decoration: InputDecoration(hintMaxLines: 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 20, 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Senha: '),
                                TextField(
                                  controller: senha,
                                  autofocus: true,
                                  decoration: InputDecoration(hintMaxLines: 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 1, 20, 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('CPF: ', textAlign: TextAlign.start),
                          TextField(
                            controller: cpf,
                            autofocus: true,
                            decoration: InputDecoration(hintMaxLines: 1),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 1, 20, 5),
                      child: SizedBox(
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tipo de Acesso: '),
                            TextField(
                              controller: tipoacesso,
                              autofocus: false,
                              decoration: InputDecoration(hintMaxLines: 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Center(
                            child: SizedBox(
                              width: 250,
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                width: double.infinity,
                                decoration: ShapeDecoration(
                                  color:
                                      Theme.of(context).colorScheme.surfaceTint,
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
                                child: const Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                                    child: Text('Adicionar',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.justify),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
        );
      });
}
