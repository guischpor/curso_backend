// ignore_for_file: public_member_api_docs, sort_constructors_first
class NoticiaModel {
  final int? id;
  final String titulo;
  final String descricao;
  final String imagem;
  final DateTime dataPublicacao;
  final DateTime? dataAtualizacao;

  NoticiaModel({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.imagem,
    required this.dataPublicacao,
    this.dataAtualizacao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'imagem': imagem,
      'dataPublicacao': dataPublicacao.millisecondsSinceEpoch,
      'dataAtualizacao': dataAtualizacao?.millisecondsSinceEpoch,
    };
  }

  factory NoticiaModel.fromJson(Map<String, dynamic> map) {
    return NoticiaModel(
      id: map['id'] ?? '',
      titulo: map['titulo'] as String,
      descricao: map['descricao'] as String,
      imagem: map['imagem'] as String,
      dataPublicacao:
          DateTime.fromMillisecondsSinceEpoch(map['dataPublicacao'] as int),
      dataAtualizacao: map['dataAtualizacao'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dataAtualizacao'] as int)
          : null,
    );
  }

  @override
  String toString() {
    return 'NoticiaModel(id: $id, titulo: $titulo, descricao: $descricao, imagem: $imagem, dataPublicacao: $dataPublicacao, dataAtualizacao: $dataAtualizacao)';
  }
}
