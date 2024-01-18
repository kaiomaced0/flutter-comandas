import 'package:comanda_full/data/model/usuario.dart';
import 'package:flutter/material.dart';

class FuncionarioChange extends StatefulWidget {
  late Usuario? usuario;
  FuncionarioChange({super.key, this.usuario});

  @override
  State<FuncionarioChange> createState() => _FuncionarioChangeState();
}

class _FuncionarioChangeState extends State<FuncionarioChange> {
  TextEditingController nome = TextEditingController();
  TextEditingController login = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController tipoacesso = TextEditingController();
  TextEditingController senha = TextEditingController();

  @override
  void initState() {
    if (widget.usuario != null) {
      nome = TextEditingController(text: widget.usuario!.nome);
      login = TextEditingController(text: widget.usuario!.login);
      cpf = TextEditingController(text: widget.usuario!.cpf);
      tipoacesso =
          TextEditingController(text: widget.usuario!.perfil.toString());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
                        onTap: () => setState(() {}),
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
                            onTap: () => setState(() {}),
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
                            onTap: () => setState(() {}),
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
                      onTap: () => setState(() {}),
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
                        onTap: () => setState(() {}),
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
                            color: Theme.of(context).colorScheme.surfaceTint,
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
                    if (widget.usuario == null) {
                      nome.text.isEmpty &&
                              login.text.isEmpty &&
                              senha.text.isEmpty &&
                              tipoacesso.text.isEmpty &&
                              cpf.text.isEmpty
                          ? ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                              backgroundColor: Color.fromARGB(255, 104, 14, 14),
                              duration: Duration(milliseconds: 900),
                              content: Text('Informe os dados do Produto!',
                                  style: TextStyle(color: Colors.white)),
                            ))
                          : {
                              Usuario.inserirUsuario(
                                  Usuario(
                                      nome: nome.text,
                                      login: login.text,
                                      cpf: cpf.text),
                                  senha.text,
                                  tipoacesso.text),
                              Navigator.of(context).pop(),
                              Navigator.of(context).pop(),
                              Navigator.of(context).pushNamed('/funcionarios')
                            };
                    } else {
                      nome.text.isEmpty &&
                              login.text.isEmpty &&
                              senha.text.isEmpty &&
                              tipoacesso.text.isEmpty &&
                              cpf.text.isEmpty
                          ? ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                              backgroundColor: Color.fromARGB(255, 104, 14, 14),
                              duration: Duration(milliseconds: 900),
                              content: Text('Informe os dados do Produto!',
                                  style: TextStyle(color: Colors.white)),
                            ))
                          : {
                              Usuario.inserirUsuario(
                                  Usuario(
                                      id: widget.usuario!.id,
                                      nome: nome.text,
                                      login: login.text,
                                      cpf: cpf.text),
                                  senha.text,
                                  tipoacesso.text),
                              Navigator.of(context).pop(),
                              Navigator.of(context).pop(),
                              Navigator.of(context).pushNamed('/funcionarios')
                            };
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    )));
  }
}
