import 'package:flutter/material.dart';
import '../widgets/aluno_grid.dart';
import '../widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Espaço Infantil"),
        backgroundColor: Colors.pinkAccent,
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/val.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
            const SizedBox(height: 10),
            const AlunoGrid(),
          ],
        ),
      ),
    );
  }
}
