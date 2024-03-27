import 'package:aula_supase/app_routes.dart';
import 'package:aula_supase/database/operation_supabase.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faça seu login'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 12),
                  ),
                  labelText: 'E-mail'),
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
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
                final db = OperationSupabaseDB();
                print(_emailController.text);
                print(_passwordController.text);
                db.signInUserSupabase(
                  _emailController.text,
                  _passwordController.text,
                );
                print(db.supabase.auth.currentUser);
                print(db.supabase.auth.currentSession);
                if ((db.supabase.auth.currentUser != null) &&
                    (db.supabase.auth.currentSession != null)) {
                  Navigator.pushNamed(context, AppRoutes.homePage);
                }
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              child: const Text('Entrar'),
            ),
            TextButton(
              style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.blue),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.registerPage);
              },
              child: const Text('Criar uma nova conta'),
            ),
            TextButton(
              style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.blue),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.forgotPassPage);
              },
              child: const Text('Esqueci minha senha'),
            ),
          ],
        ),
      ),
    );
  }
}
