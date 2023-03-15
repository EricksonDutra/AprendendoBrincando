import 'dart:math';

import 'package:espaco_infantil/models/aluno.dart';
import 'package:espaco_infantil/models/endereco.dart';
import 'package:espaco_infantil/repositories/alunos_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAlunosPage extends StatefulWidget {
  const AddAlunosPage({super.key});

  @override
  _AddAlunosPageState createState() => _AddAlunosPageState();
}

class _AddAlunosPageState extends State<AddAlunosPage> {
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>;

  String _name = '';
  String _respon = '';
  String _phone = '';
  String _age = '';
  final String _matricula = '';
  String _rua = '';
  String _bairro = '';
  String _numero = '';
  String _foto = '';

  void _submitForm() {
    _formKey.currentState?.save();
    final newAluno = Aluno(
      matricula: Random().nextInt(1000),
      nome: _name,
      dataNascimento: _age,
      responsavel: _respon,
      telefone: _phone,
      foto: _foto,
      endereco: Endereco(rua: _rua, bairro: _bairro, numero: _numero, id: 0),
    );

    Provider.of<AlunosRepository>(context, listen: false).addAluno(newAluno);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text('Cadastro de aluno'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor insira o nome!!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Responsável'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor insira o nome!!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _respon = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Telefone'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor insira o telefone';
                  }
                  if (value.length < 8) {
                    return 'Por favor insira um telefone válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phone = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Data de Nascimento'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor insira a idade!!';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Por favor insira um numero válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _age = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Rua'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor insira a Rua';
                  }
                  return null;
                },
                onSaved: (value) {
                  _rua = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Bairro'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor insira o bairro';
                  }
                  return null;
                },
                onSaved: (value) {
                  _bairro = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Número'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor insira o número';
                  }
                  return null;
                },
                onSaved: (value) {
                  _numero = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'foto'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor insira a  url';
                  }

                  return null;
                },
                onSaved: (value) {
                  _foto = value!;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.pinkAccent)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _submitForm();
                  }
                },
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
