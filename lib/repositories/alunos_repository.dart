import 'dart:collection';

import 'package:espaco_infantil/models/aluno.dart';
import 'package:flutter/material.dart';

import '../models/endereco.dart';

class AlunosRepository extends ChangeNotifier {
  final List<Aluno> _lista = [];
  final List<Aluno> _alunos = [];

  get alunos => _alunos;

  void addAluno({required Aluno aluno, required Endereco endereco}) {
    aluno.endereco.add(endereco);
  }

  UnmodifiableListView<Aluno> get lista => UnmodifiableListView(_lista);

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

  AlunosRepository() {
    _alunos.addAll([
      Aluno(
        nome: "Fulano de tal",
        responsavel: "Seus pais",
        telefone: "6799999999",
        dataNascimento: '',
        matricula: '',
      ),
      Aluno(
        nome: "Cicraninho",
        responsavel: "Suas mães",
        telefone: "679980900",
        dataNascimento: '',
        matricula: '',
      )
    ]);
  }
}
