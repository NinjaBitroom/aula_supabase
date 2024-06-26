import 'package:aula_supase/app_routes.dart';
import 'package:aula_supase/database/operation_supabase.dart';
import 'package:flutter/material.dart';

final class RegisterPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cadastro'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 12),
                ),
                labelText: 'E-mail',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 12),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                OperationSupabaseDB()
                    .createNewUserSupabase(
                  _emailController.text,
                  _passwordController.text,
                )
                    .then((value) {
                  if ((value.session != null) && (value.user != null)) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoutes.homePage, (_) => false);
                  }
                }).onError((error, stackTrace) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('$error'),
                  ));
                });
              },
              style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
              ),
              child: const Text('Criar Conta'),
            ),
          ],
        ),
      ),
    );
  }
}
