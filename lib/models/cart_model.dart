class Cart {
  int id;
  String name;
  String cover;
  double price;
  String author;
  int bookId;
  String language;
  String description;

  Cart({
    required this.id,
    required this.name,
    required this.cover,
    required this.price,
    required this.author,
    required this.bookId,
    required this.language,
    required this.description,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        name: json["name"],
        cover: json["cover"],
        price: json["price"]?.toDouble(),
        author: json["author"],
        bookId: json["book_id"],
        language: json["language"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cover": cover,
        "price": price,
        "author": author,
        "book_id": bookId,
        "language": language,
        "description": description,
      };
}
