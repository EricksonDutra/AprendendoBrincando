import 'package:espaco_infantil/controllers/alunos_controller.dart';
import 'package:espaco_infantil/pages/add_alunos_page.dart';
import 'package:espaco_infantil/pages/alunos_page.dart';
import 'package:flutter/material.dart';
import '../models/aluno.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = AlunosController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Espaço Infantil"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'images/val.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView.separated(
                itemCount: controller.matricula.length,
                itemBuilder: (BuildContext contexto, int i) {
                  final List<Aluno> matricula = controller.matricula;
                  return ListTile(
                    leading: const Icon(Icons.child_care_sharp),
                    title: Text('Aluno:${matricula[i].nome}'),
                    trailing: Text(matricula[i].responsavel),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AlunosPage(
                            key: Key(matricula[i].nome),
                            aluno: matricula[i],
                          ),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
                padding: const EdgeInsets.all(16),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddAlunosPage(),
            ),
          );
        },
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.add_reaction),
      ),
      drawer: Drawer(
        elevation: 3,
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
              color: Color.fromRGBO(244, 244, 15, 0.1)),
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('Brincando e Aprendendo'),
                accountEmail: Text('email@email.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/tiaval.jpeg'),
                ),
                decoration: BoxDecoration(
                    gradient: SweepGradient(colors: Colors.primaries)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: const Text('Cadastro do aluno.'),
                  leading: const Icon(Icons.child_care),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddAlunosPage()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: const Text('Cadastro de atividades.'),
                  leading: const Icon(Icons.document_scanner_rounded),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddAlunosPage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
