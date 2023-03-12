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
                icon: Icon(Icons.stacked_line_chart),
                text: 'Cadastro',
              ),
              Tab(
                icon: Icon(Icons.emoji_emotions),
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
                  )),
            ],
          ),
          Container(),
        ]),
      ),
    );
  }
}
