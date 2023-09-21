// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Note {
  String titulo;
  String corpo;
  String data;
  String cor;
  Note({
    required this.titulo,
    required this.corpo,
    required this.data,
    required this.cor,
  });

  Note copyWith({
    String? titulo,
    String? corpo,
    String? data,
    String? cor,
  }) {
    return Note(
      titulo: titulo ?? this.titulo,
      corpo: corpo ?? this.corpo,
      data: data ?? this.data,
      cor: cor ?? this.cor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titulo': titulo,
      'corpo': corpo,
      'data': data,
      'cor': cor,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      titulo: map['titulo'] as String,
      corpo: map['corpo'] as String,
      data: map['data'] as String,
      cor: map['cor'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Note(titulo: $titulo, corpo: $corpo, data: $data, cor: $cor)';
  }

  @override
  bool operator ==(covariant Note other) {
    if (identical(this, other)) return true;

    return other.titulo == titulo && other.corpo == corpo && other.data == data && other.cor == cor;
  }

  @override
  int get hashCode {
    return titulo.hashCode ^ corpo.hashCode ^ data.hashCode ^ cor.hashCode;
  }
}
