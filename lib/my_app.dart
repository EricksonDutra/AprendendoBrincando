import 'package:espaco_infantil/pages/alunos_page.dart';
import 'package:espaco_infantil/pages/splash_page.dart';
import 'package:espaco_infantil/repositories/alunos_repository.dart';
import 'package:espaco_infantil/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return ChangeNotifierProvider(
      create: (_) => AlunosRepository(),
      child: MaterialApp(
        home: const SplashPage(),
        title: 'Espaço Infantil',
        theme: theme.copyWith(
          primaryColor: Colors.pinkAccent,
          colorScheme: theme.colorScheme.copyWith(
            secondary: Colors.yellow,
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: {Routes.ALUNO_PAGE: (ctx) => const AlunosPage()},
      ),
    );
  }
}
