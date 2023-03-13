import 'package:flutter/material.dart';

import '../pages/add_alunos_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
