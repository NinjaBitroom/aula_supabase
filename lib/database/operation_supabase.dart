import 'package:aula_supase/models/cadastro_pessoas_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class OperationSupabaseDB {
  final supabase = Supabase.instance.client;

  Future<void> setPessoa(String nome, String email, String cpf,
      DateTime dataNasc, String telefone) async {
    await supabase.from('cadastroPessoas').insert({
      'nome': nome,
      'email': email,
      'cpf': cpf,
      'data_nascimento': dataNasc.toString(),
      'telefone': telefone,
    });
  }

  Future<void> createNewUserSupabase(String email, String password) async {
    final AuthResponse res = await supabase.auth.signUp(
      email: email,
      password: password,
    );
    final Session? session = res.session;
    final User? user = res.user;
    print(session);
    print(user);
  }

  Future<void> signInUserSupabase(String email, String password) async {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final Session? session = res.session;
    final User? user = res.user;
    print('session: $session');
    print('user: $user');
  }

  Future<void> signOutSupabase() async {
    await supabase.auth.signOut();
  }

  Future<List<PessoaModel>> getPessoas() async {
    final json = await supabase.from('cadastroPessoas').select();
    final listaPessoas = <PessoaModel>[];
    for (final pessoa in json) {
      listaPessoas.add(PessoaModel.fromJson(pessoa));
    }
    return listaPessoas;
  }

  Future<void> deletePessoa(int id) async {
    await supabase.from('cadastroPessoas').delete().match({'id': id});
  }

  Future<void> updateNomePessoa(int id, String novoNome) async {
    await supabase
        .from('cadastroPessoas')
        .update({'nome': novoNome}).match({'id': id});
  }
}
