import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NoticiaModel {
  final int id;
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

  factory NoticiaModel.fromMap(Map<String, dynamic> map) {
    return NoticiaModel(
      id: map['id'] as int,
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

  String toJson() => json.encode(toMap());

  factory NoticiaModel.fromJson(String source) =>
      NoticiaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NoticiaModel(id: $id, titulo: $titulo, descricao: $descricao, imagem: $imagem, dataPublicacao: $dataPublicacao, dataAtualizacao: $dataAtualizacao)';
  }
}
