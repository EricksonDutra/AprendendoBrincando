import 'package:espaco_infantil/controllers/alunos_controller.dart';
import 'package:espaco_infantil/repositories/alunos_repository.dart';
import 'package:espaco_infantil/widgets/aluno_widget.dart';
import 'package:espaco_infantil/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    final provider = Provider.of<AlunosRepository>(context);
    final List<Aluno> aluno = provider.alunos;
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
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10),
              itemCount: aluno.length,
              itemBuilder: (ctx, i) => AlunoWidget(aluno: aluno[i]),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
            ),
          ],
        ),
      ),
    );
  }
}








//       SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Image.asset(
//               'images/val.jpg',
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height * 0.5,
//             ),
//             const SizedBox(height: 40),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) => const AddAlunosPage(),
//             ),
//           );
//         },
//         backgroundColor: Colors.pinkAccent,
//         child: const Icon(Icons.add_reaction),
//       ),
//       drawer: const DrawerWidget(),
//     );
//   }
// }
