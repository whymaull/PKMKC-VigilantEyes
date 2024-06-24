class UserModel {
  String? name;
  String? phone;
  String? email;
  String? img;
  String? address;
  String? uuid;
  String? password;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.img,
    this.address,
    this.uuid,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        img: json['img'],
        address: json['address'],
        uuid: json['uuid'],
        password: json['password']);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'img': img,
        'address': address,
        'uuid': uuid,
        'password': password,
      };
}
