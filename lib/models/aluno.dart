import 'endereco.dart';

class Aluno {
  String matricula;
  String nome;
  String dataNascimento;
  String responsavel;
  String telefone;
  List<Endereco> endereco = [];

  Aluno({
    required this.matricula,
    required this.nome,
    required this.dataNascimento,
    required this.responsavel,
    required this.telefone,
  });
}
