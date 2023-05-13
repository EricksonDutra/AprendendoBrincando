import 'package:espaco_infantil/controllers/theme_controller.dart';
import 'package:espaco_infantil/repositories/alunos_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'my_app.dart';

void main() {
  Get.lazyPut<ThemeController>(() => ThemeController());
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
 