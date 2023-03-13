import 'package:flutter/material.dart';

import '../models/aluno.dart';
import '../utils/routes.dart';

class AlunoWidget extends StatelessWidget {
  final Aluno aluno;
  const AlunoWidget({super.key, required this.aluno});

  @override
  Widget build(BuildContext context) {
    // final aluno = Provider.of<Aluno>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black38,
          title: Text(
            aluno.nome,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.phone_android),
            //color: Theme.of(context).shadowColor,
          ),
        ),
        child: GestureDetector(
          onTap: () => Navigator.of(context)
              .pushNamed(Routes.ALUNO_PAGE, arguments: aluno),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.grey[200]),
            child: Image.network(aluno.foto),
          ),
        ),
      ),
    );
  }
}
