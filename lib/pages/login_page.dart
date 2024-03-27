import 'package:aula_supase/app_routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                Navigator.pushNamed(context, AppRoutes.homePage);
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
