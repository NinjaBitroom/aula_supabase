import 'package:aula_supase/components/custom_text_form_field.dart';
import 'package:aula_supase/database/operation_supabase.dart';
import 'package:flutter/material.dart';

class CadastrarPessoaPage extends StatefulWidget {
  const CadastrarPessoaPage({super.key});

  @override
  State<CadastrarPessoaPage> createState() => _CadastrarPessoaPageState();
}

class _CadastrarPessoaPageState extends State<CadastrarPessoaPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nomeController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController cpfController = TextEditingController();
    TextEditingController dataNascController = TextEditingController();
    TextEditingController telController = TextEditingController();

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
              controller: nomeController,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 12),
            CustomTextFormField(
              labeltext: 'E-mail',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            CustomTextFormField(
              labeltext: 'CPF',
              controller: cpfController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            CustomTextFormField(
              labeltext: 'Data de Nascimento',
              controller: dataNascController,
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 12),
            CustomTextFormField(
              labeltext: 'Telefone',
              controller: telController,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                OperationSupabaseDB().setPessoa(
                  nomeController.text,
                  emailController.text,
                  cpfController.text,
                  dataNascController.text,
                  telController.text,
                );
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text('A pessoa ${nomeController.text} foi cadastrada!'),
                ));
                nomeController.clear();
                emailController.clear();
                cpfController.clear();
                dataNascController.clear();
                telController.clear();
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
