import 'package:flutter/material.dart';
import '../models/aluno.dart';

class AlunosPage extends StatefulWidget {
  final Aluno aluno;

  const AlunosPage({
    Key? key,
    required this.aluno,
  }) : super(key: key);

  @override
  State<AlunosPage> createState() => _AlunosPageState();
}

class _AlunosPageState extends State<AlunosPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Center(child: Text(widget.aluno.nome)),
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
              Text('Matrícula: ${widget.aluno.matricula}',
                  style: const TextStyle(
                      fontSize: 22,
                      fontFamily: 'Verdana',
                      color: Colors.grey,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(24),
                child: ListTile(
                  title: Text(widget.aluno.matricula),
                  subtitle: Text(
                    ' ${widget.aluno.nome} - ${widget.aluno.responsavel} - ${widget.aluno.telefone}',
                    style: const TextStyle(fontSize: 22),
                  ),
                  trailing: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.phone)),
                ),
              ),
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
