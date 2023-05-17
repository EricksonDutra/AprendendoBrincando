import 'dart:convert';
import 'dart:math';
import 'package:espaco_infantil/exceptions/http_exception.dart';
import 'package:espaco_infantil/models/aluno.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';

class AlunosRepository with ChangeNotifier {
  final String _baseUrl = Constants.ALUNO_BASE_URL;
  final List<Aluno> _lista = [];

  List<Aluno> get alunos => [..._lista];

  Future<void> loadAlunos() async {
    _lista.clear();
    final response = await http.get(Uri.parse('$_baseUrl.json'));
    if (response.body == 'null') return;
    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((alunoMat, alunoData) {
      _lista.add(
        Aluno(
          matricula: alunoMat,
          nome: alunoData['nome'],
          dataNascimento: alunoData['dataNascimento'],
          responsavel: alunoData['responsavel'],
          telefone: alunoData['telefone'],
          foto: alunoData['foto'],
          rua: alunoData['rua'],
          bairro: alunoData['bairro'],
          numero: alunoData['numero'],
        ),
      );
    });
    notifyListeners();
  }

  Future<void> addAluno(Aluno aluno) async {
    final response = await http.post(
      Uri.parse('$_baseUrl.json'),
      body: jsonEncode(
        {
          "nome": aluno.nome,
          "dataNascimento": aluno.dataNascimento,
          "responsavel": aluno.responsavel,
          "telefone": aluno.telefone,
          "foto": aluno.foto,
          "rua": aluno.rua,
          "bairro": aluno.bairro,
          "numero": aluno.numero
        },
      ),
    );

    final matricula = jsonDecode(response.body)['name'];
    _lista.add(Aluno(
        matricula: matricula,
        nome: aluno.nome,
        dataNascimento: aluno.dataNascimento,
        responsavel: aluno.responsavel,
        telefone: aluno.telefone,
        foto: aluno.foto,
        rua: aluno.rua,
        bairro: aluno.bairro,
        numero: aluno.numero));
    notifyListeners();
  }

  Future<void> saveAluno(Map<String, Object> data) async {
    bool hasMat = data['matricula'] != null;

    final aluno = Aluno(
      matricula: hasMat
          ? data['matricula'] as String
          : Random().nextDouble().toString(),
      nome: data['nome'] as String,
      dataNascimento: data['dataNascimento'] as String,
      bairro: data['bairro'] as String,
      numero: data['numero'] as String,
      rua: data['rua'] as String,
      foto: data['foto'] as String,
      responsavel: data['responsavel'] as String,
      telefone: data['telefone'] as String,
    );

    if (hasMat) {
      return updateAluno(aluno);
    } else {
      return addAluno(aluno);
    }
  }

  Future<void> updateAluno(Aluno aluno) async {
    int index = _lista.indexWhere((el) => el.matricula == aluno.matricula);

    if (index >= 0) {
      await http.patch(Uri.parse('$_baseUrl/${aluno.matricula}.json'),
          body: jsonEncode(
            {
              "nome": aluno.nome,
              "dataNascimento": aluno.dataNascimento,
              "responsavel": aluno.responsavel,
              "telefone": aluno.telefone,
              "foto": aluno.foto,
              "rua": aluno.rua,
              "bairro": aluno.bairro,
              "numero": aluno.numero
            },
          ));

      _lista[index] = aluno;
      notifyListeners();
    }
  }

  Future<void> deleteAluno(Aluno aluno) async {
    int index = _lista.indexWhere((el) => el.matricula == aluno.matricula);

    if (index >= 0) {
      final aluno = _lista[index];
      _lista.remove(aluno);
      notifyListeners();

      final response = await http.delete(
        Uri.parse('$_baseUrl/${aluno.matricula}.json'),
      );

      if (response.statusCode >= 400) {
        _lista.insert(index, aluno);
        notifyListeners();
        throw HttpException(
            msg: 'Não foi possivel excluir o aluon',
            statusCode: response.statusCode);
      }
    }
  }

  // saveAll(List<Aluno> alunos) {
  //   for (var aluno in alunos) {
  //     if (!_lista.contains(aluno)) _lista.add(aluno);
  //   }
  //   notifyListeners();
  // }

  // static setupAlunos() {
  //   return [];
  // }

  // AlunosRepository() {
  //   initRepository();
  // }

  // initRepository() async {
  //   var db = await DB.get();
  //   List alunos = await db.query('alunos');

  //   for (var al in alunos) {
  //     var aluno = Aluno(
  //       matricula: al['matricula'],
  //       nome: al['nome'],
  //       telefone: al['telefone'],
  //       responsavel: al['responsavel'],
  //       dataNascimento: al['dataNascimento'],
  //       foto: al['foto'],
  //       rua: al['rua'],
  //       bairro: al['bairro'],
  //       numero: al['numero'],
  //     );
  //     _lista.add(aluno);
  //   }
  //   notifyListeners();
  // }
}
