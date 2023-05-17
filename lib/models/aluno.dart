import 'package:flutter/material.dart';

class Aluno with ChangeNotifier {
  final String matricula;
  final String nome;
  final String dataNascimento;
  final String responsavel;
  final String telefone;
  final String foto;
  final String rua;
  final String bairro;
  final String numero;
  // Endereco endereco;

  Aluno({
    required this.matricula,
    required this.nome,
    required this.dataNascimento,
    required this.responsavel,
    required this.telefone,
    required this.foto,
    required this.rua,
    required this.bairro,
    required this.numero,
  });
}
