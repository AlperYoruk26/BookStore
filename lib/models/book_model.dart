class BooksModel {
  int id;
  DateTime createdAt;
  String name;
  String author;
  String category;
  String cover;

  BooksModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.author,
    required this.category,
    required this.cover,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    name: json["name"],
    author: json["author"],
    category: json["category"],
    cover: json["cover"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "name": name,
    "author": author,
    "category": category,
    "cover": cover,
  };
}
