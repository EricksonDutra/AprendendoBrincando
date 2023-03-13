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
          actions: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.edit),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.delete),
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
            mainAxisAlignment: MainAxisAlignment.start,
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
                    '''Informações: \nEndereço: ${aluno.endereco.rua}, ${aluno.endereco.numero} - ${aluno.endereco.bairro}
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
