class Contact {
  int? id;
  String editora;
  String livro;
  String autor;
  String paginas;
  bool isFavorite;
  Contact({
    this.id,
    required this.editora,
    required this.livro,
    required this.autor,
    required this.paginas,
    required this.isFavorite,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'editora': editora,
      'livro': livro,
      'autor': autor,
      'paginas': paginas,
      'isFavorite': (isFavorite) ? 1 : 0,
    };
  }

  factory Contact.fromMap(Map<String, Object?> map) => Contact(
        id: map['id'] as int?,
        editora: map['editora'] as String,
        livro: map['livro'] as String,
        autor: map['autor'] as String,
        paginas: map['paginas'] as String,
        isFavorite: map['isFavorite'] == 1,
      );
}

