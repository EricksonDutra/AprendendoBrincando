import 'package:espaco_infantil/repositories/alunos_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AlunosRepository()),
        //Provider(create: (context) => const HomePage())
      ],
      child: const MyApp(),
    ),
  );
}
