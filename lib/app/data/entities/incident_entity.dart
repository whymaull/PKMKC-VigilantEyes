class IncidentEntity {
  final int idIncidents;
  final DateTime createdAt;
  final int idCctv;
  final int idSchool;
  final String kelas;
  final String imageVideo;
  final String description;

  IncidentEntity({
    required this.idIncidents,
    required this.createdAt,
    required this.idCctv,
    required this.idSchool,
    required this.kelas,
    required this.imageVideo,
    required this.description,
  });

  factory IncidentEntity.fromJson(Map<String, dynamic> json) => IncidentEntity(
        idIncidents: json["id_incidents"],
        createdAt: DateTime.parse(json["created_at"]),
        idCctv: json["id_cctv"],
        idSchool: json["id_school"],
        kelas: json["kelas"],
        imageVideo: json["image_video"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id_incidents": idIncidents,
        "created_at": createdAt.toIso8601String(),
        "id_cctv": idCctv,
        "id_school": idSchool,
        "kelas": kelas,
        "image_video": imageVideo,
        "description": description,
      };
}
