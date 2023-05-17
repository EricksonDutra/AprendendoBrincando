import 'dart:io';

import 'package:espaco_infantil/repositories/alunos_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/aluno.dart';
import '../utils/routes.dart';

class AlunosPage extends StatefulWidget {
  const AlunosPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AlunosPage> createState() => _AlunosPageState();
}

class _AlunosPageState extends State<AlunosPage> {
  @override
  Widget build(BuildContext context) {
    final msg = ScaffoldMessenger.of(context);
    final Aluno aluno = ModalRoute.of(context)!.settings.arguments as Aluno;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Center(child: Text(aluno.nome)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      Routes.ALUNO_ADD_ALUNOS_PAGE,
                      arguments: aluno,
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Excluir Produto'),
                      content: const Text('Tem certeza?'),
                      actions: [
                        TextButton(
                          child: const Text('Não'),
                          onPressed: () => Navigator.of(context).pop(false),
                        ),
                        TextButton(
                          child: const Text('Sim'),
                          onPressed: () {
                            Provider.of<AlunosRepository>(
                              context,
                              listen: false,
                            ).deleteAluno(aluno);
                            Navigator.of(context).pop(true);
                          },
                        )
                      ],
                    ),
                  ).then((value) async {
                    if (value ?? false) {
                      try {
                        await Provider.of<AlunosRepository>(
                          context,
                          listen: false,
                        ).deleteAluno(aluno);
                      } on HttpException catch (error) {
                        msg.showSnackBar(SnackBar(
                          content: Text(
                            error.toString(),
                          ),
                        ));
                      }
                    }
                  });
                },
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.edit_note_outlined),
                text: 'Cadastro',
              ),
              Tab(
                icon: Icon(Icons.class_sharp),
                text: 'Plano de aula',
              ),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Image.network(
                      aluno.foto,
                      width: 150,
                    )),
              ),
              const Padding(padding: EdgeInsets.only(top: 24)),
              Text('Matrícula: ${aluno.matricula}',
                  style: const TextStyle(
                      fontSize: 22,
                      fontFamily: 'Verdana',
                      color: Colors.grey,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(24),
                child: ListTile(
                  title: Text('Responsável: ${aluno.responsavel}',
                      style: const TextStyle(fontSize: 18)),
                  subtitle: Text(
                    '''Informações: \nEndereço: ${aluno.rua}, ${aluno.numero} - \n${aluno.bairro}
                    \nData Nascimento: ${aluno.dataNascimento}''',
                    style: const TextStyle(fontSize: 18),
                  ),
                  trailing: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.phone)),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 24)),
              Text('Telefone: ${aluno.telefone}',
                  style: const TextStyle(
                      fontSize: 22,
                      fontFamily: 'Verdana',
                      color: Colors.grey,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset('images/planoaula.jpeg'),
            ],
          ),
        ]),
      ),
    );
  }
}
