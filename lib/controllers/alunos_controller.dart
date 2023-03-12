import 'package:espaco_infantil/repositories/alunos_repository.dart';

import '../models/aluno.dart';

class AlunosController {
  // late List<Aluno> matricula;
  late AlunosRepository alunosRepository;

  List<Aluno> get matricula => alunosRepository.alunos;

  AlunosController() {
    alunosRepository = AlunosRepository();
  }
}
