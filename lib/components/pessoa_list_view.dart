import 'package:aula_supase/database/operation_supabase.dart';
import 'package:aula_supase/models/cadastro_pessoas_model.dart';
import 'package:flutter/material.dart';

class PessoaListView extends StatefulWidget {
  final List<PessoaModel> pessoas;
  const PessoaListView({super.key, required this.pessoas});

  @override
  State<PessoaListView> createState() => _PessoaListViewState();
}

class _PessoaListViewState extends State<PessoaListView> {
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
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: ListTile(
          leading: IconButton(
            onPressed: () {
              final nomeController =
                  TextEditingController(text: _pessoas?[index].nome);
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Container(
                    height: 200,
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextField(
                          controller: nomeController,
                          decoration: const InputDecoration(
                            labelText: 'Editar Nome',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final db = OperationSupabaseDB();
                            await db.updateNomePessoa(
                              _pessoas![index].id,
                              nomeController.text,
                            );
                            String? nomeAntigo = _pessoas?[index].nome;
                            String nomeNovo = nomeController.text;
                            await _atualizarPessoas();
                            if (!context.mounted) return;
                            String texto =
                                'O nome $nomeAntigo foi atualizado para $nomeNovo!';
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(texto),
                              ),
                            );
                          },
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.blue),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.white),
                          ),
                          child: const Text('Salvar'),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.edit),
            color: Colors.cyanAccent,
          ),
          trailing: IconButton(
            onPressed: () async {
              final db = OperationSupabaseDB();
              await db.deletePessoa(_pessoas![index].id);
              String? nomeDeletado = _pessoas?[index].nome;
              await _atualizarPessoas();
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('A pessoa $nomeDeletado foi deletada!'),
              ));
            },
            icon: const Icon(Icons.delete),
            color: Colors.redAccent,
          ),
          tileColor: Colors.blue,
          textColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          title: Text(_pessoas![index].nome),
        ),
      ),
      itemCount: _pessoas?.length,
    );
  }
}
