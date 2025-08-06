class ProfileInfo {
  String id;
  String? avatarUrl;
  DateTime createdAt;

  ProfileInfo({
    required this.id,
    required this.avatarUrl,
    required this.createdAt,
  });

  factory ProfileInfo.fromJson(Map<String, dynamic> json) => ProfileInfo(
        id: json["id"],
        avatarUrl: json["avatar_url"] as String,
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "avatar_url": avatarUrl,
        "created_at": createdAt.toIso8601String(),
      };
}
