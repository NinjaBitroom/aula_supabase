import 'package:aula_supase/app_routes.dart';
import 'package:aula_supase/components/custom_elevated_button.dart';
import 'package:aula_supase/database/operation_supabase.dart';
import 'package:flutter/material.dart';

final class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Aplicativo'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              OperationSupabaseDB().signOutSupabase();
              Navigator.pushReplacementNamed(context, AppRoutes.loginPage);
            },
            icon: const Icon(Icons.logout)),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        padding: const EdgeInsets.all(12),
        children: [
          CustomElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.cadastroPessoaPage);
            },
            icon: Icons.person_add,
            text: 'Cadastrar Pessoa',
          ),
          CustomElevatedButton(
            onPressed: () {},
            icon: Icons.add_shopping_cart,
            text: 'Cadastrar Produto',
          ),
          CustomElevatedButton(
            onPressed: () {},
            icon: Icons.account_balance,
            text: 'Cadastrar Fornecedor',
          ),
          CustomElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.listarPessoaPage);
            },
            icon: Icons.list_alt,
            text: 'Listar Pessoa',
          ),
          CustomElevatedButton(
            onPressed: () {},
            icon: Icons.line_style,
            text: 'Listar Produto',
          ),
          CustomElevatedButton(
            onPressed: () {},
            icon: Icons.featured_play_list_outlined,
            text: 'Listar Fornecedor',
          ),
        ],
      ),
    );
  }
}
