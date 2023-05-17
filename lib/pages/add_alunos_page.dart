import 'dart:math';

import 'package:espaco_infantil/models/aluno.dart';
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
  final _formData = <String, Object>{};

  final _imageUrlFocus = FocusNode();
  final _imageUrlController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // _imageUrlFocus.addListener(updateImage);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      final arg = ModalRoute.of(context)?.settings.arguments;

      if (arg != null) {
        final aluno = arg as Aluno;
        _formData['matricula'] = aluno.matricula;
        _formData['nome'] = aluno.nome;
        _formData['responsavel'] = aluno.responsavel;
        _formData['dataNascimento'] = aluno.dataNascimento;
        _formData['telefone'] = aluno.telefone;
        _formData['rua'] = aluno.rua;
        _formData['numero'] = aluno.numero;
        _formData['bairro'] = aluno.bairro;
        _formData['foto'] = aluno.foto;
      }
    }
  }

  Future<void> _submitForm() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    setState(() => _isLoading = true);
    try {
      await Provider.of<AlunosRepository>(
        context,
        listen: false,
      ).saveAluno(_formData);
    } catch (error) {
      await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Ocorreu um erro!!'),
                content: const Text(
                    '😢 entre em contato com Erickson e diga que falhou na hora de salvar!!'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Ok'),
                  )
                ],
              ));
    } finally {
      setState(() => _isLoading = false);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text('Cadastro de aluno'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: _formData['nome']?.toString(),
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor insira o nome!!';
                        }
                        return null;
                      },
                      onSaved: (nome) => _formData['nome'] = nome ?? '',
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: _formData['responsavel']?.toString(),
                      decoration:
                          const InputDecoration(labelText: 'Responsável'),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor insira o nome!!';
                        }
                        return null;
                      },
                      onSaved: (responsavel) =>
                          _formData['responsavel'] = responsavel ?? '',
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: _formData['telefone']?.toString(),
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
                      onSaved: (telefone) =>
                          _formData['telefone'] = telefone ?? '',
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: _formData['dataNascimento']?.toString(),
                      decoration: const InputDecoration(
                          labelText: 'Data de Nascimento'),
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
                      onSaved: (dataNascimento) =>
                          _formData['dataNascimento'] = dataNascimento ?? '',
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: _formData['rua']?.toString(),
                      decoration: const InputDecoration(labelText: 'Rua'),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor insira a Rua';
                        }
                        return null;
                      },
                      onSaved: (rua) => _formData['rua'] = rua ?? '',
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: _formData['bairro']?.toString(),
                      decoration: const InputDecoration(labelText: 'Bairro'),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor insira o bairro';
                        }
                        return null;
                      },
                      onSaved: (bairro) => _formData['bairro'] = bairro ?? '',
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: _formData['numero']?.toString(),
                      decoration: const InputDecoration(labelText: 'Número'),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor insira o número';
                        }
                        return null;
                      },
                      onSaved: (numero) => _formData['numero'] = numero ?? '',
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextFormField(
                            initialValue: _formData['foto']?.toString(),
                            decoration:
                                const InputDecoration(labelText: 'foto'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Por favor insira a  url';
                              }

                              return null;
                            },
                            onSaved: (foto) => _formData['foto'] = foto ?? '',

                            // controller: _imageUrlController,
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          margin: const EdgeInsets.only(top: 10, left: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          //   child: _imageUrlController.text.isEmpty
                          //       ? const Text('Informe a Url')
                          //       : FittedBox(
                          //           fit: BoxFit.cover,
                          //           child: Image.network(_imageUrlController.text),
                          //         ),
                        )
                      ],
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
