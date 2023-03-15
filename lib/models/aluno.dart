import 'endereco.dart';

class Aluno {
  int matricula;
  String nome;
  String dataNascimento;
  String responsavel;
  String telefone;
  String foto;
  Endereco endereco;

  Aluno({
    required this.matricula,
    required this.nome,
    required this.dataNascimento,
    required this.responsavel,
    required this.telefone,
    required this.foto,
    required this.endereco,
  });
}
