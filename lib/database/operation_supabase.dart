import 'package:aula_supase/models/cadastro_pessoas_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class OperationSupabaseDB {
  final supabase = Supabase.instance.client;

  Future<void> setPessoa(String nome, String email, String cpf, String dataNasc,
      String telefone) async {
    await supabase.from('cadastroPessoas').insert({
      'nome': nome,
      'email': email,
      'cpf': cpf,
      'data_nascimento': dataNasc,
      'telefone': telefone,
    });
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
