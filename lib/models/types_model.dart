class Types {
  int id;
  String name;
  String language;

  Types({
    required this.id,
    required this.name,
    required this.language,
  });

  factory Types.fromJson(Map<String, dynamic> json) => Types(
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
