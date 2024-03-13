import 'package:aula_supase/components/customTextFormField.dart';
import 'package:aula_supase/database/operationSupabase.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller_nome = TextEditingController();
    TextEditingController controller_email = TextEditingController();
    TextEditingController controller_telefone = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        toolbarHeight: 100,
        elevation: 15,
        centerTitle: true,
        title: const Text(
          'Cadastro Pessoa',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            CustomTextFormField(
              labeltext: 'Nome Completo',
              controller: controller_nome,
            ),
            const SizedBox(height: 12),
            CustomTextFormField(
              labeltext: 'E-mail',
              controller: controller_email,
            ),
            const SizedBox(height: 12),
            CustomTextFormField(
              labeltext: 'Telefone',
              controller: controller_telefone,
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                OperationSupabaseDB().insertRowSupabase(
                  controller_nome.text,
                  controller_email.text,
                  controller_telefone.text,
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
