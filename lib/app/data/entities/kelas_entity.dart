class KelasEntity {
  final int schoolId;
  final int idCctv;
  final String lokasiCctv;
  final DateTime createdAt;

  KelasEntity({
    required this.schoolId,
    required this.idCctv,
    required this.lokasiCctv,
    required this.createdAt,
  });

  factory KelasEntity.fromJson(Map<String, dynamic> json) => KelasEntity(
        schoolId: json["school_id"],
        idCctv: json["id_cctv"],
        lokasiCctv: json["lokasi_cctv"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "school_id": schoolId,
        "id_cctv": idCctv,
        "lokasi_cctv": lokasiCctv,
        "created_at": createdAt.toIso8601String(),
      };
}
