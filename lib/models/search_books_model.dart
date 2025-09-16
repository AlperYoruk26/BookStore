class SearchBooks {
  int id;
  String name;
  String author;
  double price;
  String cover;

  SearchBooks({
    required this.id,
    required this.name,
    required this.author,
    required this.price,
    required this.cover,
  });

  factory SearchBooks.fromJson(Map<String, dynamic> json) => SearchBooks(
        id: json["id"],
        name: json["name"],
        author: json["author"],
        price: json["price"]?.toDouble(),
        cover: json["cover"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "author": author,
        "price": price,
        "cover": cover,
      };
}
