class Addresses {
  int id;
  String userId;
  String addressName;
  String country;
  String city;
  String district;
  String neighborhood;
  String street;
  String buildingNumber;
  String apartmentNumber;
  String postalCode;
  bool isPrimary;

  Addresses({
    required this.id,
    required this.userId,
    required this.addressName,
    required this.country,
    required this.city,
    required this.district,
    required this.neighborhood,
    required this.street,
    required this.buildingNumber,
    required this.apartmentNumber,
    required this.postalCode,
    required this.isPrimary,
  });

  factory Addresses.fromJson(Map<String, dynamic> json) => Addresses(
        id: json["id"],
        userId: json["user_id"],
        addressName: json["address_name"],
        country: json["country"],
        city: json["city"],
        district: json["district"],
        neighborhood: json["neighborhood"],
        street: json["street"],
        buildingNumber: json["building_number"],
        apartmentNumber: json["apartment_number"],
        postalCode: json["postal_code"],
        isPrimary: json["is_primary"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "address_name": addressName,
        "country": country,
        "city": city,
        "district": district,
        "neighborhood": neighborhood,
        "street": street,
        "building_number": buildingNumber,
        "apartment_number": apartmentNumber,
        "postal_code": postalCode,
        "is_primary": isPrimary,
      };
}
