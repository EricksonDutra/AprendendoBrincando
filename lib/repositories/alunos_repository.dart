import 'dart:math';

import 'package:espaco_infantil/data/dummy_data.dart';
import 'package:espaco_infantil/models/aluno.dart';
import 'package:flutter/material.dart';

import '../data/db.dart';

class AlunosRepository extends ChangeNotifier {
  final List<Aluno> _lista = dummyAlunos;
  // final List<Aluno> _alunos = dummyAlunos;

  List<Aluno> get alunos => [..._lista];

  // UnmodifiableListView<Aluno> get lista => UnmodifiableListView(_lista);

  getAlunos(aluno) async {
    var db = await DB.get();
    var results = await db.query('alunos', whereArgs: [aluno]);
    List<Aluno> alunos = [];
    return alunos;
  }

  void addAluno(Aluno aluno) async {
    _lista.add(aluno);
    notifyListeners();
  }

  void saveAluno(Map<String, Object> data) {
    bool hasMat = data['mat'] != null;

    final aluno = Aluno(
      matricula: hasMat ? data['mat'] as int : Random().nextInt(1000),
      nome: data['nome'] as String,
      dataNascimento: data['dataNascimento'] as String,
      bairro: data['bairro'] as String,
      numero: data['numero'] as String,
      rua: data['rua'] as String,
      foto: data['foto'] as String,
      responsavel: data['responsavel'] as String,
      telefone: data['telefone'] as String,
      // endereco: data['endereco'] as String,
    );

    if (hasMat) {
      updateAluno(aluno);
    } else {
      addAluno(aluno);
    }
  }

  void updateAluno(Aluno aluno) {
    int index = _lista.indexWhere((el) => el.matricula == aluno.matricula);

    if (index >= 0) {
      _lista[index] = aluno;
      notifyListeners();
    }
  }

  void deleteAluno(Aluno aluno) {
    int index = _lista.indexWhere((el) => el.matricula == aluno.matricula);

    if (index >= 0) {
      _lista.removeWhere((el) => el.matricula == aluno.matricula);
      notifyListeners();
    }
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

  static setupAlunos() {
    return dummyAlunos;
  }

  AlunosRepository() {
    initRepository();
  }

  initRepository() async {
    var db = await DB.get();
    List alunos = await db.query('alunos');

    for (var al in alunos) {
      var aluno = Aluno(
        matricula: al['matricula'],
        nome: al['nome'],
        telefone: al['telefone'],
        responsavel: al['responsavel'],
        dataNascimento: al['dataNascimento'],
        foto: al['foto'],
        rua: 'rua',
        bairro: 'bairro',
        numero: 'numero',
      );
      _lista.add(aluno);
    }
    notifyListeners();
  }
}

  // AlunosRepository() {
  //   _lista.addAll(dummyAlunos);
  // }

