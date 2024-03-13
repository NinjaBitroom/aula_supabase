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
}
