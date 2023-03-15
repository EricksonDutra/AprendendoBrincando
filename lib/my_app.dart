import 'package:espaco_infantil/controllers/theme_controller.dart';
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
    ThemeController.to.loadThemeMode();
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
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.grey,
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
            secondary: Colors.white,
            brightness: Brightness.dark,
          ),
          dividerColor: Colors.black45,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent[100],
            ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurpleAccent[100],
          ),
        ),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routes: {Routes.ALUNO_PAGE: (ctx) => const AlunosPage()},
      ),
    );
  }
}
