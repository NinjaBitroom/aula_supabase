import 'package:aula_supase/database/operationSupabase.dart';
import 'package:flutter/material.dart';

class ListarPessoaPage extends StatefulWidget {
  const ListarPessoaPage({super.key});

  @override
  State<ListarPessoaPage> createState() => _ListarPessoaPageState();
}

class _ListarPessoaPageState extends State<ListarPessoaPage> {
  late Future<List<Map<String, dynamic>>> pessoas;

  @override
  void initState() {
    super.initState();
    final db = OperationSupabaseDB();
    pessoas = db.getPessoas();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: pessoas,
      builder: (context, snap) {
        Widget body;
        if (snap.hasData) {
          body = ListView.builder(
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const AlertDialog(
                        content: Text('text'),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit),
                  color: Colors.cyanAccent,
                ),
                trailing: IconButton(
                  onPressed: () {
                    final db = OperationSupabaseDB();
                    db.deletePessoa(snap.data![index]['id']);
                    setState(() {
                      pessoas = db.getPessoas();
                    });
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
                title: Text(snap.data![index]['nome']),
              ),
            ),
            itemCount: snap.data!.length,
          );
        } else {
          body = const CircularProgressIndicator();
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            title: const Text('Listar Pessoa'),
          ),
          body: body,
        );
      },
    );
  }
}
