import 'dart:convert';
import 'dart:math';

import 'package:espaco_infantil/data/dummy_data.dart';
import 'package:espaco_infantil/models/aluno.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../data/db.dart';

class AlunosRepository with ChangeNotifier {
  // final List<Aluno> _lista = dummyAlunos;
  final List<Aluno> _lista = [];

  // UnmodifiableListView<Aluno> get lista => UnmodifiableListView(_lista);
  List<Aluno> get alunos => [..._lista];

  getAlunos(Aluno aluno) async {
    var db = await DB.get();
    var results =
        await db.query('alunos', where: 'data[mat] = ?', whereArgs: [aluno]);
    List<Aluno> alunos = [];
    return alunos;
  }

  Future<void> addAluno(Aluno aluno) async {
    http
        .post(
            Uri.parse(
                'https://aprendendobrincando-cb06f-default-rtdb.firebaseio.com/aluno.json'),
            body: jsonEncode({
              "nome": aluno.nome,
              "dataNascimento": aluno.dataNascimento,
              "responsavel": aluno.responsavel,
              "telefone": aluno.telefone,
              "foto": aluno.foto,
              "rua": aluno.rua,
              "bairro": aluno.bairro,
              "numero": aluno.numero
            }))
        .then((res) {
      // print(jsonDecode(res.body));
      _lista.add(aluno);
      notifyListeners();
    });
  }

  Future<void> saveAluno(Map<String, Object> data) async {
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

  Future<void> updateAluno(Aluno aluno) async {
    int index = _lista.indexWhere((el) => el.matricula == aluno.matricula);

    if (index >= 0) {
      _lista[index] = aluno;
      notifyListeners();
    }
  }

  Future<void> deleteAluno(Aluno aluno) async {
    _lista.remove(aluno);
    notifyListeners();
  }

  saveAll(List<Aluno> alunos) {
    for (var aluno in alunos) {
      if (!_lista.contains(aluno)) _lista.add(aluno);
    }
    notifyListeners();
  }

  static setupAlunos() {
    return [];
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
        rua: al['rua'],
        bairro: al['bairro'],
        numero: al['numero'],
      );
      _lista.add(aluno);
    }
    notifyListeners();
  }
}
