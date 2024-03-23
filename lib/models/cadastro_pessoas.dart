class PessoaModel {
  int id;
  DateTime createdAt;
  String nome;
  String email;
  String cpf;
  DateTime dataNascimento;
  String telefone;

  PessoaModel(
      {required this.id,
      required this.createdAt,
      required this.nome,
      required this.email,
      required this.cpf,
      required this.dataNascimento,
      required this.telefone});
}
