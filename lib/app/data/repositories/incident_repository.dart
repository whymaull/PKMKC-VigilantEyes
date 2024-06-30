import 'dart:convert';
import 'package:vigilanteyes/app/core/utils/constants.dart';
import 'package:vigilanteyes/app/data/entities/incident_entity.dart';
import 'package:vigilanteyes/app/data/entities/school_entity.dart';
import 'package:http/http.dart' as http;

class IncidentRepository {
  final tableName = "incidents";

  Future<List<IncidentEntity>> listAll(String id,
      {String? filter, String? keyword}) async {
    String keywordFilter = keyword != null ? '&kelas=like.%25$keyword%25' : '';
    String dateFilter = '';
    if (filter != null) {
      final now = DateTime.now();
      switch (filter) {
        case 'Hari ini':
          dateFilter =
              '&created_at=gte.${now.toIso8601String().split('T')[0]}T00:00:00Z&created_at=lt.${now.add(const Duration(days: 1)).toIso8601String().split('T')[0]}T00:00:00Z';
          break;
        case 'Seminggu':
          final weekAgo = now.subtract(const Duration(days: 7));
          dateFilter =
              '&created_at=gte.${weekAgo.toIso8601String().split('T')[0]}T00:00:00Z';
          break;
        case 'Sebulan':
          final monthAgo = now.subtract(const Duration(days: 30));
          dateFilter =
              '&created_at=gte.${monthAgo.toIso8601String().split('T')[0]}T00:00:00Z';
          break;
        case 'Tahun':
          final yearAgo = now.subtract(const Duration(days: 365));
          dateFilter =
              '&created_at=gte.${yearAgo.toIso8601String().split('T')[0]}T00:00:00Z';
          break;
      }
    }

    var url = Uri.parse(
        '$baseUrl/$tableName?select=*&id_school=eq.$id$dateFilter$keywordFilter');
    var headers = {'apikey': apiKey, 'Authorization': 'Bearer $apiKey'};
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => IncidentEntity.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load incidents');
    }
  }

  Future<List<IncidentEntity>> listAllByIdUser(String id) async {
    var url = Uri.parse('$baseUrl/$tableName?select=*&id_school=eq.$id');
    var headers = {'apikey': apiKey, 'Authorization': 'Bearer $apiKey'};
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => IncidentEntity.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load incidents');
    }
  }

  Future<List<IncidentEntity>> listAllTypeBullnById({
    required String idSchool,
    required String idBullying,
    String? filter,
  }) async {
    String dateFilter = '';
    if (filter != null) {
      final now = DateTime.now();
      switch (filter) {
        case 'Hari ini':
          dateFilter =
              '&created_at=gte.${now.toIso8601String().split('T')[0]}T00:00:00Z&created_at=lt.${now.add(const Duration(days: 1)).toIso8601String().split('T')[0]}T00:00:00Z';
          break;
        case 'Seminggu':
          final weekAgo = now.subtract(const Duration(days: 7));
          dateFilter =
              '&created_at=gte.${weekAgo.toIso8601String().split('T')[0]}T00:00:00Z';
          break;
        case 'Sebulan':
          final monthAgo = now.subtract(const Duration(days: 30));
          dateFilter =
              '&created_at=gte.${monthAgo.toIso8601String().split('T')[0]}T00:00:00Z';
          break;
        case 'Tahun':
          final yearAgo = now.subtract(const Duration(days: 365));
          dateFilter =
              '&created_at=gte.${yearAgo.toIso8601String().split('T')[0]}T00:00:00Z';
          break;
      }
    }

    var url = Uri.parse(
        '$baseUrl/$tableName?select=*&id_school=eq.$idSchool&type_bullying=eq.$idBullying$dateFilter');
    var headers = {'apikey': apiKey, 'Authorization': 'Bearer $apiKey'};
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => IncidentEntity.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load incidents');
    }
  }

  Future<List<IncidentEntity>> listAllIdSchoolIdCCTV({
    required String idSchool,
    required String idCCTV,
  }) async {
    var url = Uri.parse(
        '$baseUrl/$tableName?select=*&id_school=eq.$idSchool&id_cctv=eq.$idCCTV');
    var headers = {'apikey': apiKey, 'Authorization': 'Bearer $apiKey'};
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => IncidentEntity.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load incidents');
    }
  }

  Future<SchoolEntity?> findById(int id) async {
    var url = Uri.parse('$baseUrl/schools?school_id=eq.$id&select=*');
    var headers = {
      'apikey': apiKey,
      'Authorization': 'Bearer $apiKey',
      'Range': '0-9'
    };
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => SchoolEntity.fromJson(e))
          .toList()
          .first;
    } else {
      return null;
    }
  }
}
