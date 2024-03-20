import 'package:supabase_flutter/supabase_flutter.dart';

class OperationSupabaseDB {
  final supabase = Supabase.instance.client;

  Future<void> insertRowSupabase(
      String nome, String email, String telefone) async {
    await supabase.from('cadastrarPessoas').insert({
      'nome': nome,
      'email': email,
      'telefone': telefone,
    });
  }

  Future<List<Map<String, dynamic>>> getPessoas() async {
    return await supabase.from('cadastrarPessoas').select();
  }

  Future<void> deletePessoa(int id) async {
    await supabase.from('cadastrarPessoas').delete().match({'id': id});
  }
}
