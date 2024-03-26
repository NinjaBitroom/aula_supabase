final class PessoaModel {
  final int id;
  final DateTime createdAt;
  final String nome;
  final String email;
  final String cpf;
  final DateTime dataNascimento;
  final String telefone;

  const PessoaModel({
    required this.id,
    required this.createdAt,
    required this.nome,
    required this.email,
    required this.cpf,
    required this.dataNascimento,
    required this.telefone,
  });

  factory PessoaModel.fromJson(Map<String, dynamic> json) {
    final int id = json['id'];
    final DateTime createdAt = DateTime.parse(json['created_at']);
    final String nome = json['nome'];
    final String email = json['email'];
    final String cpf = json['cpf'];
    final DateTime dataNascimento = DateTime.parse(json['data_nascimento']);
    final String telefone = json['telefone'];

    return PessoaModel(
      id: id,
      createdAt: createdAt,
      nome: nome,
      email: email,
      cpf: cpf,
      dataNascimento: dataNascimento,
      telefone: telefone,
    );
  }
}
