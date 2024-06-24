class UserEntity {
  final int userId;
  final DateTime createdAt;
  final String username;
  final String email;
  final String uuid;
  final dynamic idnotification;
  final int schoolId;

  UserEntity({
    required this.userId,
    required this.createdAt,
    required this.username,
    required this.email,
    required this.uuid,
    required this.idnotification,
    required this.schoolId,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        username: json["username"],
        email: json["email"],
        uuid: json["uuid"],
        idnotification: json["idnotification"],
        schoolId: json["school_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "username": username,
        "email": email,
        "uuid": uuid,
        "idnotification": idnotification,
        "school_id": schoolId,
      };
}
