import 'package:aula_supase/components/pessoa_list_view.dart';
import 'package:aula_supase/database/operation_supabase.dart';
import 'package:aula_supase/models/cadastro_pessoas_model.dart';
import 'package:flutter/material.dart';

class ListaPessoaBody extends StatefulWidget {
  const ListaPessoaBody({super.key});

  @override
  State<ListaPessoaBody> createState() => _ListaPessoaBodyState();
}

class _ListaPessoaBodyState extends State<ListaPessoaBody> {
  List<PessoaModel>? _pessoas;

  Future<void> _atualizarPessoas() async {
    final db = OperationSupabaseDB();
    final listaPessoas = await db.getPessoas();
    setState(() {
      _pessoas = listaPessoas;
    });
  }

  @override
  void initState() {
    super.initState();
    _atualizarPessoas();
  }

  @override
  Widget build(BuildContext context) {
    if (_pessoas != null) {
      return PessoaListView(pessoas: _pessoas!);
    } else {
      return const Center(
          child: CircularProgressIndicator(
        color: Colors.blue,
      ));
    }
  }
}
