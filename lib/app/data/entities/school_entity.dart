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
        schoolid: json["school_id"],
        createdAt: DateTime.parse(json["created_at"]),
        schoolname: json["school_name"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "school_id": schoolid,
        "created_at": createdAt.toIso8601String(),
        "school_name": schoolname,
        "password": password,
      };
}
