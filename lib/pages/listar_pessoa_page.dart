import 'package:aula_supase/database/operation_supabase.dart';
import 'package:flutter/material.dart';

class ListarPessoaPage extends StatefulWidget {
  const ListarPessoaPage({super.key});

  @override
  State<ListarPessoaPage> createState() => _ListarPessoaPageState();
}

class _ListarPessoaPageState extends State<ListarPessoaPage> {
  List<Map<String, dynamic>>? pessoas;

  Future<void> _atualizarPessoas() async {
    final db = OperationSupabaseDB();
    final listaPessoas = await db.getPessoas();
    setState(() {
      pessoas = listaPessoas;
    });
  }

  @override
  void initState() {
    super.initState();
    _atualizarPessoas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Listar Pessoa'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: IconButton(
              onPressed: () {
                final nomeController =
                    TextEditingController(text: pessoas?[index]['nome']);
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
                                pessoas?[index]['id'],
                                nomeController.text,
                              );
                              await _atualizarPessoas();
                              if (!context.mounted) return;
                              Navigator.pop(context);
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
                await db.deletePessoa(pessoas?[index]['id']);
                await _atualizarPessoas();
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
            title: Text(pessoas?[index]['nome']),
          ),
        ),
        itemCount: pessoas?.length,
      ),
    );
  }
}
