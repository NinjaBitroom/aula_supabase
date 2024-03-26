import 'package:aula_supase/components/custom_text_form_field.dart';
import 'package:aula_supase/database/operation_supabase.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final class CadastroPessoaPage extends StatefulWidget {
  const CadastroPessoaPage({super.key});

  @override
  State<CadastroPessoaPage> createState() => _CadastroPessoaPageState();
}

final class _CadastroPessoaPageState extends State<CadastroPessoaPage> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _dataNascController = TextEditingController();
  final _telController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          'Cadastrar Nova Pessoa',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            CustomTextFormField(
              labeltext: 'Nome Completo',
              controller: _nomeController,
              keyboardType: TextInputType.name,
              hintText: 'Fulano de Tal',
            ),
            const SizedBox(height: 12),
            CustomTextFormField(
              labeltext: 'E-mail',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'usuario@dominio.com',
            ),
            const SizedBox(height: 12),
            CustomTextFormField(
              labeltext: 'CPF',
              controller: _cpfController,
              keyboardType: TextInputType.number,
              hintText: '999.999.999-99',
            ),
            const SizedBox(height: 12),
            CustomTextFormField(
              labeltext: 'Data de Nascimento',
              controller: _dataNascController,
              keyboardType: TextInputType.datetime,
              hintText: 'dd/mm/aaaa',
            ),
            const SizedBox(height: 12),
            CustomTextFormField(
              labeltext: 'Telefone',
              controller: _telController,
              keyboardType: TextInputType.phone,
              hintText: '(99) 99999-9999',
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                final f = DateFormat('dd/MM/yyyy');
                OperationSupabaseDB().setPessoa(
                  _nomeController.text,
                  _emailController.text,
                  _cpfController.text,
                  f.parse(_dataNascController.text),
                  _telController.text,
                );
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text('A pessoa ${_nomeController.text} foi cadastrada!'),
                ));
                _nomeController.clear();
                _emailController.clear();
                _cpfController.clear();
                _dataNascController.clear();
                _telController.clear();
              },
              icon: const Icon(Icons.save),
              label: const Text('Salvar'),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
