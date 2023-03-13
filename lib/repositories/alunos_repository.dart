import 'package:espaco_infantil/data/dummy_data.dart';
import 'package:espaco_infantil/models/aluno.dart';
import 'package:flutter/material.dart';

class AlunosRepository extends ChangeNotifier {
  final List<Aluno> _lista = dummyAlunos;
  // final List<Aluno> _alunos = dummyAlunos;

  List<Aluno> get alunos => [..._lista];

  // UnmodifiableListView<Aluno> get lista => UnmodifiableListView(_lista);

  void addAluno(Aluno aluno) {
    _lista.add(aluno);
    notifyListeners();
  }

  saveAll(List<Aluno> alunos) {
    for (var aluno in alunos) {
      if (!_lista.contains(aluno)) _lista.add(aluno);
    }
    notifyListeners();
  }

  remove(Aluno aluno) {
    _lista.remove(aluno);
    notifyListeners();
  }

  // AlunosRepository() {
  //   _lista.addAll(dummyAlunos);
  // }
}
