import 'package:espaco_infantil/data/dummy_data.dart';
import 'package:espaco_infantil/models/aluno.dart';
import 'package:espaco_infantil/models/endereco.dart';
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
        endereco:
            Endereco(rua: 'rua', bairro: 'bairro', numero: 'numero', id: 0),
      );
      _lista.add(aluno);
    }
    notifyListeners();
  }
}

  // AlunosRepository() {
  //   _lista.addAll(dummyAlunos);
  // }

