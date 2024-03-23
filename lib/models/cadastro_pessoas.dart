final class PessoaModel {
  final int id;
  final DateTime createdAt;
  final String nome;
  final String email;
  final String cpf;
  final DateTime dataNascimento;
  final String telefone;

  const PessoaModel(
      {required this.id,
      required this.createdAt,
      required this.nome,
      required this.email,
      required this.cpf,
      required this.dataNascimento,
      required this.telefone});
}
