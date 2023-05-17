// import 'package:espaco_infantil/pages/home_page.dart';
// import 'package:espaco_infantil/repositories/alunos_repository.dart';
// import 'package:espaco_infantil/widgets/aluno_grid.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../utils/routes.dart';

// class ManagerAluno extends StatelessWidget {
//   const ManagerAluno({super.key});

//   Future<void> _refreshAlunos(BuildContext context) {
//     return Provider.of<AlunosRepository>(
//       context,
//       listen: false,
//     ).loadAlunos();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final AlunosRepository alunos = Provider.of(context);
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Gerenciar Alunos'),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.of(context).pushNamed(Routes.HOME);
//               },
//               icon: const Icon(Icons.add),
//             ),
//           ],
//         ),
//         drawer: AppDrawer(),
//         body: RefreshIndicator(
//           onRefresh: () => _refreshAlunos(context),
//           child: Padding(
//             padding: const EdgeInsets.all(8),
//             child: ListView.builder(
//                 itemBuilder: alunos.itemsCount,
//                 itemBuilder: (ctx, i) => Column(
//                       children: [
//                         AlunoGrid(alunos.item[i]),
//                         const Divider(),
//                       ],
//                     // )),
//           ),
//         ));
//   }
// }
