import 'package:aula_supase/components/lista_pessoa_body.dart';
import 'package:flutter/material.dart';

final class ListaPessoaPage extends StatefulWidget {
  const ListaPessoaPage({super.key});

  @override
  State<ListaPessoaPage> createState() => _ListaPessoaPageState();
}

final class _ListaPessoaPageState extends State<ListaPessoaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Listar Pessoa'),
      ),
      body: const ListaPessoaBody(),
    );
  }
}
