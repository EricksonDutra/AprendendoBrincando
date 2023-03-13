import 'package:flutter/material.dart';
import '../models/aluno.dart';

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
    final Aluno aluno = ModalRoute.of(context)!.settings.arguments as Aluno;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Center(child: Text(aluno.nome)),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(top: 24)),
              const Text('Matrícula: ${'widget.aluno.matricula'}',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Verdana',
                      color: Colors.grey,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(24),
                child: ListTile(
                  title: const Text('widget.aluno.matricula'),
                  subtitle: const Text(
                    ' ${'widget.aluno.nome'} - ${'widget.aluno.responsavel'} - ${'widget.aluno.telefone'}',
                    style: TextStyle(fontSize: 22),
                  ),
                  trailing: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.phone)),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 24)),
              const Text('Endereço: ${'widget.aluno.endereco'}',
                  style: TextStyle(
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
