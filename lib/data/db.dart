import 'package:espaco_infantil/repositories/alunos_repository.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

import '../models/aluno.dart';

class DB {
  DB._();
  static final instance = DB._();
  static Database? _database;

  Future<Database> get database async {
    // ignore: unnecessary_null_comparison
    if (_database != null) return _database!;

    return _database = await initDatabase();
  }

  static get() async {
    return await DB.instance.database;
  }

 Future<sql.Database> initDatabase() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'dados.db'),
      version: 1,
      onCreate: (db, versao) async {
        await db.execute(alunos);
        await setupAlunos(db);
      },
    );
  }

  setupAlunos(db) {
    for (Aluno aluno in AlunosRepository.setupAlunos()) {
      db.insert('alunos', {
        'nome': aluno.nome,
        'telefone': aluno.telefone,
        'responsavel': aluno.responsavel,
        'dataNascimento': aluno.dataNascimento,
        'foto': aluno.foto,
        'rua': aluno.rua,
        'numero': aluno.numero,
        'bairro': aluno.bairro
      });
    }
  }

  String get alunos => '''
CREATE TABLE alunos(
  matricula INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT,
  telefone TEXT,
  responsavel TEXT,
  dataNascimento TEXT,
  foto TEXT,
  endereco TEXT,
  rua Text,
  numero Text,
  bairro Text
);
''';
//   String get enderecos => '''
// CREATE TABLE enderecos(
//   id INTEGER PRIMARY KEY AUTOINCREMENT,
//   rua TEXT,
//   bairro TEXT,
//   numero TEXT,
//   aluno_mat INTEGER,
//   FOREIGN KEY (aluno_mat) REFERENCES alunos(matricula) ON DELETE CASCADE
// );
// ''';
}
