import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/aluno.dart';
import '../repositories/alunos_repository.dart';
import 'aluno_widget.dart';

class AlunoGrid extends StatelessWidget {
  const AlunoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AlunosRepository>(context);
    final List<Aluno> aluno = provider.alunos;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: aluno.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider<ChangeNotifier>.value(
        value: aluno[i],
        child: AlunoWidget(aluno: aluno[i]),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
