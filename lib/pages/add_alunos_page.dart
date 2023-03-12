import 'package:flutter/material.dart';

class AddAlunosPage extends StatefulWidget {
  const AddAlunosPage({super.key});

  @override
  _AddAlunosPageState createState() => _AddAlunosPageState();
}

class _AddAlunosPageState extends State<AddAlunosPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _age = 0;
  String _email = '';

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
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
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
              TextFormField(
                decoration: const InputDecoration(labelText: 'Idade'),
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
                  _age = int.parse(value!);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor insira seu email';
                  }
                  if (!value.contains('@')) {
                    return 'Por favor insira um email válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Endereço'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor insira seu email';
                  }
                  if (!value.contains('@')) {
                    return 'Por favor insira um email válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Telefone'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor insira seu email';
                  }
                  if (!value.contains('@')) {
                    return 'Por favor insira um email válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Responsável'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor insira seu email';
                  }
                  if (!value.contains('@')) {
                    return 'Por favor insira um email válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
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
                    //TODO: DELETE - Do something with the form data
                    print('Name: $_name');
                    print('Age: $_age');
                    print('Email: $_email');
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
