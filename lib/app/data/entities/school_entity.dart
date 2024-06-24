class SchoolEntity {
  final int schoolid;
  final DateTime createdAt;
  final String schoolname;
  final String password;

  SchoolEntity({
    required this.schoolid,
    required this.createdAt,
    required this.schoolname,
    required this.password,
  });

  factory SchoolEntity.fromJson(Map<String, dynamic> json) => SchoolEntity(
        schoolid: json["schoolid"],
        createdAt: DateTime.parse(json["created_at"]),
        schoolname: json["schoolname"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "schoolid": schoolid,
        "created_at": createdAt.toIso8601String(),
        "schoolname": schoolname,
        "password": password,
      };
}
