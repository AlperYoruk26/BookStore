class Cards {
  int id;
  String userId;
  String cardHolderName;
  String cardNumber;
  String cardExpiredDate;
  bool isPrimary;

  Cards({
    required this.id,
    required this.userId,
    required this.cardHolderName,
    required this.cardNumber,
    required this.cardExpiredDate,
    required this.isPrimary,
  });

  factory Cards.fromJson(Map<String, dynamic> json) => Cards(
        id: json["id"],
        userId: json["user_id"],
        cardHolderName: json["card_holder_name"],
        cardNumber: json["card_number"],
        cardExpiredDate: json["card_expired_date"],
        isPrimary: json["is_primary"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "card_holder_name": cardHolderName,
        "card_number": cardNumber,
        "card_expired_date": cardExpiredDate,
        "is_primary": isPrimary,
      };
}
