import 'package:aula_supase/components/custom_text_form_field.dart';
import 'package:aula_supase/database/operation_supabase.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerNome = TextEditingController();
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerTelefone = TextEditingController();

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
              controller: controllerNome,
            ),
            const SizedBox(height: 12),
            CustomTextFormField(
              labeltext: 'E-mail',
              controller: controllerEmail,
            ),
            const SizedBox(height: 12),
            CustomTextFormField(
              labeltext: 'Telefone',
              controller: controllerTelefone,
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                OperationSupabaseDB().insertRowSupabase(
                  controllerNome.text,
                  controllerEmail.text,
                  controllerTelefone.text,
                );
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