class ClientEntity {
  final int id;
  final DateTime createdAt;
  final String name;
  final String address;
  final String gender;
  final int phone;
  final String email;
  final String password;
  final String uuid;
  final String userName;
  final String image;
  final String tokenClient;
  final String dateOfBirth;

  ClientEntity({
    required this.dateOfBirth,
    required this.tokenClient,
    required this.gender,
    required this.id,
    required this.image,
    required this.uuid,
    required this.createdAt,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.password,
    required this.userName,
  });

  factory ClientEntity.fromJson(Map<String, dynamic> json) => ClientEntity(
        image: json["image"],
        tokenClient: json["token_client"],
        gender: json["gender"],
        dateOfBirth: json["date_of_birth"],
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        uuid: json["uuid"],
        userName: json["user_name"],
      );

  Map<String, dynamic> toJson() => {
        "token_client": tokenClient,
        "gender": gender,
        "date_of_birth": dateOfBirth,
        "image": image,
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "name": name,
        "address": address,
        "phone": phone,
        "email": email,
        "password": password,
        "uuid": uuid,
        "user_name": userName,
      };
}
