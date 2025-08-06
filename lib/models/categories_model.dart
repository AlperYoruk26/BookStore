class Categories {
  int id;
  String name;
  String language;

  Categories({
    required this.id,
    required this.name,
    required this.language,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"],
        name: json["name"],
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "language": language,
      };
}
