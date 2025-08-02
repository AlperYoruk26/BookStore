class Books {
  int id;
  int typeId;
  int categoryId;
  String name;
  String description;
  String language;
  String author;
  int sales;
  double price;
  String cover;

  Books({
    required this.id,
    required this.typeId,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.language,
    required this.author,
    required this.sales,
    required this.price,
    required this.cover,
  });

  factory Books.fromJson(Map<String, dynamic> json) => Books(
        id: json["id"],
        typeId: json["type_id"],
        categoryId: json["category_id"],
        name: json["name"],
        description: json["description"],
        language: json["language"],
        author: json["author"],
        sales: json["sales"],
        price: json["price"]?.toDouble(),
        cover: json["cover"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type_id": typeId,
        "category_id": categoryId,
        "name": name,
        "description": description,
        "language": language,
        "author": author,
        "sales": sales,
        "price": price,
        "cover": cover,
      };
}
